/obj/machinery/power/rbmk2
	name = "\improper RB-MK2 reactor"
	desc = "Radioscopical Bluespace Mark 2 reactor, or RB MK2 for short, is a new state-of-the-art power generation technology that uses bluespace magic \
	to directly transfer radioactive tritium particles into energy with minimal external heat generation (compared to open-air combustion). \
	While it is said this is safer than a Supermatter Crystal, improper cooling management of internal as well external gasses may lead to a mini-nuclear meltdown.\n\
	To start up a reactor, fill a RB-MK2 rod up with tritium, or a mix of gas containing tritium, and insert it into the reactor. The tritium will slowly get processed into energy."
	icon = 'modular_zubbers/icons/obj/equipment/burger_reactor.dmi'
	icon_state = "platform"
	base_icon_state = "platform"
	density = FALSE
	anchored = TRUE
	use_power = NO_POWER_USE

	interaction_flags_atom = INTERACT_ATOM_ATTACK_HAND | INTERACT_ATOM_REQUIRES_ANCHORED

	circuit = /obj/item/circuitboard/machine/rbmk2

	var/active = FALSE //Is this machine active?
	var/overclocked = FALSE //Is this machine overclocked, consuming more tritium?
	var/venting = TRUE //Is this machine venting the gasses?
	var/safety = TRUE //Is the safety active?
	var/cooling_limiter = 0 //Current cooling limiter amount.
	var/cooling_limiter_max = 90 //Maximum possible cooling limiter amount.

	var/obj/item/tank/rbmk2_rod/stored_rod //Currently stored rbmk2 rod.
	var/datum/gas_mixture/buffer_gasses //Gas that has yet to be leaked out due to not venting fast enough.
	var/mutable_appearance/heat_overlay //Vent heat overlay.
	var/mutable_appearance/meter_overlay //Inactive tritium meter display.

	var/last_power_generation = 0 //Display purposes. Do not edit.
	var/last_tritium_consumption = 0 //Display purposes. Do not edit.

	var/gas_consumption_base = 0.001 //How much gas gets consumed, in moles, per cycle.
	var/gas_consumption_heat = 0.02 //How much gas gets consumed, in moles, per cycle, per 1000 kelvin.

	var/base_power_generation = 3900000 //How many joules of power to add per mole of tritium processed.

	//Upgradable stats.
	var/power_efficiency = 1 //A multiplier of base_power_generation. Also has an effect on heat generation. Improved via capacitors.
	var/vent_pressure = 200 //Pressure, in kPa, that the buffer releases the gas to. Improved via servos.
	var/vent_volume = 300 //How large is the buffer vent, in liters. Improved via matter bins.



/obj/machinery/power/rbmk2/Initialize(mapload)
	. = ..()
	set_wires(new /datum/wires/rbmk2(src))
	buffer_gasses = new(vent_volume)
	heat_overlay = mutable_appearance(icon, "platform_heat", alpha=255)
	heat_overlay.appearance_flags |= RESET_COLOR
	meter_overlay = mutable_appearance(icon, "platform_rod_glow_5", alpha=255)
	heat_overlay.appearance_flags |= RESET_COLOR
	connect_to_network()
	process() //Process once to update everything.

/obj/machinery/power/rbmk2/return_analyzable_air()
	. = list()
	if(stored_rod) . += stored_rod.air_contents
	. += buffer_gasses

/obj/machinery/power/rbmk2/Destroy()
	remove_rod()
	. = ..()

/obj/machinery/power/rbmk2/preloaded/Initialize(mapload)
	. = ..()
	stored_rod = new /obj/item/tank/rbmk2_rod/preloaded(src)
	START_PROCESSING(SSmachines, src)
	update_appearance()

/obj/machinery/power/rbmk2/attackby(obj/item/attacking_item, mob/living/user, params)
	if(!user.combat_mode)
		if(!active && istype(attacking_item,/obj/item/tank/rbmk2_rod/)) //Insert a rod.
			return add_rod(attacking_item)
	. = ..()

/obj/machinery/power/rbmk2/multitool_act(mob/living/user, obj/item/multitool/tool)
	if(panel_open)
		wires.interact(user)
		return TRUE

/obj/machinery/power/rbmk2/multitool_act_secondary(mob/living/user, obj/item/tool)
	if(panel_open)
		wires.interact(user)
		return TRUE

/obj/machinery/power/rbmk2/wirecutter_act(mob/living/user, obj/item/tool)
	if(panel_open)
		wires.interact(user)
		return TRUE

/obj/machinery/power/rbmk2/wirecutter_act_secondary(mob/living/user, obj/item/tool)
	if(panel_open)
		wires.interact(user)
		return TRUE

//Deconstruct.
/obj/machinery/power/rbmk2/crowbar_act(mob/living/user, obj/item/attack_item)
	if(!active && default_deconstruction_crowbar(attack_item))
		return TRUE

/obj/machinery/power/rbmk2/crowbar_act_secondary(mob/living/user, obj/item/attack_item)
	if(!active && default_deconstruction_crowbar(attack_item))
		return TRUE

//Open the panel.
/obj/machinery/power/rbmk2/screwdriver_act(mob/living/user, obj/item/attack_item)
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, attack_item))
		return TRUE

/obj/machinery/power/rbmk2/screwdriver_act_secondary(mob/living/user, obj/item/attack_item)
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, attack_item))
		return TRUE

/obj/machinery/power/rbmk2/on_set_panel_open(old_value)
	. = ..()
	update_appearance()

//Toggle the reactor on/off.
/obj/machinery/power/rbmk2/wrench_act(mob/living/user, obj/item/tool)
	if(toggle())
		return TRUE

/obj/machinery/power/rbmk2/wrench_act_secondary(mob/living/user, obj/item/tool)
	if(toggle())
		return TRUE

//Remove the rod.
/obj/machinery/power/rbmk2/AltClick(mob/living/user)
	if(!active && stored_rod && remove_rod())
		return TRUE

/obj/machinery/power/rbmk2/proc/remove_rod()
	if(!stored_rod)
		return FALSE
	if(active)
		return FALSE
	var/turf/T = get_turf(src)
	if(!T)
		return FALSE
	stored_rod.forceMove(T)
	stored_rod = null
	meter_overlay.alpha = 0
	update_appearance()
	playsound(src, 'sound/machines/eject.ogg', 50, TRUE, extrarange = -3)
	return TRUE

/obj/machinery/power/rbmk2/proc/add_rod(var/obj/item/tank/rbmk2_rod/desired_rod)
	if(stored_rod && !remove_rod())
		return FALSE
	if(active)
		return FALSE
	desired_rod.forceMove(src)
	stored_rod = desired_rod
	meter_overlay.alpha = 255
	update_appearance()
	START_PROCESSING(SSmachines, src)
	return TRUE

/obj/machinery/power/rbmk2/proc/toggle(var/desired_state=!active)

	if(active == desired_state)
		return

	if(desired_state)
		if(!stored_rod)
			to_chat(usr, span_warning("There is no rod inserted in [src]!"))
			return
		if(!anchored)
			to_chat(usr, span_warning("[src] needs to be anchored first!"))
			return

	active = desired_state

	if(!active)
		meter_overlay.alpha = 0

	update_appearance()

	playsound(src, 'sound/machines/eject.ogg', 50, TRUE, extrarange = -3)

	return TRUE

/obj/machinery/power/rbmk2/RefreshParts()
	. = ..()

	//Requires x4 capacitors
	var/power_efficiency_mul = 0
	for(var/datum/stock_part/capacitor/new_capacitor in component_parts)
		power_efficiency_mul += new_capacitor.tier * 0.25
	power_efficiency = initial(power_efficiency) * power_efficiency_mul

	//Requires x2 matter bins
	var/vent_volume_mul = 0
	for(var/datum/stock_part/matter_bin/new_matter_bin in component_parts)
		vent_volume_mul += new_matter_bin.tier * 0.5
	vent_volume = initial(vent_volume) * vent_volume_mul
	if(buffer_gasses) buffer_gasses.volume = vent_volume

	//Requires x4 servos
	var/vent_pressure_multiplier = 0
	for(var/datum/stock_part/servo/new_servo in component_parts)
		vent_pressure_multiplier += new_servo.tier * 0.25
	vent_pressure = initial(vent_pressure) * vent_pressure_multiplier


/obj/machinery/power/rbmk2/examine(mob/user)
	. = ..()

	. += "It is[!active?"n't":""] running."

	if(!powernet)
		. += span_warning("It is not connected to a power cable.")

	if(!stored_rod)
		. += span_warning("It it is missing a RB-MK2 reactor rod.")

	if(active)
		. += "It is currently consuming [last_tritium_consumption] moles of tritium per cycle, producing [display_power(last_power_generation)]."

/obj/machinery/power/rbmk2/examine_more(mob/user)
	. = ..()
	. += "It is running at <b>[power_efficiency*100]%</b> power efficiency."
	. += "It an internal gas buffer volume of <b>[vent_volume]L</b>."
	. += "It can output in environments up to <b>[vent_pressure]kPa</b>."

/obj/machinery/power/rbmk2/update_icon_state()

	if(stored_rod)
		if(active)
			icon_state = "[base_icon_state]_closed"
		else
			icon_state = "[base_icon_state]_open"
	else
		icon_state = base_icon_state

	return ..()

/obj/machinery/power/rbmk2/update_overlays()
	. = ..()
	if(panel_open) . += "platform_panel"
	. += heat_overlay
	. += meter_overlay

/obj/machinery/power/rbmk2/process()

	if(!stored_rod)
		meter_overlay.alpha = 0
		heat_overlay.alpha = 0
		update_appearance()
		return

	var/datum/gas_mixture/rod_mix = stored_rod.air_contents
	if(!rod_mix || !rod_mix.gases)
		meter_overlay.alpha = 0
		heat_overlay.alpha = 0
		update_appearance()
		return

	stored_rod.handle_tolerances(2)

	if(active && safety && (rod_mix.return_pressure() > TANK_LEAK_PRESSURE*0.8 || rod_mix.temperature > TANK_MELT_TEMPERATURE*0.8))
		toggle(FALSE)

	 //I have no fucking clue why, but not doing this causes shit to not work.

	if(active && venting)
		heat_overlay.color = heat2colour(rod_mix.temperature)
		heat_overlay.alpha = min(5 + rod_mix.temperature * (1/1000) * 255,255)
	else
		heat_overlay.alpha = 0

	if(!active && rod_mix.gases[/datum/gas/tritium])
		var/meter_icon_num = CEILING( min(rod_mix.gases[/datum/gas/tritium][MOLES] / 100, 1) * 5, 1)
		if(meter_icon_num > 0)
			meter_overlay.alpha = 255
			meter_overlay.icon_state = "platform_rod_glow_[meter_icon_num]"
			var/return_pressure_mod = rod_mix.return_pressure() / TANK_FRAGMENT_PRESSURE
			meter_overlay.color = rgb(return_pressure_mod*255,255 - return_pressure_mod*255,0)
		else
			meter_overlay.alpha = 0
	else
		meter_overlay.alpha = 0

	update_appearance()

	var/turf/T
	var/datum/gas_mixture/turf_air
	if(isturf(loc))
		T = loc
		turf_air = T.return_air()

	if(!active)
		if(turf_air && venting)
			buffer_gasses.pump_gas_to(turf_air,vent_pressure*2) //Goodbye, buffer gasses.
			transfer_rod_temperature(turf_air,allow_cooling_limiter=FALSE)
		return

	var/amount_to_consume = (gas_consumption_base + (rod_mix.temperature/1000)*gas_consumption_heat)*(overclocked ? 1.25 : 1)*(0.75 + power_efficiency*0.25)
	if(!amount_to_consume)
		return

	//Remove gas from the rod to be processed.
	var/datum/gas_mixture/consumed_mix = rod_mix.remove(amount_to_consume)

	//Do power generation here.
	consumed_mix.assert_gas(/datum/gas/tritium)
	if(consumed_mix.gases && consumed_mix.gases[/datum/gas/tritium])
		last_tritium_consumption = consumed_mix.gases[/datum/gas/tritium][MOLES]
		radiation_pulse(src,min( (last_tritium_consumption/0.02)*4 ,GAS_REACTION_MAXIMUM_RADIATION_PULSE_RANGE),threshold = RAD_FULL_INSULATION)
		if(powernet)
			last_power_generation = last_tritium_consumption * power_efficiency * base_power_generation
			if(last_power_generation)
				src.add_avail(last_power_generation)
		consumed_mix.remove_specific(/datum/gas/tritium, last_tritium_consumption*0.80) //80% of used tritium gets deleted. The rest gets thrown into the air.
		var/our_heat_capacity = consumed_mix.heat_capacity()
		if(our_heat_capacity > 0)
			consumed_mix.temperature += (800/our_heat_capacity)*(overclocked ? 2 : 1)*power_efficiency
	else
		toggle(FALSE)

	//The gasses that we consumed go into the buffer, to be released in the air.
	buffer_gasses.merge(consumed_mix)

	//Share the remaining temperature with the rod mix itself.
	transfer_rod_temperature(buffer_gasses)

	if(buffer_gasses.return_pressure() > TANK_FRAGMENT_PRESSURE) //uh oh, backflow!
		buffer_gasses.equalize(rod_mix)

	//Vent excess gas.
	if(turf_air && venting)
		buffer_gasses.pump_gas_to(turf_air,vent_pressure) //Goodbye, buffer gasses.
		transfer_rod_temperature(turf_air,allow_cooling_limiter=TRUE)

	return TRUE

/obj/machinery/power/rbmk2/proc/transfer_rod_temperature(var/datum/gas_mixture/gas_source,var/allow_cooling_limiter=TRUE)

	var/datum/gas_mixture/rod_mix = stored_rod.air_contents

	var/rod_mix_heat_capacity = rod_mix.heat_capacity()
	if(rod_mix_heat_capacity <= 0)
		return FALSE

	var/gas_source_heat_capacity = gas_source.heat_capacity()
	if(gas_source_heat_capacity <= 0)
		return FALSE

	var/rod_mix_temperature = rod_mix.temperature
	var/gas_source_temperature = gas_source.temperature


	var/delta_temperature = rod_mix_temperature - gas_source_temperature
	if(delta_temperature == 0)
		return FALSE


	var/energy_transfer = delta_temperature*rod_mix_heat_capacity*gas_source_heat_capacity/(rod_mix_heat_capacity+gas_source_heat_capacity)

	var/temperature_change = (energy_transfer/rod_mix_heat_capacity)
	if(allow_cooling_limiter && temperature_change > 0) //Cooling!
		temperature_change *= clamp(1 - cooling_limiter*0.01,0,1) //Clamped in case of adminbus fuckery.

	rod_mix.temperature -= temperature_change*0.65
	gas_source.temperature += temperature_change

	return TRUE
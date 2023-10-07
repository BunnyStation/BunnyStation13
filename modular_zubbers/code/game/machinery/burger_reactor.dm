/obj/item/circuitboard/machine/rbmk2
	name = "RB-MK2 reactor"
	greyscale_colors = CIRCUIT_COLOR_ENGINEERING
	build_path = /obj/machinery/power/rbmk2
	req_components = list(
		/obj/item/stack/cable_coil = 4,
		/obj/item/stack/sheet/mineral/uranium = 4,
		/obj/item/stack/ore/bluespace_crystal = 1,
		/datum/stock_part/capacitor = 4,
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/servo = 4
	)
	needs_anchored = TRUE


/datum/design/board/rbmk2_reactor
	name = "RB-MK2 Reactor Board"
	desc = "The circuit board for a RB-MK2 reactor."
	id = "rbmk2_reactor"
	build_path = /obj/item/circuitboard/machine/rbmk2
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/rbmk2_rod
	name = "RB-MK2 Reactor Rod"
	desc = "A specialized rod for the RB-MK2 reactor."
	id = "rbmk2_rod"
	build_type = PROTOLATHE | AWAY_LATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*5, /datum/material/uranium = SMALL_MATERIAL_AMOUNT*2)
	construction_time = 100
	build_path = /obj/item/tank/rbmk2_rod
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/techweb_node/rbmk2
	id = "rbmk2"
	display_name = "RB-MK2"
	description = "The latest in dangerous Nanotrasen power generation."
	prereq_ids = list("engineering")
	design_ids = list(
		"rbmk2_reactor",
		"rbmk2_rod"
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3000)

/obj/item/tank/rbmk2_rod
	name = "\improper RB-MK2 reactor rod"
	desc = "A rod for the RB-MK2 reactor. Usually filled with tritium."
	icon = 'modular_zubbers/icons/obj/equipment/burger_reactor.dmi'
	icon_state = "platform_rod"
	inhand_icon_state = null
	pixel_y = -16
	worn_icon_state = null
	tank_holder_icon_state = null
	flags_1 = CONDUCT_1
	slot_flags = null //they have no straps!
	force = 8

/obj/item/tank/rbmk2_rod/preloaded/populate_gas()
	air_contents.assert_gas(/datum/gas/tritium)
	air_contents.gases[/datum/gas/tritium][MOLES] = 50



/obj/item/tank/rbmk2_rod/atom_destruction(damage_flag)
	. = ..()
	if(loc && istype(loc,/obj/machinery/power/rbmk2))
		var/obj/machinery/power/rbmk2/M = loc
		if(QDELETED(src) || QDELETED(M))
			M.stored_rod = null
		else
			M.remove_rod()
		if(!QDELETED(M))
			radiation_pulse(M,min(M.last_tritium_consumption*100,GAS_REACTION_MAXIMUM_RADIATION_PULSE_RANGE),threshold = RAD_FULL_INSULATION)
			var/explosion_strength = min(M.last_tritium_consumption*5,10)
			explosion(M, devastation_range = 1 + explosion_strength*0.1, heavy_impact_range = 1 + explosion_strength*0.2, light_impact_range = 3 + explosion_strength*0.5, flash_range = 4 + explosion_strength)
			if(!QDELETED(M))
				qdel(M) //Don't know why it'd live after this, but just in case.

/datum/wires/rbmk2
	holder_type = /obj/machinery/power/rbmk2
	proper_name = "RB-MK2"

/datum/wires/rbmk2/New(atom/holder)
	wires = list(
		WIRE_OVERCLOCK,
		WIRE_ACTIVATE,
		WIRE_DISABLE,
		WIRE_THROW,
		WIRE_LOCKDOWN
	)
	add_duds(2)
	. = ..()

/datum/wires/rbmk2/interactable(mob/user)
	if(!..())
		return FALSE
	return
	var/obj/machinery/power/rbmk2/M = holder
	return M.panel_open

/datum/wires/rbmk2/get_status()
	var/obj/machinery/power/rbmk2/M = holder
	. = list()
	. += "The overclock light is [M.overclocked ? "blinking blue" : "off"]."
	. += "The power light is [M.active ? "yellow" : "off"]."
	. += "The occupancy light is [M.stored_rod ? "orange" : "off"]."
	. += "The vent light is [M.venting ? "green" : "flashing red"]."

/datum/wires/rbmk2/on_pulse(wire)
	var/obj/machinery/power/rbmk2/M = holder
	switch(wire)
		if(WIRE_OVERCLOCK)
			M.overclocked = !M.overclocked
		if(WIRE_ACTIVATE)
			M.toggle()
		if(WIRE_DISABLE)
			M.toggle(FALSE)
		if(WIRE_THROW)
			M.remove_rod()
		if(WIRE_LOCKDOWN)
			M.venting = !M.venting

/datum/wires/rbmk2/on_cut(wire, mend, source)
	var/obj/machinery/power/rbmk2/M = holder
	switch(wire)
		if(WIRE_OVERCLOCK)
			if(mend)
				M.overclocked = FALSE
		if(WIRE_ACTIVATE)
			M.toggle(mend)
		if(WIRE_DISABLE)
			if(mend)
				M.toggle(FALSE)
		if(WIRE_THROW)
			if(mend)
				M.remove_rod()
		if(WIRE_LOCKDOWN)
			if(mend)
				M.venting = FALSE

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

	wires = /datum/wires/rbmk2

	circuit = /obj/item/circuitboard/machine/rbmk2

	var/active = FALSE
	var/overclocked = FALSE
	var/venting = TRUE

	var/obj/item/tank/rbmk2_rod/stored_rod
	var/datum/gas_mixture/buffer_gasses //Gas that has yet to be leaked out due to not venting fast enough.
	var/last_power_generation = 0
	var/last_tritium_consumption = 0

	//Unupgradable stats.

	//SSmachines runs once every 2 seconds.
	//50 moles of tritium at room temperature generation should last ~120 minutes.
	//Thus, the consumption rate should be 50/(120*60*0.5) = 0.01388888888

	var/gas_consumption_base = 0.014 //How much gas gets consumed, in moles, per cycle.
	var/gas_consumption_heat = 0.02 //How much gas gets consumed, in moles, per cycle, per 1000 kelvin.

	//18 unupgraded of these things should be equal to 1 supermatter setup, which is like 1MW.
	//Which means that 0.014*18 consumed should be 1000000 W.
	// (1000000/ (0.014*18)) = 3968253

	//Upgradable stats.
	var/base_power_generation = 3900000 //How many joules of power to add per mole of tritium processed. Improved via capacitors. Arbitrary number.
	var/power_efficiency = 1 //A multiplier of base_power_generation. Improved via capacitors.
	var/vent_pressure = 300 //Pressure, in kPa, that the buffer releases the gas to. Improved via servos.
	var/buffer_gas_thermal_conductivity = 0.1 //Lower is better. Improved via matter bins.

	var/mutable_appearance/heat_overlay
	var/mutable_appearance/meter_overlay

/obj/machinery/power/rbmk2/Initialize(mapload)
	. = ..()
	buffer_gasses = new()
	heat_overlay = mutable_appearance(icon, "platform_heat", alpha=0)
	meter_overlay = mutable_appearance(icon, "platform_rod_glow_5", alpha=0)
	connect_to_network()
	process() //Process once to update everything.

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

		if(panel_open && is_wire_tool(attacking_item)) //Show the wires.
			return wires.interact(user)

		if(!active && istype(attacking_item,/obj/item/tank/rbmk2_rod/)) //Insert a rod.
			return add_rod(attacking_item)

	. = ..()

//Deconstruct.
/obj/machinery/power/rbmk2/crowbar_act(mob/living/user, obj/item/attack_item)
	if(!active && default_deconstruction_crowbar(attack_item))
		return TOOL_ACT_TOOLTYPE_SUCCESS

//Open the panel.
/obj/machinery/power/rbmk2/screwdriver_act(mob/living/user, obj/item/attack_item)
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, attack_item))
		return TOOL_ACT_TOOLTYPE_SUCCESS

/obj/machinery/power/rbmk2/on_set_panel_open(old_value)
	. = ..()
	update_appearance()

//Toggle the reactor on/off.
/obj/machinery/power/rbmk2/wrench_act(mob/living/user, obj/item/tool)
	if(toggle())
		return TOOL_ACT_TOOLTYPE_SUCCESS

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
	var/thermal_conductivity_divisor = 0
	for(var/datum/stock_part/matter_bin/new_matter_bin in component_parts)
		thermal_conductivity_divisor += new_matter_bin.tier * 0.5
	buffer_gas_thermal_conductivity = initial(buffer_gas_thermal_conductivity) / thermal_conductivity_divisor

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
	. += "It has a thermal conductivity rating of <b>[buffer_gas_thermal_conductivity*100]%."
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
	if(panel_open)
		. += "platform_panel"

/obj/machinery/power/rbmk2/process()

	heat_overlay.color = heat2colour(buffer_gasses.temperature)
	heat_overlay.alpha = min(buffer_gasses.temperature * (1/200),255)

	if(!stored_rod)
		meter_overlay.alpha = 0
		return

	var/datum/gas_mixture/base_mix = stored_rod.air_contents
	if(!base_mix || !base_mix.gases)
		meter_overlay.alpha = 0
		return

	if(!active && base_mix.gases[/datum/gas/tritium])
		var/meter_icon_num = CEILING( min(base_mix.gases[/datum/gas/tritium][MOLES] / 100, 1) * 5, 1)
		if(meter_icon_num > 0)
			meter_overlay.alpha = 255
			meter_overlay.icon_state = "platform_rod_glow_[meter_icon_num]"
		else
			meter_overlay.alpha = 0
	else
		meter_overlay.alpha = 0

	//If there are any gasses that have yet to escape, transfer the heat of it to the rod.
	buffer_gasses.temperature_share(base_mix, buffer_gas_thermal_conductivity) // * (1 + melt_damage*0.01)

	if(isturf(loc))
		var/turf/T = loc
		var/datum/gas_mixture/turf_air = T.return_air()
		if(turf_air)
			//Share the temperature of the rod with the turf's air.
			base_mix.temperature_share(turf_air, T.thermal_conductivity*0.25)

	if(!active || !powernet)
		return

	var/amount_to_consume = gas_consumption_base + (base_mix.temperature/1000)*gas_consumption_heat*(overclocked ? 1.25 : 1)
	if(!amount_to_consume)
		return

	//Remove gas from the rod to be processed.
	var/datum/gas_mixture/consumed_mix = base_mix.remove(amount_to_consume)

	//Do power generation here.
	consumed_mix.assert_gas(/datum/gas/tritium)
	if(consumed_mix.gases && consumed_mix.gases[/datum/gas/tritium])
		last_tritium_consumption = consumed_mix.gases[/datum/gas/tritium][MOLES]
		radiation_pulse(src,min(last_tritium_consumption*0.25,GAS_REACTION_MAXIMUM_RADIATION_PULSE_RANGE),threshold = RAD_FULL_INSULATION)
		if(powernet)
			last_power_generation = last_tritium_consumption * power_efficiency
			if(last_power_generation)
				src.add_avail(last_power_generation)
		consumed_mix.remove_specific(/datum/gas/tritium, last_tritium_consumption*0.80) //80% of used tritium gets deleted. The rest gets thrown into the air.
		var/our_heat_capacity = consumed_mix.heat_capacity()
		if(our_heat_capacity > 0)
			consumed_mix.temperature += 100/our_heat_capacity

	//The gasses that we consumed go back into the air.
	buffer_gasses.merge(consumed_mix)

	//Vent excess gas, if we can.
	if(venting && isturf(loc))
		var/turf/T = loc
		var/datum/gas_mixture/turf_air = T.return_air()
		if(turf_air)
			buffer_gasses.release_gas_to(turf_air,vent_pressure)

	return TRUE

#define SENSORS_UPDATE_PERIOD 15 SECONDS //Why is this not a global define, why do I have to define it again
#define ALARM_PERIOD 45 SECONDS

/obj/machinery/computer/crew
	luminosity = 1
	light_power = 1.4
	light_range = 1.7
	var/canalarm = FALSE
	COOLDOWN_DECLARE(alarm_cooldown)

/obj/machinery/computer/crew/Initialize(mapload, obj/item/circuitboard/C)
	. = ..()
	alarm()

/obj/machinery/computer/crew/proc/alarm()
	canalarm = FALSE

	for(var/mob/living/carbon/human/mob in GLOB.suit_sensors_list)

		if(!istype(mob))
			continue
		if(mob.z != src.z  && !HAS_TRAIT(mob, TRAIT_MULTIZ_SUIT_SENSORS))
			continue
		var/obj/item/clothing/under/uniform = mob.w_uniform
		if(uniform.sensor_mode == SENSOR_COORDS && (uniform.has_sensor != BROKEN_SENSORS) && (HAS_TRAIT(mob, TRAIT_CRITICAL_CONDITION) || mob.stat == DEAD))
			if(mob.get_dnr()) // DNR won't beep anymore
				continue
			canalarm = TRUE
			break // Why wasn't this here?

	if(canalarm)
		icon_keyboard = "syndie_key" // first just a red keyboard
		set_light(l_range = 1.9, l_power = 3, l_color = CIRCUIT_COLOR_SECURITY, l_on = TRUE)
		if(COOLDOWN_FINISHED(src, alarm_cooldown))
			icon_screen = "commsyndie" // okay pay attention nerds, full red screen
			update_appearance()
			playsound(src, 'sound/machines/twobeep.ogg', 50, TRUE)
			spasm_animation(10)
			COOLDOWN_START(src, alarm_cooldown, ALARM_PERIOD)
		else
			update_appearance()
	else
		icon_screen = "crew"
		icon_keyboard = "med_key"
		update_appearance()
		set_light(l_range = initial(light_range), l_power = initial(light_power), l_color = initial(light_color), l_on = TRUE)
	addtimer(CALLBACK(src, .proc/alarm), SENSORS_UPDATE_PERIOD) // Fix this for 515

	return canalarm

#undef SENSORS_UPDATE_PERIOD
#undef ALARM_PERIOD

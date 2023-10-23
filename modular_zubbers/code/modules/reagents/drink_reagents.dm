/datum/reagent/consumable/moth_milk
	name = "Moth Milk"
	description = "Whoever thought that milking moths is a good idea was totally wrong. Is it even milk?"
	color = "#F0E9DA" // rgb: 240, 233, 218
	taste_description = "salty and oily substance"
	ph = 6.5
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/consumable/moth_milk/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	if(!ismoth(M))
		if(M.disgust < 80)
			M.adjust_disgust(10 * REM * delta_time)
		return TRUE
	. = ..()

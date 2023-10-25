/datum/reagent/putrescine
	name = "Putrescine"
	description = "A horrible toxin inhaled from rotting organs."
	reagent_state = GAS
	metabolization_rate = REAGENTS_METABOLISM / 0.5
	color = "#808080"
	taste_description = "horrible horribleness."
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED|REAGENT_NO_RANDOM_RECIPE

/datum/reagent/putrescine/on_mob_life(mob/living/carbon/breather, seconds_per_tick, times_fired)
	. = ..()
	breather.adjust_disgust(4)
	if(breather.disgust >= DISGUST_LEVEL_DISGUSTED)
		to_chat(breather, span_userdanger("Your nose and gut are on fire!"))
		breather.emote("cry")
		return
	if(breather.disgust >= DISGUST_LEVEL_GROSS && SPT_PROB(25, seconds_per_tick))
		to_chat(breather, "You smell something horrible!")
		breather.emote("sniff")
		breather.adjust_disgust(4)
		return
	if(breather.disgust >= DISGUST_LEVEL_VERYGROSS && SPT_PROB(12, seconds_per_tick))
		to_chat(breather, span_userdanger("The awful smell is searing your senses!"))
		breather.adjust_disgust(2)
		return
/datum/reagent/putrescine/on_mob_end_metabolize(mob/living/carbon/breather)
	. = ..()
	breather.adjust_disgust(-breather.disgust) // Clear it out when you clear out.

/datum/antagonist/traitor/lone_infiltrator
	name = "Lone Infiltrator"
	var/infil_outfit = /datum/outfit/syndicateinfiltrator
	preview_outfit = /datum/outfit/lone_infiltrator_preview
	job_rank = ROLE_LONE_INFILTRATOR

/datum/antagonist/traitor/lone_infiltrator/on_gain()
	var/mob/living/carbon/human/current = owner.current
	//Bubber Edit: Adds automatic antag names
	var/mob/living/carbon/human/person = owner.current
	if(iscarbon(person))
		person.apply_pref_name(/datum/preference/name/syndicate, person.client)
		person.dna.update_dna_identity()
	//Bubber edit END: Adds automatic antag names
	current.equipOutfit(infil_outfit)
	/*var/chosen_name = current.dna.species.random_name(current.gender,1,1)
	current.fully_replace_character_name(current.real_name,chosen_name)*/
	//BUBBER EDIT REMOVAL: ANTAG NAMES
	return ..()

/datum/outfit/lone_infiltrator_preview
	name = "Lone Infiltrator (Preview only)"

	back = /obj/item/mod/control/pre_equipped/empty/syndicate
	uniform = /obj/item/clothing/under/syndicate
	l_hand = /obj/item/shield/energy
	r_hand = /obj/item/gun/ballistic/automatic/c20r

/datum/outfit/lone_infiltrator_preview/post_equip(mob/living/carbon/human/equipped_person, visualsOnly)
	var/obj/item/mod/module/armor_booster/booster = locate() in equipped_person.back
	booster.active = TRUE
	equipped_person.update_worn_back()
	var/obj/item/shield/energy/e_shield = locate() in equipped_person.contents
	e_shield.icon_state = "[initial(e_shield.icon_state)]_on"

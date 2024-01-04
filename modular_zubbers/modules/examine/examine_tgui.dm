/datum/examine_panel/ui_data(mob/user)
	var/list/data = ..()
	var/datum/preferences/preferences = holder.client?.prefs
	var/flavor_text_nsfw = ""
	var/headshot_nsfw = ""
	var/character_ad = ""
	var/show_nsfw_flavor_text = preferences?.read_preference(/datum/preference/choiced/show_nsfw_flavor_text)
	if(issilicon(holder) && !(show_nsfw_flavor_text == "Never"))
		flavor_text_nsfw = preferences?.read_preference(/datum/preference/text/flavor_text_nsfw/silicon)
		headshot_nsfw += preferences?.read_preference(/datum/preference/text/headshot/silicon/nsfw)
	if(ishuman(holder))
		var/mob/living/carbon/human/holder_human = holder
		if((show_nsfw_flavor_text == "Always On") || (show_nsfw_flavor_text == "Nude Only" && !(holder_human.w_uniform)))
			flavor_text_nsfw = preferences?.read_preference(/datum/preference/text/flavor_text_nsfw)
			headshot_nsfw += preferences?.read_preference(/datum/preference/text/headshot/nsfw)
	character_ad = preferences?.read_preference(/datum/preference/text/character_ad)

	data["character_ad"] = character_ad
	data["flavor_text_nsfw"] = flavor_text_nsfw
	data["headshot_nsfw"] = headshot_nsfw
	return data

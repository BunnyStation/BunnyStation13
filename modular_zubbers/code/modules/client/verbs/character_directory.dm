GLOBAL_DATUM(character_directory, /datum/character_directory)
GLOBAL_LIST_INIT(char_directory_tags, list("Pred", "Pred-Pref", "Prey", "Prey-Pref", "Switch", "Non-Vore", "Unset"))
GLOBAL_LIST_INIT(char_directory_erptags, list("Top", "Bottom", "Switch", "No ERP", "Unset"))
#define READ_PREFS(target, pref) (target.client.prefs.read_preference(/datum/preference/pref) || "Unset")

/datum/preference/toggle/show_in_directory
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	default_value = TRUE
	savefile_key = "show_in_directory"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/text/character_ad
	savefile_key = "character_ad"
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	maximum_value_length = MAX_FLAVOR_LEN

/datum/preference/text/character_ad/create_default_value()
	return ""

/datum/preference/text/character_ad/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE

/client
	COOLDOWN_DECLARE(char_directory_cooldown)

/client/verb/show_character_directory()
	set name = "Character Directory"
	set category = "OOC"
	set desc = "Shows a listing of all active characters, along with their associated OOC notes, flavor text, and more."

	// This is primarily to stop malicious users from trying to lag the server by spamming this verb
	if(!COOLDOWN_FINISHED(src, char_directory_cooldown))
		to_chat(src, span_alert("Hold your horses! Its still refreshing!"))
		return
	COOLDOWN_START(src, char_directory_cooldown, 10)

	if(!GLOB.character_directory)
		GLOB.character_directory = new
	GLOB.character_directory.ui_interact(mob)

// This is a global singleton. Keep in mind that all operations should occur on user, not src.
/datum/character_directory

/datum/character_directory/ui_state(mob/user)
	return GLOB.always_state

/datum/character_directory/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ZubbersCharacterDirectory", "Character Directory")
		ui.open()

/datum/character_directory/ui_data(mob/user)
	. = ..()
	var/list/data = .

	if (user?.client?.prefs)
		data["personalVisibility"] = READ_PREFS(user, toggle/show_in_directory)
		data["personalTag"] = READ_PREFS(user, choiced/erp_status_v)
		data["personalErpTag"] = READ_PREFS(user, choiced/erp_status)
		data["personalHypnoTag"] = READ_PREFS(user, choiced/erp_status_hypno)
		data["personalNcTag"] = READ_PREFS(user, choiced/erp_status_nc)
		data["prefsOnly"] = TRUE

	data["canOrbit"] = isobserver(user)

	return data

/datum/character_directory/ui_static_data(mob/user)
	. = ..()
	var/list/data = .

	var/list/directory_mobs = list()
	//We want the directory to show only alive players
	for(var/mob/mob in GLOB.alive_player_list)
		// These are the variables we're trying to display in the directory
		var/name = null
		var/species = null
		var/ooc_notes = null
		var/flavor_text = null
		var/vore
		var/erp
		var/hypno
		var/noncon
		var/character_ad
		var/exploitable
		var/ref = REF(mob)
		//Just in case something we get is not a mob
		if(!mob)
			continue

		//Different approach for humans and silicons
		if(ishuman(mob))
			var/mob/living/carbon/human/human = mob
			//If someone is obscured without flavor text visible, we don't want them on the Directory.
			if((human.wear_mask && (human.wear_mask.flags_inv & HIDEFACE) && READ_PREFS(human, toggle/obscurity_examine)) || (human.head && (human.head.flags_inv & HIDEFACE) && READ_PREFS(human, toggle/obscurity_examine)) || (HAS_TRAIT(human, TRAIT_UNKNOWN)))
				continue
			//Display custom species, otherwise show base species instead
			species = (READ_PREFS(human, text/custom_species))
			if(species == "Unset")
				species = "[human.dna.species.name]"
			//Load standard flavor text preference
			flavor_text = READ_PREFS(human, text/flavor_text)
		else if(issilicon(mob))
			var/mob/living/silicon/silicon = mob
			//If the target is a silicon, we want it to show its brain as its species
			species = READ_PREFS(silicon, choiced/brain_type)
			//Load silicon flavor text in place of normal flavor text
			flavor_text = READ_PREFS(silicon, text/silicon_flavor_text)
		//Don't show if they are not a human or a silicon
		else continue
		//List of all the shown ERP preferences in the Directory. If there is none, return "Unset"
		erp = READ_PREFS(mob, choiced/erp_status)
		vore = READ_PREFS(mob, choiced/erp_status_v)
		hypno = READ_PREFS(mob, choiced/erp_status_hypno)
		noncon = READ_PREFS(mob, choiced/erp_status_nc)
		character_ad = READ_PREFS(mob, text/character_ad)
		ooc_notes = READ_PREFS(mob, text/ooc_notes)
		//If the user is an antagonist or Observer, we want them to be able to see exploitables in the Directory.
		if(user.mind.has_antag_datum(/datum/antagonist) || isobserver(user))
			if(exploitable == EXPLOITABLE_DEFAULT_TEXT)
				exploitable = "Unset"
			else exploitable = READ_PREFS(mob, text/exploitable)
		else exploitable = "Obscured"
		//And finally, we want to get the mob's name, taking into account disguised names.
		name = mob.real_name ? mob.name : mob.real_name

		directory_mobs.Add(list(list(
			"name" = name,
			"species" = species,
			"ooc_notes" = ooc_notes,
			"erp" = erp,
			"vore" = vore,
			"hypno" = hypno,
			"noncon" = noncon,
			"exploitable" = exploitable,
			"character_ad" = character_ad,
			"flavor_text" = flavor_text,
			"ref" = ref
		)))

	data["directory"] = directory_mobs

	return data

/datum/character_directory/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()

	if(.)
		return

	var/mob/user = usr
	if(!user)
		return

	switch(action)
		if("refresh")
			// This is primarily to stop malicious users from trying to lag the server by spamming this verb
			if(!COOLDOWN_FINISHED(user.client, char_directory_cooldown))
				to_chat(user, "<span class='warning'>Don't spam character directory refresh.</span>")
				return
			COOLDOWN_START(user.client, char_directory_cooldown, 10)
			update_static_data(user, ui)
			return TRUE
		if("orbit")
			var/ref = params["ref"]
			var/mob/dead/observer/ghost = user
			var/atom/movable/poi = (locate(ref) in GLOB.mob_list)
			if (poi == null)
				return TRUE
			ghost.ManualFollow(poi)
			ghost.reset_perspective(null)
			return TRUE

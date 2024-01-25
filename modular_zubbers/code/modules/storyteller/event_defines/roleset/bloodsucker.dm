/datum/round_event_control/antagonist/solo/bloodsucker
	name = "Bloodsuckers"
	roundstart = TRUE

	antag_flag = ROLE_BLOODSUCKER
	antag_datum = /datum/antagonist/bloodsucker
	weight = 4
	min_players = 20

	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_CREW_ANTAG)

/datum/round_event_control/antagonist/solo/bloodsucker/midround
	name = "Vampiric Accident"
	prompted_picking = TRUE
	roundstart = FALSE
	weight = 6 // Outweight the other ghost roles slightly

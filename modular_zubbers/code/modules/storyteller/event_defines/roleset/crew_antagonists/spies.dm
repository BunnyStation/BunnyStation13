/datum/round_event_control/antagonist/solo/spy
	name = "Spies"
	roundstart = TRUE

	antag_flag = ROLE_SPY
	antag_datum = /datum/antagonist/spy
	weight = 8

	tags = list(TAG_CREW_ANTAG)

/datum/round_event_control/antagonist/solo/spy/midround
	name = "Spies (Midround)"
	prompted_picking = TRUE
	roundstart = FALSE
	weight = 14

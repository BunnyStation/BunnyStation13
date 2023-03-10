// BUTTERSTATION ADDITION

#define CHOICE_EXTENDED "Extended Ruleset (Minimal Threats)"
#define CHOICE_DYNAMIC "Dynamic Ruleset (Normal Threats)"

/datum/vote/gamemode_vote
	name = "Gamemode"
	default_choices = list(
		CHOICE_EXTENDED,
		CHOICE_DYNAMIC,
	)
	message = "Vote for the current rounds ruleset."

/datum/vote/gamemode_vote/is_accessible_vote()
	return FALSE

/datum/vote/gamemode_vote/finalize_vote(winning_option)
	if(winning_option == CHOICE_EXTENDED)
		GLOB.dynamic_forced_extended = TRUE
		return

	if(winning_option == CHOICE_DYNAMIC)
		GLOB.dynamic_forced_extended = FALSE
		return

	else
		CRASH("[type] wasn't passed a valid winning choice. (Got: [winning_option || "null"])")

#undef CHOICE_EXTENDED
#undef CHOICE_DYNAMIC

/datum/dynamic_ruleset/latejoin/heretic_smuggler/New()
	. = ..()
	protected_roles += list(
		JOB_CHAPLAIN, //A chaplain shouldn't be a heretic... just saying
	)

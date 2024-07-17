/obj/vore_belly
	// name = ""
	// desc = ""
	var/datum/component/vore/owner
	var/datum/digest_mode/digest_mode

/obj/vore_belly/default
	name = "Default Belly"
	desc = "It's very bland!"

/obj/vore_belly/Initialize(mapload, datum/component/vore/new_owner)
	. = ..()
	if(!istype(new_owner))
		return INITIALIZE_HINT_QDEL
	owner = new_owner
	LAZYADD(owner.vore_bellies, src)
	digest_mode = GLOB.digest_modes["None"]

/obj/vore_belly/Destroy(force)
	LAZYREMOVE(owner.vore_bellies, src)
	owner = null
	digest_mode = null
	. = ..()

/obj/vore_belly/ui_data(mob/user)
	var/list/data = list()

	data["name"] = name
	data["desc"] = desc
	data["ref"] = REF(src)

	var/list/contents_data = list()
	for(var/atom/A as anything in contents)
		UNTYPED_LIST_ADD(contents_data, list(
			"name" = A.name,
			"ref" = REF(A),
		))
	data["contents"] = contents_data

	return data

// Bellies always just make mobs inside them breath whatever is on the turf
/obj/vore_belly/assume_air(datum/gas_mixture/giver)
	var/turf/T = get_turf(src)
	return T.assume_air(giver)

/obj/vore_belly/remove_air(amount)
	var/turf/T = get_turf(src)
	return T.remove_air(amount)

/obj/vore_belly/return_air()
	var/turf/T = get_turf(src)
	return T.return_air()

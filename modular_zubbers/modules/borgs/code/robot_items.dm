/**
 * Cargoborg specific items
 *
 * Refer to modular_skyrat/modules/cargoborg/code/robot_items.dm for original definitions
 */

// Override the mail clamp to be able to dispense into mail chutes
/obj/item/borg/hydraulic_clamp/mail/pre_attack(atom/attacked_atom, mob/living/silicon/robot/user, params)
	var/obj/machinery/disposal/delivery_chute/chute = attacked_atom
	if(istype(attacked_atom, /obj/structure/plasticflaps))	// If we attacked flaps, try locating the chute under them
		var/obj/structure/plasticflaps/flaps = attacked_atom
		chute = locate(/obj/machinery/disposal/delivery_chute) in flaps.loc.contents
	if(!istype(chute))	// This is one way to say we didn't attack a chute or flaps over a chute
		return ..()

	if(!istype(user) || !user.Adjacent(attacked_atom) || !COOLDOWN_FINISHED(src, clamp_cooldown) || in_use)
		return

	// Not enough charge
	if(user?.cell.charge < charge_cost)
		balloon_alert(user, "low charge!")
		return

	user.cell.use(charge_cost)
	in_use = TRUE
	COOLDOWN_START(src, clamp_cooldown, cooldown_duration)

	if(!contents.len)
		in_use = FALSE
		return

	var/extraction_index = selected_item_index ? selected_item_index : contents.len
	var/atom/movable/extracted_item = contents[extraction_index]
	selected_item_index = 0

	if (unloading_time > 0.5 SECONDS) // Chat spam reduction
		balloon_alert(user, "unloading")
	playsound(src, clamp_sound, clamp_sound_volume, FALSE, -5)
	COOLDOWN_START(src, clamp_cooldown, cooldown_duration)

	if(!do_after(user, unloading_time, attacked_atom))
		in_use = FALSE
		return

	chute.place_item_in_disposal(extracted_item)
	visible_message(span_notice("[src.loc] unloads [extracted_item] from [src]."))
	log_silicon("[user] unloaded [extracted_item] onto [chute] ([AREACOORD(chute)]).")
	in_use = FALSE
	return
/**
 * Cargoborg specific items
 *
 * Refer to modular_skyrat/modules/cargoborg/code/robot_items.dm for original definitions
 */

// Override the mail clamp to be able to dispense into mail chutes
/obj/item/borg/hydraulic_clamp/mail/pre_attack(atom/attacked_atom, mob/living/silicon/robot/user, params)
	var/obj/machinery/disposal/delivery_chute/chute = attacked_atom
	if(istype(attacked_atom, /obj/structure/plasticflaps))	// If we attacked flaps, try locating the chute under them
		var/obj/structure/plasticflaps/flaps = attacked_atom
		chute = locate(/obj/machinery/disposal/delivery_chute) in flaps.loc.contents
	if(!istype(chute))	// This is one way to say we didn't attack a chute or flaps over a chute
		return ..()

	if(!istype(user) || !user.Adjacent(attacked_atom) || !COOLDOWN_FINISHED(src, clamp_cooldown) || in_use)
		return

	// Not enough charge
	if(user?.cell.charge < charge_cost)
		balloon_alert(user, "low charge!")
		return

	user.cell.use(charge_cost)
	in_use = TRUE
	COOLDOWN_START(src, clamp_cooldown, cooldown_duration)

	if(!contents.len)
		in_use = FALSE
		return

	var/extraction_index = selected_item_index ? selected_item_index : contents.len
	var/atom/movable/extracted_item = contents[extraction_index]
	selected_item_index = 0

	if (unloading_time > 0.5 SECONDS) // Chat spam reduction
		balloon_alert(user, "unloading")
	playsound(src, clamp_sound, clamp_sound_volume, FALSE, -5)
	COOLDOWN_START(src, clamp_cooldown, cooldown_duration)

	if(!do_after(user, unloading_time, attacked_atom))
		in_use = FALSE
		return

	chute.place_item_in_disposal(extracted_item)
	visible_message(span_notice("[src.loc] unloads [extracted_item] from [src]."))
	log_silicon("[user] unloaded [extracted_item] onto [chute] ([AREACOORD(chute)]).")
	in_use = FALSE
	return


/obj/item/gun/energy/recharge/kinetic_accelerator/cyborg
	max_mod_capacity = 100

//Research borg stuff
/obj/item/inducer/cyborg/sci
	icon = 'icons/obj/tools.dmi'
	icon_state = "inducer-sci"

//illegal teleporter module
/obj/item/experimental_dash
	name = "Exerimental Dash"
	desc = "An experimental module that allows for dashing."
	desc_controls = "Left-click to dash."
	icon = 'icons/mob/actions/actions_items.dmi'
	icon_state = "jetboot"
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/charge_cost = 3200
	var/datum/effect_system/spark_spread/spark_system
	var/datum/action/innate/dash/research/jaunt
	var/mob/living/silicon/robot/cyborg

/obj/item/experimental_dash/Initialize(mapload)
	. = ..()
	jaunt = new(src)
	spark_system = new /datum/effect_system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

/obj/item/experimental_dash/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!target.density)
		jaunt?.teleport(user, target)
	if(!jaunt.current_charges)
		cyborg?.cell?.use(charge_cost)

/obj/item/experimental_dash/equipped(mob/user, slot, initial)
	. = ..()
	if(!QDELETED(jaunt))
		jaunt.Grant(user, src)
	cyborg = user

/obj/item/experimental_dash/dropped(mob/user)
	. = ..()
	if(!QDELETED(jaunt))
		jaunt.Remove(user)
	cyborg = null

/obj/item/experimental_dash/Destroy()
	QDEL_NULL(spark_system)
	QDEL_NULL(jaunt)
	return ..()

/datum/action/innate/dash/research
	current_charges = 1
	max_charges = 1
	charge_rate = 15 SECONDS
	beam_length = 1 SECONDS
	recharge_sound = null
	beam_effect = "plasmabeam"

/datum/action/innate/dash/research/GiveAction(mob/viewer) //this action should be invisible
	return

/datum/action/innate/dash/research/HideFrom(mob/viewer)
	return

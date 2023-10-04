/obj/item/organ/internal/brain/synth
	var/obj/item/modular_computer/pda/synth/internal_computer = new /obj/item/modular_computer/pda/synth
	actions_types = list(/datum/action/item_action/synth/open_internal_computer)

/obj/item/organ/internal/brain/synth/Insert(mob/living/carbon/user, special, drop_if_replaced, no_id_transfer)
	. = ..()
	internal_computer.owner_brain = src

/obj/item/organ/internal/brain/synth/Remove(mob/living/carbon/target, special, no_id_transfer)
	. = ..()
/datum/action/item_action/synth/open_internal_computer
	name = "Open internal computer"
	desc = "Open the built in ntos computer"
	check_flags = AB_CHECK_CONSCIOUS

/datum/action/item_action/synth/open_internal_computer/Trigger(trigger_flags)
	. = ..()
	var/obj/item/organ/internal/brain/synth/I = target
	I.internal_computer.physical = owner
	I.internal_computer.interact(owner)

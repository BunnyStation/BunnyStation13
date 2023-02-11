/obj/item/clothing/suit/armor/metrocop //Sprite done by Gat1Day#2892
	name = "Civil Protection Suit"
	desc = "Standard issue armor for Civil Protection."
	body_parts_covered = CHEST|ARMS|GROIN|LEGS
	cold_protection = CHEST|ARMS|GROIN|LEGS
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|ARMS|GROIN|LEGS
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	icon = 'modular_zubbers/icons/mob/clothing/suits/armor.dmi'
	worn_icon = 'modular_zubbers/icons/mob/clothing/suits/armor.dmi'
	icon_state = "hardsuit-metrocop"
	inhand_icon_state = "hardsuit-metrocop"
	blood_overlay_type = "hardsuit-metrocop"
	armor_type = /datum/armor/metrocopArmor

/datum/armor/metrocopArmor
	melee = 40
	bullet = 25
	laser = 30
	energy = 30
	bomb = 25
	fire = 50
	acid = 50
	wound = 10

/obj/item/clothing/suit/armor/metrocopriot //Sprite done by Gat1Day#2892
	name = "Riot Civil Protection Suit"
	desc = "A Suit of armor to help Civil Protection deal with unruly citizens."
	icon = 'modular_zubbers/icons/mob/clothing/suits/armor.dmi'
	worn_icon = 'modular_zubbers/icons/mob/clothing/suits/armor.dmi'
	icon_state = "hardsuit-metrocop-RL"
	inhand_icon_state = "hardsuit-metrocop-RL"
	blood_overlay_type = "hardsuit-metrocop-RL"
	armor_type = /datum/armor/armor_riot


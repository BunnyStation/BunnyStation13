
/datum/crafting_recipe/stake
	name = "Stake"
	result = /obj/item/stake
	reqs = list(/obj/item/stack/sheet/mineral/wood = 3)
	time = 8 SECONDS
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/hardened_stake
	name = "Hardened Stake"
	result = /obj/item/stake/hardened
	tool_behaviors = list(TOOL_WELDER)
	reqs = list(/obj/item/stack/rods = 1)
	time = 6 SECONDS
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/silver_stake
	name = "Silver Stake"
	result = /obj/item/stake/hardened/silver
	tool_behaviors = list(TOOL_WELDER)
	reqs = list(
		/obj/item/stack/sheet/mineral/silver = 1,
		/obj/item/stake/hardened = 1,
		// It's slathered in garlic, smelly.
		/obj/item/food/grown/garlic = 2,
	)
	time = 8 SECONDS
	category = CAT_WEAPON_MELEE

/datum/crafting_recipe/ash_crusher
	name = "Necropolis Greatsword"
	result = /obj/item/kinetic_crusher/ashwalker
	time = 120
	reqs = list(
		/obj/item/stack/sheet/bone = 6,
		/obj/item/stack/sheet/sinew = 4,
		/obj/item/organ/internal/monster_core/regenerative_core = 2,
		/obj/item/cursed_dagger = 1,
		/obj/item/stack/sheet/animalhide/goliath_hide = 2,
		/obj/item/stack/sheet/leather = 2)
	category = CAT_WEAPON_MELEE

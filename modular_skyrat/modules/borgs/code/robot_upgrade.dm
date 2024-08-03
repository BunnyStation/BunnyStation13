/// Use this file to add UPGRADES to borgs, the standard items will go in the modular robot_items.dm

/*
*	ADVANCED MEDICAL CYBORG UPGRADES
*/

/// Advanced Surgery Tools
/obj/item/borg/upgrade/surgerytools
	name = "medical cyborg advanced surgery tools"
	desc = "An upgrade to the Medical model cyborg's surgery loadout, replacing non-advanced tools with their advanced counterpart."
	icon_state = "module_medical"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/medical)
	model_flags = BORG_MODEL_MEDICAL

	items_to_add = list(/obj/item/scalpel/advanced,
						/obj/item/retractor/advanced,
						/obj/item/cautery/advanced,
						/obj/item/healthanalyzer/advanced,
						)
	items_to_remove = list(
						/obj/item/borg/cyborg_omnitool/medical,
						/obj/item/borg/cyborg_omnitool/medical, // Twice because you get two
						/obj/item/healthanalyzer,
						)

/*
*	ADVANCED ENGINEERING CYBORG UPGRADES
*/

/// Advanced Materials
#define ENGINEERING_CYBORG_CHARGE_PER_STACK 1000

/datum/robot_energy_storage/plasteel
	name = "Plasteel Processor"
	recharge_rate = 0
	max_energy = ENGINEERING_CYBORG_CHARGE_PER_STACK * 50

/datum/robot_energy_storage/titanium
	name = "Titanium Processor"
	recharge_rate = 0
	max_energy = ENGINEERING_CYBORG_CHARGE_PER_STACK * 50

/obj/item/stack/sheet/plasteel/cyborg
	cost = ENGINEERING_CYBORG_CHARGE_PER_STACK
	is_cyborg = TRUE
	source = /datum/robot_energy_storage/plasteel

/obj/item/stack/sheet/titaniumglass/cyborg
	cost = ENGINEERING_CYBORG_CHARGE_PER_STACK
	is_cyborg = TRUE
	source = /datum/robot_energy_storage/titanium

#undef ENGINEERING_CYBORG_CHARGE_PER_STACK

/obj/item/borg/upgrade/advanced_materials
	name = "engineering advanced materials processor"
	desc = "allows a cyborg to synthesize and store advanced materials"
	icon_state = "module_engineer"
	model_type = list(/obj/item/robot_model/engineering)
	model_flags = BORG_MODEL_ENGINEERING

	items_to_add = list(/obj/item/stack/sheet/plasteel/cyborg,
						/obj/item/stack/sheet/titaniumglass/cyborg,
						)

/obj/item/borg/upgrade/advanced_materials/deactivate(mob/living/silicon/robot/borg, mob/living/user)
	. = ..()
	for(var/datum/robot_energy_storage/plasteel/plasteel_energy in borg.model.storages)
		qdel(plasteel_energy)
	for(var/datum/robot_energy_storage/titanium/titanium_energy in borg.model.storages)
		qdel(titanium_energy)

/*
*	ADVANCED MINING CYBORG UPGRADES
*/

/// Welder
/obj/item/borg/upgrade/welder
	name = "mining cyborg welder upgrade"
	desc = "A normal welder with a larger tank for cyborgs."
	icon_state = "module_engineer"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/miner)
	model_flags = BORG_MODEL_MINER

	items_to_add = list(/obj/item/weldingtool/largetank/cyborg)

/*
*	ADVANCED CARGO CYBORG UPGRADES
*/
/datum/design/borg_upgrade_clamp
	name = "Improved Integrated Hydraulic Clamp Module"
	id = "borg_upgrade_clamp"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/better_clamp
	materials = list(
		/datum/material/titanium = SHEET_MATERIAL_AMOUNT * 2,
		/datum/material/gold = HALF_SHEET_MATERIAL_AMOUNT,
	)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_CARGO,
	)

/obj/item/borg/upgrade/better_clamp
	name = "improved integrated hydraulic clamp"
	desc = "An improved hydraulic clamp to allow for bigger packages to be picked up as well!"
	icon = 'modular_skyrat/modules/borgs/icons/robot_items.dmi'
	icon_state = "module_cargo"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/cargo)
	model_flags = BORG_MODEL_CARGO

	items_to_add = list(/obj/item/borg/hydraulic_clamp/better)

/datum/design/borg_upgrade_cargo_tele
	name = "Cargo teleporter module"
	id = "borg_upgrade_cargo_tele"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/cargo_tele
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, /datum/material/plastic = SMALL_MATERIAL_AMOUNT * 5, /datum/material/uranium = SMALL_MATERIAL_AMOUNT * 5)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_CARGO
	)

/obj/item/borg/upgrade/cargo_tele
	name = "cargo teleporter module"
	desc = "Allows you to upgrade a cargo cyborg with the cargo teleporter"
	icon = 'modular_skyrat/modules/borgs/icons/robot_items.dmi'
	icon_state = "module_cargo"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/cargo)
	model_flags = BORG_MODEL_CARGO

	items_to_add = list(/obj/item/cargo_teleporter)

/datum/design/borg_upgrade_forging
	name = "Forging module"
	id = "borg_upgrade_forging"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/forging
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 5, /datum/material/uranium = SMALL_MATERIAL_AMOUNT * 5)
	construction_time = 12 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_CARGO
	)

/obj/item/borg/upgrade/forging
	name = "cyborg forging module"
	desc = "Allows you to upgrade a cargo cyborg with forging gear"
	icon = 'modular_skyrat/modules/borgs/icons/robot_items.dmi'
	icon_state = "module_cargo"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/cargo)
	model_flags = BORG_MODEL_CARGO

	items_to_add = list(/obj/item/forging/hammer,
						/obj/item/forging/billow,
						/obj/item/forging/tongs,
						/obj/item/borg/forging_setup,
						)

/*
* SERVICE CYBORG UPGRADES
*/

/datum/design/borg_upgrade_artistic
	name = "Artistic module"
	id = "borg_upgrade_artistic"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/artistic
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 2,
					/datum/material/glass = SMALL_MATERIAL_AMOUNT * 2)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_ALL
	)

/obj/item/borg/upgrade/artistic
	name = "borg artistic module"
	desc = "Allows you to upgrade a cyborg with tools for creating art."
	icon_state = "module_general"
	items_to_add = list(
			/obj/item/pen,
			/obj/item/toy/crayon/spraycan/borg,
			/obj/item/instrument/guitar,
			/obj/item/instrument/piano_synth,
			/obj/item/stack/pipe_cleaner_coil/cyborg,
			/obj/item/chisel,
			)

/datum/design/borg_upgrade_botany
	name = "Botanical Operator Module"
	id = "borg_upgrade_botany"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/botany
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT * 2, /datum/material/glass = SMALL_MATERIAL_AMOUNT * 2)
	construction_time = 10 SECONDS
	category = list(
		RND_CATEGORY_MECHFAB_CYBORG_MODULES + RND_SUBCATEGORY_MECHFAB_CYBORG_MODULES_SERVICE
	)

/obj/item/borg/upgrade/botany
	name = "botanical operator upgrade"
	desc = "Provides an assortement of tools for dealing with plants."
	icon_state = "module_service"
	require_model = TRUE
	model_type = list(/obj/item/robot_model/service)
	model_flags = BORG_MODEL_SERVICE

	items_to_add = list(
		/obj/item/secateurs,
		/obj/item/cultivator,
		/obj/item/shovel/spade,
		/obj/item/plant_analyzer,
		/obj/item/storage/bag/plants
	)

/*
*	UNIVERSAL CYBORG UPGRADES
*/

/// ShapeShifter
/obj/item/borg/upgrade/borg_shapeshifter
	name = "cyborg shapeshifter module"
	desc = "An experimental device which allows a cyborg to disguise themself into another type of cyborg."
	icon_state = "module_general"

	items_to_add = list(/obj/item/borg_shapeshifter)


/// Syndijack
/obj/item/borg/upgrade/transform/syndicatejack
	name = "borg module picker (Syndicate)"
	desc = "Allows you to to turn a cyborg into a experimental syndicate cyborg."
	icon_state = "module_illegal"
	new_model = /obj/item/robot_model/syndicatejack

/obj/item/borg/upgrade/transform/syndicatejack/action(mob/living/silicon/robot/cyborg, user = usr) // Only usable on emagged cyborgs. In exchange. makes you unable to get locked down or detonated.
	if(cyborg.emagged)
		return ..()


// extra bubber borg sprites in a seperate folder so my github is happy

//haiii - aKhro

#define CYBORG_ICON_TYPE_SMOLRAPTOR "smolraptor"

#define CYBORG_ICON_GEN_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_gen.dmi'
#define CYBORG_ICON_SCI_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_sci.dmi'
#define CYBORG_ICON_ENG_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_eng.dmi'
#define CYBORG_ICON_MED_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_med.dmi'
#define CYBORG_ICON_CAR_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_car.dmi'
#define CYBORG_ICON_SERV_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_serv.dmi'
#define CYBORG_ICON_PK_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_gem.dmi'
#define CYBORG_ICON_JANI_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_gem.dmi'
#define CYBORG_ICON_MIN_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_gem.dmi'

/* not done yet!


#define CYBORG_ICON_SYND_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_gem.dmi'
#define CYBORG_ICON_NINJ_SMOLRAPTOR 'modular_zubbers/modules/smolraptors/icons/smolraptor_gem.dmi'
*/

/obj/item/robot_model/standard/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_GEN_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)

/obj/item/robot_model/engineering/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_ENG_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)

/*
sciborg isnt in yet
/obj/item/robot_model/sci/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_SCI_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)
*/

/obj/item/robot_model/medical/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_MED_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)

/obj/item/robot_model/cargo/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_CAR_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)

/obj/item/robot_model/service/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_SERV_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)

/obj/item/robot_model/pk/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_PK_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)

/obj/item/robot_model/janitor/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_JANI_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)


/*
/obj/item/robot_model/miner/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_MIN_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)

/obj/item/robot_model/syndicate/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_SYND_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)

/obj/item/robot_model/ninja/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"SmolRaptor" = list(SKIN_ICON_STATE = "smolraptor", SKIN_ICON = CYBORG_ICON_NINJ_SMOLRAPTOR, SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_SMALL)),
	)

*/

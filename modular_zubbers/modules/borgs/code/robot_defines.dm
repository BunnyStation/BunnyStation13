// Bubberstation custom borg sprites, add new defines in line with code\__DEFINES\~skyrat_defines\robot_defines.dm format

#define CYBORG_ICON_CENTCOM_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_cc.dmi'
#define CYBORG_ICON_CENTCOM_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_cc.dmi'

#define CYBORG_ICON_CLOWN_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_clown.dmi'

#define CYBORG_ICON_MED_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_med.dmi'
#define CYBORG_ICON_MED_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_med.dmi'

#define CYBORG_ICON_CARGO_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_cargo.dmi'
#define CYBORG_ICON_CARGO_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_cargo.dmi'

#define CYBORG_ICON_SEC_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_sec.dmi'
#define CYBORG_ICON_SEC_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_sec.dmi'

#define CYBORG_ICON_ENG_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_eng.dmi'
#define CYBORG_ICON_ENG_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_eng.dmi'

#define CYBORG_ICON_PEACEKEEPER_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_pk.dmi'
#define CYBORG_ICON_PEACEKEEPER_TALL_BUBBER 'modular_zubbers/modules/borgs/sprites/tallrobot_pk.dmi'
#define CYBORG_ICON_PEACEKEEPER_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_pk.dmi'

#define CYBORG_ICON_SERVICE_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_serv.dmi'
#define CYBORG_ICON_SERVICE_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_serv.dmi'

#define CYBORG_ICON_MINING_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_mine.dmi'
#define CYBORG_ICON_MINING_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_mine.dmi'

#define CYBORG_ICON_JANI_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_jani.dmi'
#define CYBORG_ICON_JANI_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_jani.dmi'

#define CYBORG_ICON_SYNDIE_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_syndie.dmi'
#define CYBORG_ICON_SYNDIE_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_syndie.dmi'

#define CYBORG_ICON_NINJA_WIDE_BUBBER 'modular_zubbers/modules/borgs/sprites/widerobot_ninja.dmi'
#define CYBORG_ICON_NINJA_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_ninja.dmi'

#define CYBORG_ICON_TYPE_RAPTOR "raptor"

#define CYBORG_ICON_SCI_TALL 'modular_zubbers/modules/borgs/sprites/tallrobot_sci.dmi'
#define CYBORG_ICON_SCI_WIDE 'modular_zubbers/modules/borgs/sprites/widerobot_sci.dmi'
#define CYBORG_ICON_SCI_LARGE_BUBBER 'modular_zubbers/modules/borgs/sprites/largerobot_sci.dmi'
#define CYBORG_ICON_SCI 'modular_zubbers/modules/borgs/sprites/robot_sci.dmi'

/mob/living/silicon/robot/model/centcom
	icon = CYBORG_ICON_CENTCOM_WIDE_BUBBER
	icon_state = "valecc"
	faction = list(ROLE_DEATHSQUAD)
	req_access = list(ACCESS_CENT_GENERAL)
	lawupdate = FALSE
	scrambledcodes = TRUE // These are not station borgs.
	ionpulse = TRUE
	var/playstyle_string = "<span class='big bold'>You are a Central Command cyborg!</span><br>"
	set_model = /obj/item/robot_model/centcom
	cell = /obj/item/stock_parts/cell/bluespace

/mob/living/silicon/robot/model/centcom/Initialize(mapload)
	laws = new /datum/ai_laws/central_override()
	laws.associate(src)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(show_playstyle)), 0.5 SECONDS)

/mob/living/silicon/robot/model/centcom/proc/show_playstyle()
	if(playstyle_string)
		to_chat(src, playstyle_string)

/mob/living/silicon/robot/model/centcom/ResetModel()
	return

//Research cyborgs
/mob/living/silicon/robot/model/sci
	icon_state = "research"

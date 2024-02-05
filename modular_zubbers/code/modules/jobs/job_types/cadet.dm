/datum/job/security_cadet
	title = JOB_SECURITY_CADET
	description = "Act as a Negotiator, deliver coffee to the Brig, \
		pretend you're more important than you are, until you move up."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list(JOB_HEAD_OF_SECURITY, JOB_HEAD_OF_PERSONNEL)
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Head of Security, and the head of Personnel."
	minimal_player_age = 7
	exp_requirements = 300
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SECURITY_CADET"

	outfit = /datum/outfit/job/security_cadet
	plasmaman_outfit = /datum/outfit/plasmaman/security_cadet

	paycheck = PAYCHECK_LOWER
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_SECURITY_OFFICER
	bounty_types = CIV_JOB_SEC
	departments_list = list(
		/datum/job_department/security,
		)

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)

	mail_goodies = list(
		/obj/item/food/donut/caramel = 10,
		/obj/item/food/donut/matcha = 10,
		/obj/item/food/donut/blumpkin = 5,
		/obj/item/clothing/mask/whistle = 5,
		/obj/item/reagent_containers/cup/glass/coffee = 2,
	)
	rpg_title = "Squire"
	job_flags = STATION_JOB_FLAGS

/datum/outfit/job/security_cadet
	name = "Security Cadet"
	jobtype = /datum/job/security_cadet
	id_trim = /datum/id_trim/job/security_cadet
	belt = /obj/item/modular_computer/pda/security
	accessory = /obj/item/clothing/accessory/armband/deputy
	ears = /obj/item/radio/headset/headset_sec/alt
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	uniform = /obj/item/clothing/under/sol_peacekeeper
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/beret/sec/navyofficer
	neck = /obj/item/clothing/neck/bowtie
	suit = /obj/item/clothing/suit/armor/sf_peacekeeper
	shoes = /obj/item/clothing/shoes/jackboots/sec
	l_pocket = /obj/item/taperecorder
	r_pocket = /obj/item/storage/pouch/medical/firstaid/loaded
	backpack_contents = list(
		/obj/item/holosign_creator/security,
		/obj/item/storage/toolbox/guncase/skyrat/pistol/pepperball,
	)

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/survival/security
	implants = list(/obj/item/implant/mindshield)

/datum/outfit/plasmaman/security_cadet
	name = "Cadet Plasmaman"

	accessory = /obj/item/clothing/accessory/armband/deputy
	belt = /obj/item/modular_computer/pda/security
	ears = /obj/item/radio/headset/headset_sec/alt
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	head = /obj/item/clothing/head/helmet/space/plasmaman/security
	neck = /obj/item/clothing/neck/bowtie
	uniform = /obj/item/clothing/under/plasmaman/security
	l_pocket = /obj/item/taperecorder
	r_pocket = /obj/item/storage/pouch/medical/firstaid/loaded
	backpack_contents = list(
		/obj/item/holosign_creator/security,
		/obj/item/storage/toolbox/guncase/skyrat/pistol/pepperball,
	)


	box = /obj/item/storage/box/survival/security

	implants = list(/obj/item/implant/mindshield)

/datum/id_trim/job/security_cadet
	assignment = "Security Cadet"
	trim_state = "trim_securityofficer"
	department_color = COLOR_SECURITY_RED
	subdepartment_color = COLOR_SERVICE_LIME
	sechud_icon_state = SECHUD_SECURITY_OFFICER
	minimal_access = list(
		ACCESS_BRIG_ENTRANCE,
		ACCESS_COURT,
		ACCESS_MECH_SECURITY,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_SECURITY,
		ACCESS_WEAPONS,
		)
	extra_access = list(
		ACCESS_MAINT_TUNNELS,
	)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
		ACCESS_HOS,
	)
	job = /datum/job/security_cadet

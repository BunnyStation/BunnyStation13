/obj/item/mod/control/pre_equipped/blueshield
	worn_icon = 'modular_skyrat/modules/blueshield/icons/worn_praetorian.dmi'
	icon = 'modular_skyrat/modules/blueshield/icons/praetorian.dmi'
	icon_state = "praetorian-control"
	theme = /datum/mod_theme/blueshield
	applied_cell = /obj/item/stock_parts/cell // Bubberstation Edit - Original: Super Cell
	applied_modules = list(
		/obj/item/mod/module/storage, // Bubberstation Edit - Original: Extended storage
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight,
		// /obj/item/mod/module/jetpack, // Bubberstation Removal
		// /obj/item/mod/module/projectile_dampener, Bubberstation Removal
		/obj/item/mod/module/quick_carry,
	)
	/* default_pins = list( 			// Bubberstation Removal
		/obj/item/mod/module/jetpack,
	)*/

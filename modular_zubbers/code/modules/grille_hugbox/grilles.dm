//This makes it so shocked grilles are not possible to spawn, unless there is a window on it.
/obj/structure/grille/Initialize(mapload)
	. = ..()
	if(mapload && density)
		var/turf/T = get_turf(src)
		if(T.get_cable_node() && !(locate(/obj/structure/window/) in T)) //Check for cable node and window.
			take_damage(max_integrity * 0.9)
			new /obj/item/storage/box/hug(T)

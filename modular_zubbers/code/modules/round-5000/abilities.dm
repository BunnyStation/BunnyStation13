/datum/action/cooldown/spell/conjure/foam_wall/fast
	cooldown_time = 1 SECONDS

/datum/action/cooldown/spell/conjure/extinguisher
	name = "Summon Extinguisher"
	desc = "This spell conjures an extinguisher"
	sound = 'sound/magic/summonitems_generic.ogg'

	button_icon = 'icons/effects/effects.dmi'
	button_icon_state = "extinguish"

	school = SCHOOL_CONJURATION
	cooldown_time = 1 MINUTES
	spell_requirements = null

	summon_radius = 0

	summon_type = list(/obj/item/extinguisher/advanced)

/datum/action/cooldown/spell/conjure/machineframe
	name = "Summon machine frame"
	desc = "Oh wow this is kinda useful!"

	button_icon = 'icons/obj/devices/stock_parts.dmi'
	button_icon_state = "box_1"

	summon_radius = 0
	summon_type = list(/obj/structure/frame/machine/secured)

/datum/action/cooldown/spell/conjure/cheese/food
	name = "Summon Food"
	desc = "This spell conjures a bunch of food. What are you meant to do now?"
	summon_type = list(/obj/effect/random_food)

/obj/effect/random_food/Initialize(mapload)
	. = ..()
	var/food_type = get_random_food()
	new food_type(get_turf(src))
	return INITIALIZE_HINT_QDEL

/datum/action/cooldown/spell/conjure/cheese/drinks
	name = "Summon Drink"
	desc = "This spell conjures a bunch of drinks. What are you meant to do now?"
	summon_type = list(/obj/effect/random_drink)

/obj/effect/random_drink/Initialize(mapload)
	. = ..()
	var/drink_type = get_random_drink()
	new drink_type(get_turf(src))
	return INITIALIZE_HINT_QDEL

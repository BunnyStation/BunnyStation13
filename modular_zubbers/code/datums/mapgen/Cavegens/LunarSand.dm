
//Underground
/datum/map_generator/cave_generator/lunar_sand

	weighted_open_turf_types = list(/turf/open/misc/moonstation_rock = 1)
	weighted_closed_turf_types = list(/turf/closed/mineral/random/lunar = 1)


	weighted_mob_spawn_list = list(
		SPAWN_MEGAFAUNA = 2,
		/mob/living/basic/mining/basilisk = 20.
		/mob/living/basic/mining/bileworm = 30,
		/obj/effect/spawner/random/lavaland_mob/goliath = 10,
		/obj/effect/spawner/random/lavaland_mob/legion = 20,
		/mob/living/basic/mining/watcher = 30,
		/mob/living/basic/mining/goldgrub = 10,
		/mob/living/basic/mining/brimdemon = 10,
		/obj/structure/spawner/skeleton = 5,
		/obj/structure/spawner/mining/goldgrub = 5,
		/obj/structure/spawner/mining/goliath = 5,
	)

	weighted_flora_spawn_list = list(
		/obj/structure/flora/rock/style_random = 5,
		/obj/structure/flora/ash/cap_shroom = 10,
		/obj/structure/flora/ash/leaf_shroom = 5,
		/obj/structure/flora/ash/stem_shroom = 5,
		/obj/structure/flora/ash/tall_shroom = 5,
	)

	///Note that this spawn list is also in the lavaland and icemoon generator
	weighted_feature_spawn_list = list(
		/obj/structure/geyser/hollowwater = 10,
		/obj/structure/geyser/plasma_oxide = 10,
		/obj/structure/geyser/protozine = 10,
		/obj/structure/geyser/random = 2,
		/obj/structure/geyser/wittel = 10,
	)

	initial_closed_chance = 45
	smoothing_iterations = 50
	birth_limit = 4
	death_limit = 3


//Surface
/datum/map_generator/cave_generator/lunar_sand/surface

	weighted_open_turf_types = list(/turf/open/misc/moonstation_sand = 1)

	weighted_flora_spawn_list = list(
		/obj/structure/flora/scrap = 10,
		/obj/structure/flora/ash/cacti = 20,
		/obj/structure/flora/bush/ferny = 5,
		/obj/structure/flora/bush/grassy/style_random = 1,
		/obj/structure/flora/bush/leavy/style_random = 1,
		/obj/structure/flora/bush/sparsegrass/style_random = 3,
		/obj/structure/flora/bush/stalky/style_random = 5,
	)

	weighted_mob_spawn = list(
		/mob/living/simple_animal/hostile/cazador/mining = 10,
		/mob/living/simple_animal/hostile/scorpion/mining = 10,
		/mob/living/basic/ant/mining = 40,
		/mob/living/basic/snake/mining = 20,
		/mob/living/basic/spider/giant/tangle/mining = 10,
	)

	mob_spawn_chance = 0.5
	initial_closed_chance = 45
	smoothing_iterations = 50
	birth_limit = 4
	death_limit = 3

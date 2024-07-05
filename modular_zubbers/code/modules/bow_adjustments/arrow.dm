#define BOW_EMBED_STATS list( \
		embed_chance = 100, \
		fall_chance = 0, \
		jostle_chance = 0, \
		ignore_throwspeed_threshold = TRUE, \
		pain_stam_pct = 0.5, \
		pain_mult = 1, \
		jostle_pain_mult = 1, \
		rip_time = 1 SECONDS \
	)

/obj/projectile/bullet/arrow
	damage = 20
	weak_against_armour = TRUE
	wound_bonus = CANT_WOUND
	range = 16
	embedding = BOW_EMBED_STATS
	var/tribal_damage_bonus = 20 //If you're an icemoon dweller, or an ashwalker.
	faction_bonus_force = 10 //Bonus force dealt against certain factions
	nemesis_paths = list(
		/mob/living/simple_animal/hostile/asteroid,
		/mob/living/basic/mining,
		/mob/living/basic/wumborian_fugu,
	)

/obj/projectile/bullet/arrow/prehit_pierce(mob/living/target, mob/living/carbon/human/user)

	if(isnull(target))
		return ..()

	if(user?.mind?.special_role == ROLE_LAVALAND)
		damage += tribal_damage_bonus
		weak_against_armour = FALSE

	return ..()

/obj/projectile/bullet/arrow/holy
	damage = 25 // Increase from 20
	embedding = BOW_EMBED_STATS

/obj/projectile/bullet/arrow/ash
	damage = 20
	armour_penetration = 20 // Buff from 0
	faction_bonus_force = 20 // Nerf from 60
	embedding = BOW_EMBED_STATS

/obj/projectile/bullet/arrow/bone
	damage = 25
	armour_penetration = 30 // Buff from 20
	wound_bonus = CANT_WOUND
	faction_bonus_force = 30 // Nerf from 35
	embedding = BOW_EMBED_STATS

/obj/projectile/bullet/arrow/bronze
	damage = 30
	armour_penetration = 30
	wound_bonus = CANT_WOUND
	faction_bonus_force = 90
	embedding = BOW_EMBED_STATS

#undef BOW_EMBED_STATS

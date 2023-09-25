
/obj/item/storage/box/syndie_kit/spaceassassin/PopulateContents()
	new /obj/item/knife/combat(src)
	switch(pick(list("red", "green", "dgreen", "blue", "orange", "black")))
		if("green")
			new /obj/item/clothing/head/helmet/space/syndicate/green(src)
			new /obj/item/clothing/suit/space/syndicate/green(src)
		if("dgreen")
			new /obj/item/clothing/head/helmet/space/syndicate/green/dark(src)
			new /obj/item/clothing/suit/space/syndicate/green/dark(src)
		if("blue")
			new /obj/item/clothing/head/helmet/space/syndicate/blue(src)
			new /obj/item/clothing/suit/space/syndicate/blue(src)
		if("red")
			new /obj/item/clothing/head/helmet/space/syndicate(src)
			new /obj/item/clothing/suit/space/syndicate(src)
		if("orange")
			new /obj/item/clothing/head/helmet/space/syndicate/orange(src)
			new /obj/item/clothing/suit/space/syndicate/orange(src)
		if("black")
			new /obj/item/clothing/head/helmet/space/syndicate/black(src)
			new /obj/item/clothing/suit/space/syndicate/black(src)

/obj/item/storage/box/syndie_kit/loadout

/obj/item/storage/backpack/duffelbag/syndie/loadout

/obj/item/storage/backpack/duffelbag/syndie/loadout/recon/PopulateContents()
	new /obj/item/clothing/glasses/thermal/syndi(src)
	new /obj/item/knife/combat/survival(src)
	new /obj/item/gun/energy/disabler(src)
// 	new /obj/item/storage/briefcase/launchpad(src) // Removed for now.
	new /obj/item/binoculars(src)
	new /obj/item/encryptionkey/syndicate(src)
	new /obj/item/storage/box/syndie_kit/space(src)
	new /obj/item/grenade/syndieminibomb(src)
	new /obj/item/flashlight/emp(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/spy/PopulateContents()
	new /obj/item/clothing/under/chameleon(src)
	new /obj/item/clothing/mask/chameleon(src)
	new /obj/item/card/id/advanced/chameleon(src)
	new /obj/item/clothing/shoes/chameleon/noslip(src)
	new /obj/item/computer_disk/syndicate/camera_app(src)
	new /obj/item/multitool/ai_detect(src)
	new /obj/item/encryptionkey/syndicate(src)
	new /obj/item/reagent_containers/syringe/mulligan(src)
	new /obj/item/switchblade(src)
	new /obj/item/storage/fancy/cigarettes/cigpack_syndicate (src)
	new /obj/item/flashlight/emp(src)
	new /obj/item/chameleon(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/stealthop/PopulateContents()
	new /obj/item/gun/energy/recharge/ebow(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/healthanalyzer/rad_laser(src)
	new /obj/item/chameleon(src)
	new /obj/item/soap/syndie(src)
	new /obj/item/clothing/glasses/thermal/syndi(src)
	new /obj/item/flashlight/emp(src)
	new /obj/item/jammer(src)
	new /obj/item/card/emag/doorjack(src)
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/clothing/under/syndicate/camo(src)
	new /obj/item/clothing/shoes/combat(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/hacker/PopulateContents()
	new /obj/item/ai_module/syndicate(src)
	new /obj/item/card/emag(src)
	new /obj/item/card/emag/doorjack(src)
	new /obj/item/encryptionkey/binary(src)
	new /obj/item/ai_module/toy_ai(src)
	new /obj/item/multitool/ai_detect(src)
	new /obj/item/storage/toolbox/syndicate(src)
	new /obj/item/computer_disk/syndicate/camera_app(src)
	new /obj/item/clothing/glasses/thermal/syndi(src)
	new /obj/item/card/id/advanced/chameleon(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/sniper/PopulateContents()
	new /obj/item/gun/ballistic/automatic/sniper_rifle/modular/blackmarket(src)
	new /obj/item/ammo_box/magazine/sniper_rounds/soporific(src)
	new /obj/item/ammo_box/magazine/sniper_rounds/soporific(src)
	new /obj/item/ammo_box/magazine/sniper_rounds/soporific(src)
	new /obj/item/ammo_box/magazine/sniper_rounds/soporific(src)
	new /obj/item/ammo_box/magazine/sniper_rounds(src)
	new /obj/item/ammo_box/magazine/sniper_rounds(src)
	new /obj/item/clothing/glasses/thermal/syndi(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/clothing/mask/gas/clown_hat(src)
	new /obj/item/clothing/under/syndicate/sniper(src)
	new /obj/item/knife/combat/survival(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/metaops/PopulateContents()
	new /obj/item/mod/control/pre_equipped/traitor(src)
	new /obj/item/gun/ballistic/shotgun/bulldog/unrestricted(src)
	new /obj/item/implanter/explosive(src)
	new /obj/item/ammo_box/magazine/m12g(src)
	new /obj/item/ammo_box/magazine/m12g(src)
	new /obj/item/grenade/c4 (src)
	new /obj/item/grenade/c4 (src)
	new /obj/item/card/emag(src)
	new /obj/item/card/emag/doorjack(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/bond/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol(src)
	new /obj/item/suppressor(src)
	new /obj/item/ammo_box/magazine/m9mm(src)
	new /obj/item/ammo_box/magazine/m9mm(src)
	new /obj/item/clothing/glasses/thermal/monocle(src)
	new /obj/item/clothing/under/chameleon(src)
	new /obj/item/card/id/advanced/chameleon(src)
	new /obj/item/card/emag/doorjack(src)
	new /obj/item/reagent_containers/hypospray/medipen/stimulants(src)
	new /obj/item/reagent_containers/cup/rag(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/darklord/PopulateContents()
	new /obj/item/dualsaber(src)
	new /obj/item/dnainjector/telemut/darkbundle(src)
	new /obj/item/clothing/suit/hooded/chaplain_hoodie(src)
	new /obj/item/card/id/advanced/chameleon(src)
	new /obj/item/clothing/shoes/chameleon/noslip(src)
	new /obj/item/book/granter/action/spell/summonitem(src)

/obj/item/storage/box/syndie_kit/loadout/hunter/PopulateContents()
	new /obj/item/gun/ballistic/rifle/boltaction/harpoon(src)
	new /obj/item/storage/bag/harpoon_quiver(src)
	new /obj/item/clothing/suit/hooded/carp_costume/spaceproof(src)
	new /obj/item/clothing/mask/gas/carp(src)
	new /obj/item/grenade/spawnergrenade/spesscarp(src)

/obj/item/storage/box/syndie_kit/loadout/bee/PopulateContents()
	new /obj/item/clothing/suit/hooded/bee_costume(src)
	new /obj/item/clothing/mask/animal/small/bee(src)
	new /obj/item/storage/belt/fannypack/yellow(src)
	new /obj/item/grenade/spawnergrenade/buzzkill(src)
	new /obj/item/grenade/spawnergrenade/buzzkill(src)
	new /obj/item/reagent_containers/cup/bottle/beesease(src)
	new /obj/item/melee/beesword(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/cryomancer/PopulateContents()
	new /obj/item/clothing/glasses/cold(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/mask/chameleon(src)
	new /obj/item/clothing/suit/hooded/wintercoat(src)
	new /obj/item/clothing/shoes/winterboots(src)
	new /obj/item/grenade/gluon(src)
	new /obj/item/grenade/gluon(src)
	new /obj/item/grenade/gluon(src)
	new /obj/item/grenade/gluon(src)
	new /obj/item/dnainjector/geladikinesis(src)
	new /obj/item/dnainjector/cryokinesis(src)
	new /obj/item/gun/energy/temperature/security(src)
	new /obj/item/melee/energy/sword(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/doctordeath/PopulateContents()
	new /obj/item/storage/box/syndie_kit/chemical(src)
	new /obj/item/gun/syringe/syndicate(src)
	new /obj/item/grenade/clusterbuster/metalfoam(src)
	new /obj/item/grenade/clusterbuster/soap(src)
	new /obj/item/storage/toolbox/syndicate(src)
	new /obj/item/storage/box/syringes(src)
	new /obj/item/clothing/suit/toggle/labcoat/mad(src)
	new /obj/item/clothing/gloves/latex/nitrile(src)
	new /obj/item/grenade/clusterbuster/spawner_spesscarp(src)
	new /obj/item/pen/edagger(src)
	new /obj/item/clothing/mask/surgical(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/clothing/glasses/hud/eyepatch/sci(src)
	new /obj/item/megaphone(src)
	new /obj/item/toy/figure/chemist(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/donkshillkit/PopulateContents()
	new /obj/item/circuitboard/machine/vending/donksofttoyvendor(src)
	new /obj/item/vending_refill/donksoft(src)
	new /obj/item/vending_refill/donksoft(src)
	new /obj/item/vending_refill/donksoft(src)
	new /obj/item/storage/toolbox/syndicate(src)
	new /obj/item/stack/sheet/iron/five(src)
	new /obj/item/ammo_box/foambox/riot(src)
	new /obj/item/ammo_box/foambox/riot(src)
	new /obj/item/gun/ballistic/automatic/c20r/toy/unrestricted/riot(src)
	new /obj/item/gun/ballistic/automatic/l6_saw/toy/unrestricted/riot(src)
	new /obj/item/toy/balloon/syndicate(src)
	new /obj/item/storage/box/fakesyndiesuit(src)
	new /obj/item/storage/box/donkpockets(src)

/obj/item/storage/backpack/duffelbag/syndie/loadout/downtownspecial/PopulateContents()
	new /obj/item/gun/ballistic/automatic/tommygun(src)
	new /obj/item/ammo_box/magazine/tommygunm45(src)
	new /obj/item/clothing/suit/jacket/det_suit/noir/mafioso(src)
	new /obj/item/clothing/under/suit/black/armoured(src)
	new /obj/item/clothing/mask/fakemoustache/italian(src)
	new /obj/item/switchblade(src)
	new /obj/item/clothing/shoes/laceup(src)
	new /obj/item/virgin_mary(src)
	new /obj/item/reagent_containers/cup/glass/bottle/whiskey(src)
	new /obj/item/storage/box/drinkingglasses(src)
	new /obj/item/storage/fancy/candle_box(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/lighter(src)
	new /obj/item/storage/fancy/cigarettes/cigars/cohiba(src)

/obj/item/storage/box/syndie_kit/loadout/ocelotfoxtrot/PopulateContents()
	new /obj/item/gun/ballistic/revolver/ocelot(src)
	new /obj/item/ammo_box/a357/peacemaker(src)
	new /obj/item/ammo_box/a357/peacemaker(src)
	new /obj/item/toy/plush/skyrat/fox (src)
	new /obj/item/clothing/suit/jacket/det_suit/noir/ocelot(src)
	new /obj/item/clothing/head/beret/sec/ocelot(src)
	new /obj/item/storage/belt/holster/chameleon(src)

/obj/item/storage/box/syndie_kit/loadout/nt_impostor/PopulateContents()
	new /obj/item/clothing/under/rank/centcom/officer(src)
	new /obj/item/clothing/head/hats/centcom_cap(src)
	new /obj/item/clothing/suit/armor/centcom_formal(src)
	new /obj/item/clothing/shoes/combat(src)
	new /obj/item/radio/headset/headset_cent/impostorsr(src)
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/storage/backpack/satchel(src)
	new /obj/item/gun/ballistic/revolver/mateba(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/modular_computer/pda/heads(src)
	new /obj/item/clipboard(src)
	new /obj/item/card/id/advanced/chameleon/impostorsr(src)
	new /obj/item/stamp/centcom(src)
	new /obj/item/storage/belt/sabre(src)
	new /obj/item/clothing/gloves/combat(src)

/obj/item/storage/box/syndie_kit/loadout/lasermanbundle/PopulateContents()
	new /obj/item/melee/energy/sword/saber(src)
	new /obj/item/book/granter/martial/carp(src)
	new /obj/item/clothing/under/syndicate/combat(src)
	new /obj/item/clothing/shoes/combat/swat(src)
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/grenade/spawnergrenade/manhacks(src)
	for(var/i in 1 to 6)
		new /obj/item/pen/edagger(src)

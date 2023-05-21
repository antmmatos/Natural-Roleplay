cfg = {}

cfg.framework = "esx" --esx,qbcore,vrp,vrpex,nunoradioman,standalone | Check server/functions.lua

cfg.updateserverside = true -- this makes sure the player has the correct list, IF YOU HAVE 500+ PLAYERS AND RUNNING ALL OF THE SCRIPTS PUT THIS "FALSE"

cfg.job = {
	blips = {
		--{x,y,z,sprite,colour,text,scale}
		{-768.94439697266,5596.8696289063,33.605041503906,141,17,"Centro de Caça",0.7},
	},
	service = {
		minigame_waittime = {2,5}, -- seconds | this is the time before the minigame starts triggering.
		minigame_amount = {2,5}, --{min,max}  | this are the amount of times the minigame will appear.

		hunter_animals = {
			GetHashKey("a_c_boar"), -- boar
			GetHashKey("a_c_deer"), -- deer
			GetHashKey("a_c_hen"), -- chicken
			GetHashKey("a_c_mtlion"), -- lion
		},
		item_to_give = {
			--[animal hash] = { {item,min_amount,max_amount}, },
			[GetHashKey("a_c_boar")] = {
				{"hunter_meat_boar",1,3},
				{"hunter_animal_fat",2,10},
				{"hunter_animal_cloth",1,3},
				{"hunter_animal_leather",1,3},
				{"hunter_animal_bonefragments",5,10},
			},
			[GetHashKey("a_c_deer")] = {
				{"hunter_meat_deer",1,3},
				{"hunter_animal_fat",1,3},
				{"hunter_animal_cloth",2,10},
				{"hunter_animal_leather",1,2},
				{"hunter_animal_bonefragments",5,10},
			},
			[GetHashKey("a_c_hen")] = {
				{"hunter_meat_chicken",1,1},
				{"hunter_animal_fat",1,2},
				{"hunter_animal_cloth",1,2},
				{"hunter_animal_bonefragments",5,10},
			},
			[GetHashKey("a_c_mtlion")] = {
				{"hunter_meat_lion",1,3},
				{"hunter_animal_fat",1,3},
				{"hunter_animal_cloth",1,3},
				{"hunter_animal_leather",2,10},
				{"hunter_animal_bonefragments",5,10},
			},
		},

		skin_animal_text = "[E] Skin",
		skin_animal_key = 51,
	},
	transformers = {
		--[[[1] = {
			pos = {-768.94439697266,5596.8696289063,33.605041503906 - 1,166.72},
			ped = GetHashKey("a_m_m_farmer_01"),
			prop = nil,
			text = "[E] Shop",
			text_key = 51,
			recipes = {
				[1] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "hunter_meat_boar",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 25,
						},
					},
				},
				[2] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "hunter_meat_deer",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 35,
						},
					},
				},
				[3] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "hunter_meat_chicken",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 15,
						},
					},
				},
				[4] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "hunter_meat_lion",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 100,
						},
					},
				},
				[5] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "hunter_animal_fat",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 5,
						},
					},
				},
				[6] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "hunter_animal_cloth",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 7,
						},
					},
				},
				[7] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "hunter_animal_leather",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 10,
						},
					},
				},
				[8] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "hunter_animal_bonefragments",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 2,
						},
					},
				},
				[9] = {
					time = 0, -- seconds
					anim = false, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "money",
							amount = 1000,
						},
					},
					output = {
						{
							name = "weapon_melee_knife",
							amount = 1,
						},
					},
				},
				[10] = {
					time = 0, -- seconds
					anim = false, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "money",
							amount = 2500,
						},
					},
					output = {
						{
							name = "weapon_rifle_musket",
							amount = 1,
						},
					},
				},
				[11] = {
					time = 0, -- seconds
					anim = false, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "money",
							amount = 25,
						},
					},
					output = {
						{
							name = "ammo_musket",
							amount = 1,
						},
					},
				},
			}
		},]]
	},
}
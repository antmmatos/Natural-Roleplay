cfg = {}

cfg.framework = "esx" --esx,qbcore,vrp,vrpex,nunoradioman,standalone | Check server/functions.lua

cfg.updateserverside = true -- this makes sure the player has the correct list, IF YOU HAVE 500+ PLAYERS AND RUNNING ALL OF THE SCRIPTS PUT THIS "FALSE"

cfg.job = {
	blips = {
		--{x,y,z,sprite,colour,text,scale}
		{2954.0954589844,2787.8149414063,41.506732940674,617,17,"Mina",0.7},
		{1109.0316162109,-2007.5693359375,30.941841125488,617,17,"Fundição",0.7},
		{-219.88093566895,-1174.1481933594,23.025989532471,617,17,"Venda Minérios",0.7},
	},
	service = {
		weapon = GetHashKey("WEAPON_BATTLEAXE"),
	},
	transformers = {
		--[[[1] = {
			pos = {1109.5374755859,-2007.9108886719,31.044216156006 - 1,53.35},
			ped = GetHashKey("a_m_m_farmer_01"),
			prop = nil,
			text = "[E] Smelt",
			text_key = 51,
			recipes = {
				[1] = {
					time = 5, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "carbon_rock",
							amount = 2,
						},
					},
					output = {
						{
							name = "carbon_metal",
							amount = 1,
						},
					},
				},
				[2] = {
					time = 5, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "iron_rock",
							amount = 2,
						},
					},
					output = {
						{
							name = "iron_metal",
							amount = 1,
						},
					},
				},
				[3] = {
					time = 12, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "gold_rock",
							amount = 2,
						},
					},
					output = {
						{
							name = "gold_metal",
							amount = 1,
						},
					},
				},
			}
		},
		[2] = {
			pos = {2944.9018554688,2746.7592773438,43.378768920898 - 1,285.86},
			ped = GetHashKey("a_m_m_farmer_01"),
			prop = nil,
			text = "[E] Shop",
			text_key = 51,
			recipes = {
				[1] = {
					time = 0, -- seconds
					anim = false, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0 DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "money",
							amount = 750,
						},
					},
					output = {
						{
							name = "weapon_melee_pickaxe",
							amount = 1,
						},
					},
				},
			}
		},
		[3] = {
			pos = {-219.88093566895,-1174.1481933594,23.025989532471 - 1,90.61},
			ped = GetHashKey("a_m_m_farmer_01"),
			prop = nil,
			text = "[E] Shop",
			text_key = 51,
			recipes = {
				[1] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0 DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "stone_rock",
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
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0 DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "carbon_metal",
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
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0 DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "iron_metal",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 50,
						},
					},
				},
				[4] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0 DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "gold_metal",
							amount = 1,
						},
					},
					output = {
						{
							name = "money",
							amount = 75,
						},
					},
				},
			}
		},]]
	},
	interactables = {
		[1] = {
			pos = {2944.2763671875,2770.6254882813,39.272468566895 - 1,359.0},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_b"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[2] = {
			pos = {2948.8498535156,2770.5642089844,39.013954162598 - 1,13.56},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_c"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[3] = {
			pos = {2946.787109375,2774.6831054688,39.219913482666 - 1,357.64},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_d"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[4] = {
			pos = {2942.2963867188,2774.958984375,39.23609161377 - 1,35.18},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_e"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[5] = {
			pos = {2943.3408203125,2779.9235839844,39.408416748047 - 1,243.82},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_f"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[6] = {
			pos = {2937.9711914063,2780.0573730469,39.354907989502 - 1,316.51},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_g"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[7] = {
			pos = {2939.3393554688,2783.9460449219,39.641448974609 - 1,270.78},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_j"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[8] = {
			pos = {2943.416015625,2784.9255371094,39.812870025635 - 1,219.08},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_b"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[9] = {
			pos = {2948.6049804688,2779.7553710938,39.52433013916 - 1,127.09},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_c"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[10] = {
			pos = {2970.8037109375,2783.8032226563,39.183113098145 - 1,338.85},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_d"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[11] = {
			pos = {2973.7138671875,2789.2060546875,40.014324188232 - 1,75.8},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_e"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[12] = {
			pos = {2966.826171875,2790.2795410156,39.986465454102 - 1,239.9},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_f"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[13] = {
			pos = {2971.3547363281,2794.7312011719,40.747982025146 - 1,165.51},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_g"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[14] = {
			pos = {2964.3181152344,2783.1247558594,39.461868286133 - 1,326.73},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_j"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[15] = {
			pos = {2960.4931640625,2791.5573730469,40.475467681885 - 1,228.7},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_b"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[16] = {
			pos = {2965.4516601563,2799.40234375,41.207252502441 - 1,210.56},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_c"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[17] = {
			pos = {2958.8032226563,2798.8947753906,41.248844146729 - 1,58.04},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_d"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[18] = {
			pos = {2933.5534667969,2793.482421875,40.481342315674 - 1,238.27},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_e"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[19] = {
			pos = {2932.5737304688,2802.9152832031,41.51749420166 - 1,208.47},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_f"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[20] = {
			pos = {2942.8269042969,2794.2038574219,40.517246246338 - 1,137.73},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_g"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[21] = {
			pos = {2939.6467285156,2802.255859375,41.189506530762 - 1,171.24},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_j"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[22] = {
			pos = {2936.6630859375,2797.1594238281,40.826400756836 - 1,293.07},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_b"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
		[23] = {
			pos = {2938.2307128906,2790.7465820313,40.202716827393 - 1,288.69},  -- {x,y,z,heading}

			hash = GetHashKey("prop_rock_3_c"), -- rock model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount}
				{"stone_rock",1,1},
				{"carbon_rock",1,1},
				{"iron_rock",1,1},
				{"gold_rock",1,1},
			},
		},
	},
}
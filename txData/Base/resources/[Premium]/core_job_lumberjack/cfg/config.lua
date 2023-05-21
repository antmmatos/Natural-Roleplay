cfg = {}

cfg.framework = "esx" --esx,qbcore,vrp,vrpex,nunoradioman,standalone | Check server/functions.lua

cfg.updateserverside = true -- this makes sure the player has the correct list, IF YOU HAVE 500+ PLAYERS AND RUNNING ALL OF THE SCRIPTS PUT THIS "FALSE"

cfg.job = {
	blips = {
		--{x,y,z,sprite,colour,text,scale}
		{2788.6477050781,4785.6611328125,46.331970214844,478,17,"Floresta",0.7},
		{-552.6669921875,5327.4282226563,73.599708557129,478,17,"Serraria",0.7},
		{-219.72560119629,-1165.9136962891,23.014305114746,478,17,"Venda Madeira",0.7},
	},
	service = {
		weapon = GetHashKey("WEAPON_HATCHET"),
	},
	transformers = {
		--[[[1] = {
			pos = {-552.6669921875,5327.4282226563,73.599708557129 - 1,158.6},
			ped = GetHashKey("a_m_m_farmer_01"),
			prop = nil,
			text = "[E] Cut",
			text_key = 51,
			recipes = {
				[1] = {
					time = 0, -- seconds
					anim = false, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "money",
							amount = 250,
						},
					},
					output = {
						{
							name = "weapon_melee_hatchet",
							amount = 1,
						},
					},
				},
				[2] = {
					time = 5, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "wood_raw",
							amount = 2,
						},
					},
					output = {
						{
							name = "wood_processed",
							amount = 1,
						},
					},
				},
			}
		},
		[2] = {
			pos = {-219.72560119629,-1165.9136962891,23.014305114746 - 1,86.52},
			ped = GetHashKey("a_m_m_farmer_01"),
			prop = nil,
			text = "[E] Sell",
			text_key = 51,
			recipes = {
				[1] = {
					time = 1, -- seconds
					anim = true, -- if true will do a animation if not it wont do DONT MAKE THE ANIMATION WHEN TIME IS 0
					input = {
						{
							name = "wood_processed",
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
			}
		},]]
	},
	interactables = {
		[1] = {
			pos = {2767.9982910156,4795.4819335938,45.558933258057,183.1},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[2] = {
			pos = {2760.2351074219,4788.25390625,45.362682342529,238.27},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[3] = {
			pos = {2763.0727539063,4779.1508789063,45.566772460938,172.88},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[4] = {
			pos = {2771.3208007813,4781.6884765625,45.876262664795,306.35},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[5] = {
			pos = {2778.2666015625,4785.513671875,46.093933105469,251.02},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[6] = {
			pos = {2782.4685058594,4796.5444335938,46.160427093506,339.74},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[7] = {
			pos = {2787.9973144531,4787.1928710938,46.322875976563,182.46},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[8] = {
			pos = {2783.2124023438,4775.3896484375,46.187686920166,52.71},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[9] = {
			pos = {2775.2321777344,4772.0141601563,45.991912841797,179.71},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[10] = {
			pos = {2786.4914550781,4766.265625,46.212482452393,245.34},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[11] = {
			pos = {2802.076171875,4769.1772460938,46.650409698486,68.74},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[12] = {
			pos = {2794.4348144531,4776.5771484375,46.42652130127,62.53},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[13] = {
			pos = {2799.7524414063,4786.3911132813,46.718112945557,327.01},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[14] = {
			pos = {2794.9948730469,4794.6162109375,46.493465423584,125.2},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[15] = {
			pos = {2790.8879394531,4810.443359375,46.124370574951,47.17},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[16] = {
			pos = {2807.3073730469,4805.5561523438,47.128791809082,156.0},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[17] = {
			pos = {2811.5290527344,4795.0170898438,47.521385192871,216.58},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[18] = {
			pos = {2809.1184082031,4782.4482421875,47.255771636963,111.27},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[19] = {
			pos = {2785.7902832031,4804.8471679688,46.100967407227,73.54},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[20] = {
			pos = {2776.2116699219,4796.150390625,45.891254425049,176.08},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[21] = {
			pos = {2774.2116699219,4807.6069335938,45.250419616699,278.52},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[22] = {
			pos = {2762.3669433594,4800.1171875,45.20446395874,122.47},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[23] = {
			pos = {2768.3330078125,4788.4116210938,45.709957122803,270.84},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[24] = {
			pos = {2781.0187988281,4791.0102539063,46.180156707764,279.1},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[25] = {
			pos = {2797.1945800781,4802.9204101563,46.608558654785,296.79},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[26] = {
			pos = {2767.4729003906,4774.6772460938,45.795486450195,295.6},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[27] = {
			pos = {2779.8303222656,4780.46484375,46.120941162109,262.89},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[28] = {
			pos = {2792.6223144531,4782.0581054688,46.407531738281,325.09},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[29] = {
			pos = {2795.1552734375,4765.4404296875,46.393905639648,181.58},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
		[30] = {
			pos = {2804.4733886719,4775.572265625,46.873683929443,25.78},  -- {x,y,z,heading}

			hash = GetHashKey("test_tree_cedar_trunk_001"), -- Tree model

			net_id = 0, -- dont change
			status = false, -- dont change
			health = 1000, -- dont change
			resettimer = 15, -- minutes

			item_to_give = { -- {item,min_amount,max_amount,chance}
				{"wood_raw",1,1,100},
			},
		},
	},
}
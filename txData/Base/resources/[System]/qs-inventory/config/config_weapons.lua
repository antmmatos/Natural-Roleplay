--░██╗░░░░░░░██╗███████╗░█████╗░██████╗░░█████╗░███╗░░██╗░██████╗
--░██║░░██╗░░██║██╔════╝██╔══██╗██╔══██╗██╔══██╗████╗░██║██╔════╝
--░╚██╗████╗██╔╝█████╗░░███████║██████╔╝██║░░██║██╔██╗██║╚█████╗░
--░░████╔═████║░██╔══╝░░██╔══██║██╔═══╝░██║░░██║██║╚████║░╚═══██╗
--░░╚██╔╝░╚██╔╝░███████╗██║░░██║██║░░░░░╚█████╔╝██║░╚███║██████╔╝
--░░░╚═╝░░░╚═╝░░╚══════╝╚═╝░░╚═╝╚═╝░░░░░░╚════╝░╚═╝░░╚══╝╚═════╝░

Config.LimitAmmo = false --If you use true, players can only load one magazine (If you use false, they can use the bullets they want)
Config.ReloadAnimation = true -- Enable a reload animations every time you add ammo to your weapon

Config.AttachmentLabel = { -- This is the components label
    supressor = "Silenciador",
    flashlight = "Lanterna",
    scope = "Mira",
    clip = "Carregador extendido",
    tint = "Pintura",
    addonslot1 = "",
    addonslot2 = "",
    addonslot3 = "",
    addonslot4 = "",
}

Config.Bombs = {
    [`weapon_grenade`] = 'weapon_grenade', -- Throwing weapons.
    [`weapon_bzgas`] = 'weapon_bzgas',
    [`weapon_molotov`] = 'weapon_molotov',
    [`weapon_stickybomb`] = 'weapon_stickybomb',
    [`weapon_proxmine`] = 'weapon_proxmine',
    [`weapon_snowball`] = 'weapon_snowball',
    [`weapon_pipebomb`] = 'weapon_pipebomb',
    [`weapon_ball`] = 'weapon_ball',
    [`weapon_smokegrenade`] = 'weapon_smokegrenade',
    [`weapon_flare`] = 'weapon_flare',
}

-- If you don't specify the ammount by default its 1.
Config.BombsAmount = {
    [`weapon_grenade`] = 1, -- Number of uses.
    [`weapon_bzgas`] = 1,
    [`weapon_molotov`] = 1,
    [`weapon_stickybomb`] = 1,
    [`weapon_proxmine`] = 1,
    [`weapon_snowball`] = 1,
    [`weapon_pipebomb`] = 1,
    [`weapon_ball`] = 1,
    [`weapon_smokegrenade`] = 1,
    [`weapon_flare`] = 1,
}

Config.UseMultiplier = {
    -- Mele weapons 
    ["weapon_dagger"] = 0.15,
    ["weapon_bat"] = 0.15,
    ["weapon_bottle"] = 0.15,
    ["weapon_crowbar"] = 0.15,
    ["weapon_unarmed"] = 0.15,
    ["weapon_flashlight"] = 0.15,
    ["weapon_golfclub"] = 0.15,
    ["weapon_hammer"] = 0.15,
    ["weapon_hatchet"] = 0.15,
    ["weapon_knuckle"] = 0.15,
    ["weapon_knife"] = 0.15,
    ["weapon_machete"] = 0.15,
    ["weapon_switchblade"] = 0.15,
    ["weapon_nightstick"] = 0.15,
    ["weapon_wrench"] = 0.15,
    ["weapon_battleaxe"] = 0.15,
    ["weapon_poolcue"] = 0.15,
    ["weapon_stone_hatchet"] = 0.15,

    -- Handguns
    ["weapon_pistol"] = 0.15,
    ["weapon_pistol_mk2"] = 0.15,
    ["weapon_combatpistol"] = 0.15,
    ["weapon_appistol"] = 0.15,
    ["weapon_stungun"] = 0.15,
    ["weapon_pistol50"] = 0.15,
    ["weapon_snspistol"] = 0.15,
    ["weapon_snspistol_mk2"] = 0.15,
    ["weapon_heavypistol"] = 0.15,
    ["weapon_vintagepistol"] = 0.15,
    ["weapon_flaregun"] = 0.15,
    ["weapon_marksmanpistol"] = 0.15,
    ["weapon_revolver"] = 0.15,
    ["weapon_revolver_mk2"] = 0.15,
    ["weapon_doubleaction"] = 0.15,
    ["weapon_raypistol"] = 0.15,
    ["weapon_ceramicpistol"] = 0.15,
    ["weapon_navyrevolver"] = 0.15,
    ["weapon_gadgetpistol"] = 0.15,
    ["weapon_stungun_mp"] = 0.15,

    -- Submachine Guns    
    ["weapon_microsmg"] = 0.15,
    ["weapon_smg"] = 0.15,
    ["weapon_smg_mk2"] = 0.15,
    ["weapon_assaultsmg"] = 0.15,
    ["weapon_combatpdw"] = 0.15,
    ["weapon_machinepistol"] = 0.15,
    ["weapon_minismg"] = 0.15,
    ["weapon_raycarbine"] = 0.15,

    -- Shotguns    
    ["weapon_pumpshotgun"] = 0.15,
    ["weapon_pumpshotgun_mk2"] = 0.15,
    ["weapon_sawnoffshotgun"] = 0.15,
    ["weapon_assaultshotgun"] = 0.15,
    ["weapon_bullpupshotgun"] = 0.15,
    ["weapon_musket"] = 0.15,
    ["weapon_heavyshotgun"] = 0.15,
    ["weapon_dbshotgun"] = 0.15,
    ["weapon_autoshotgun"] = 0.15,
    ["weapon_combatshotgun"] = 0.15,

    -- Assault Rifles    
    ["weapon_assaultrifle"] = 0.15,
    ["weapon_assaultrifle_mk2"] = 0.15,
    ["weapon_carbinerifle"] = 0.15,
    ["weapon_carbinerifle_mk2"] = 0.15,
    ["weapon_advancedrifle"] = 0.15,
    ["weapon_specialcarbine"] = 0.15,
    ["weapon_specialcarbine_mk2"] = 0.15,
    ["weapon_bullpuprifle"] = 0.15,
    ["weapon_bullpuprifle_mk2"] = 0.15,
    ["weapon_compactrifle"] = 0.15,
    ["weapon_militaryrifle"] = 0.15,
    ["weapon_heavyrifle"] = 0.15,
    ["weapon_tacticalrifle"] = 0.15,

    -- Light Machine Guns
    ["weapon_mg"] = 0.15,
    ["weapon_combatmg"] = 0.15,
    ["weapon_combatmg_mk2"] = 0.15,
    ["weapon_gusenberg"] = 0.15,

    -- Sniper Rifles
    ["weapon_sniperrifle"] = 0.15,
    ["weapon_heavysniper"] = 0.15,
    ["weapon_heavysniper_mk2"] = 0.15,
    ["weapon_marksmanrifle"] = 0.15,
    ["weapon_marksmanrifle_mk2"] = 0.15,
    ["weapon_precisionrifle"] = 0.15,

    -- Heavy Weapons
    ["weapon_rpg"] = 0.15,
    ["weapon_grenadelauncher"] = 0.15,
    ["weapon_grenadelauncher_smoke"] = 0.15,
    ["weapon_minigun"] = 0.15,
    ["weapon_firework"] = 0.15,
    ["weapon_railgun"] = 0.15,
    ["weapon_hominglauncher"] = 0.15,
    ["weapon_compactlauncher"] = 0.15,
    ["weapon_rayminigun"] = 0.15,
    ["weapon_emplauncher"] = 0.15,

    -- Throwables    
    ["weapon_grenade"] = 0.15,
    ["weapon_bzgas"] = 0.15,
    ["weapon_molotov"] = 0.15,
    ["weapon_stickybomb"] = 0.15,
    ["weapon_proxmine"] = 0.15,
    ["weapon_snowball"] = 0.15,
    ["weapon_pipebomb"] = 0.15,
    ["weapon_ball"] = 0.15,
    ["weapon_smokegrenade"] = 0.15,
    ["weapon_flare"] = 0.15,

    -- Miscellaneous
    ["weapon_petrolcan"] = 0.15,
    ["gadget_parachute"] = 0.15,
    ["weapon_fireextinguisher"] = 0.15,
    ["weapon_hazardcan"] = 0.15,
    ["weapon_fertilizercan"] = 0.15,
    ["id_card"]          			 = 0.15,
    ["driver_license"]          	 = 0.15,
    ["lawyerpass"]          		 = 0.15,
    ["radio"]                   	 = 0.5,
    ["walkstick"]                    = 1,
    ["fitbit"]                   	 = 1,
    ["binoculars"]                   = 1,
    ["diving_gear"]                  = 5,
    ["parachute"]                    = 5,
    ["security_card_01"]          	 = 5,
    ["security_card_02"]          	 = 5,
    ["electronickit"]          		 = 5,
    ["handcuffs"]          		     = 1,
    ["tunerlaptop"]          		 = 1,
    ["lockpick"] 				     = 5,
    ["advancedlockpick"] 		     = 5,
    ["fishingrod"] 				     = 5,
    ["labkey"] 			    	     = 1,
    ["thermite"] 			    	 = 1,
    ["pistol_suppressor"] 			 = 3,
    ["pistol_ammo"] 			     = 3,
    ["rifle_ammo"]  			     = 3,
    ["smg_ammo"]    			     = 3,
    ["mg_ammo"]  			         = 3,
    ["shotgun_ammo"]  			     = 3,
    ["weapon_shoe"] 				 = 0.0,
}

Config.DurabilityBlockedWeapons = { --These weapons will not bring durability.
    "weapon_dagger",
    "weapon_bat",
    "weapon_stungun",
    "weapon_crowbar",
    "weapon_bottle",
    "weapon_unarmed",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_golfclub",
    "weapon_hamme",
    "weapon_hatchet",
    "weapon_knife",
    "weapon_machete",
    "weapon_wrench",
    "weapon_battleaxe",
    "weapon_poolcue",
    "weapon_stone_hatchet",
    "weapon_grenade",
    "weapon_molotov",
    "weapon_stickybomb",
    "weapon_proxmine",
    "weapon_snowball",
    "weapon_pipebomb",
    "weapon_ball",
    "weapon_battleaxe",
    "weapon_smokegrenade",
    "weapon_flare",
    "weapon_petrolcan",
    "weapon_fireextinguisher",
    "weapon_hazardcan",
}

Config.DurabilityMultiplier = { --This is the speed at which the weapons will break.
-- Mele weapons 
    ["weapon_dagger"] = 0.15,
    ["weapon_bat"] = 0.15,
    ["weapon_bottle"] = 0.15,
    ["weapon_crowbar"] = 0.15,
    ["weapon_unarmed"] = 0.15,
    ["weapon_flashlight"] = 0.15,
    ["weapon_golfclub"] = 0.15,
    ["weapon_hammer"] = 0.15,
    ["weapon_hatchet"] = 0.15,
    ["weapon_knuckle"] = 0.15,
    ["weapon_knife"] = 0.15,
    ["weapon_machete"] = 0.15,
    ["weapon_switchblade"] = 0.15,
    ["weapon_nightstick"] = 0.15,
    ["weapon_wrench"] = 0.15,
    ["weapon_battleaxe"] = 0.15,
    ["weapon_poolcue"] = 0.15,
    ["weapon_stone_hatchet"] = 0.15,

-- Handguns
    ["weapon_pistol"] = 0.15,
    ["weapon_pistol_mk2"] = 0.15,
    ["weapon_combatpistol"] = 0.15,
    ["weapon_appistol"] = 0.15,
    ["weapon_stungun"] = 0.15,
    ["weapon_pistol50"] = 0.15,
    ["weapon_snspistol"] = 0.15,
    ["weapon_snspistol_mk2"] = 0.15,
    ["weapon_heavypistol"] = 0.15,
    ["weapon_vintagepistol"] = 0.15,
    ["weapon_flaregun"] = 0.15,
    ["weapon_marksmanpistol"] = 0.15,
    ["weapon_revolver"] = 0.15,
    ["weapon_revolver_mk2"] = 0.15,
    ["weapon_doubleaction"] = 0.15,
    ["weapon_raypistol"] = 0.15,
    ["weapon_ceramicpistol"] = 0.15,
    ["weapon_navyrevolver"] = 0.15,
    ["weapon_gadgetpistol"] = 0.15,
    ["weapon_stungun_mp"] = 0.15,

-- Submachine Guns    
    ["weapon_microsmg"] = 0.15,
    ["weapon_smg"] = 0.15,
    ["weapon_smg_mk2"] = 0.15,
    ["weapon_assaultsmg"] = 0.15,
    ["weapon_combatpdw"] = 0.15,
    ["weapon_machinepistol"] = 0.15,
    ["weapon_minismg"] = 0.15,
    ["weapon_raycarbine"] = 0.15,

-- Shotguns    
    ["weapon_pumpshotgun"] = 0.15,
    ["weapon_pumpshotgun_mk2"] = 0.15,
    ["weapon_sawnoffshotgun"] = 0.15,
    ["weapon_assaultshotgun"] = 0.15,
    ["weapon_bullpupshotgun"] = 0.15,
    ["weapon_musket"] = 0.15,
    ["weapon_heavyshotgun"] = 0.15,
    ["weapon_dbshotgun"] = 0.15,
    ["weapon_autoshotgun"] = 0.15,
    ["weapon_combatshotgun"] = 0.15,

-- Assault Rifles    
    ["weapon_assaultrifle"] = 0.15,
    ["weapon_assaultrifle_mk2"] = 0.15,
    ["weapon_carbinerifle"] = 0.15,
    ["weapon_carbinerifle_mk2"] = 0.15,
    ["weapon_advancedrifle"] = 0.15,
    ["weapon_specialcarbine"] = 0.15,
    ["weapon_specialcarbine_mk2"] = 0.15,
    ["weapon_bullpuprifle"] = 0.15,
    ["weapon_bullpuprifle_mk2"] = 0.15,
    ["weapon_compactrifle"] = 0.15,
    ["weapon_militaryrifle"] = 0.15,
    ["weapon_heavyrifle"] = 0.15,
    ["weapon_tacticalrifle"] = 0.15,

-- Light Machine Guns
    ["weapon_mg"] = 0.15,
    ["weapon_combatmg"] = 0.15,
    ["weapon_combatmg_mk2"] = 0.15,
    ["weapon_gusenberg"] = 0.15,

-- Sniper Rifles
    ["weapon_sniperrifle"] = 0.15,
    ["weapon_heavysniper"] = 0.15,
    ["weapon_heavysniper_mk2"] = 0.15,
    ["weapon_marksmanrifle"] = 0.15,
    ["weapon_marksmanrifle_mk2"] = 0.15,
    ["weapon_precisionrifle"] = 0.15,

-- Heavy Weapons
    ["weapon_rpg"] = 0.15,
    ["weapon_grenadelauncher"] = 0.15,
    ["weapon_grenadelauncher_smoke"] = 0.15,
    ["weapon_minigun"] = 0.15,
    ["weapon_firework"] = 0.15,
    ["weapon_railgun"] = 0.15,
    ["weapon_hominglauncher"] = 0.15,
    ["weapon_compactlauncher"] = 0.15,
    ["weapon_rayminigun"] = 0.15,
    ["weapon_emplauncher"] = 0.15,

-- Throwables    
    ["weapon_grenade"] = 0.15,
    ["weapon_bzgas"] = 0.15,
    ["weapon_molotov"] = 0.15,
    ["weapon_stickybomb"] = 0.15,
    ["weapon_proxmine"] = 0.15,
    ["weapon_snowball"] = 0.15,
    ["weapon_pipebomb"] = 0.15,
    ["weapon_ball"] = 0.15,
    ["weapon_smokegrenade"] = 0.15,
    ["weapon_flare"] = 0.15,

-- Miscellaneous
    ["weapon_petrolcan"] = 0.15,
    ["gadget_parachute"] = 0.15,
    ["weapon_fireextinguisher"] = 0.15,
    ["weapon_hazardcan"] = 0.15,
    ["weapon_fertilizercan"] = 0.15,

}


--██████╗░███████╗██████╗░░█████╗░██╗██████╗░  ░██╗░░░░░░░██╗███████╗░█████╗░██████╗░░█████╗░███╗░░██╗
--██╔══██╗██╔════╝██╔══██╗██╔══██╗██║██╔══██╗  ░██║░░██╗░░██║██╔════╝██╔══██╗██╔══██╗██╔══██╗████╗░██║
--██████╔╝█████╗░░██████╔╝███████║██║██████╔╝  ░╚██╗████╗██╔╝█████╗░░███████║██████╔╝██║░░██║██╔██╗██║
--██╔══██╗██╔══╝░░██╔═══╝░██╔══██║██║██╔══██╗  ░░████╔═████║░██╔══╝░░██╔══██║██╔═══╝░██║░░██║██║╚████║
--██║░░██║███████╗██║░░░░░██║░░██║██║██║░░██║  ░░╚██╔╝░╚██╔╝░███████╗██║░░██║██║░░░░░╚█████╔╝██║░╚███║
--╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝░░╚═╝╚═╝╚═╝░░╚═╝  ░░░╚═╝░░░╚═╝░░╚══════╝╚═╝░░╚═╝╚═╝░░░░░░╚════╝░╚═╝░░╚══╝

Config.RepairAccount = 'bank' 
-- Change between money or bank or black_money if you are using ESX.
-- If you are using QBCore you can use your custom accounts cash, bank, etc.

Config.WeaponRepairPoints = { --Location of the weapons repairman.
    [1] = {
        coords = {x = 964.02, y = -1267.41, z = 34.97, h = 35.5, r = 1.0},
        IsRepairing = false,
        RepairingData = {},
        blip = {id = 110, scale = 0.7, color = 21, title = 'Repair Weapons Store #1'}, --or false,
    },
    --[2] = {
    --    coords = {x = 964.02, y = -1267.41, z = 34.97, h = 35.5, r = 1.0},
    --    IsRepairing = false,
    --    RepairingData = {},
    --    blip = {id = 110, scale = 0.7, color = 21, title = 'Repair Weapons Store #2'}, --or false,
    --},
}

Config.WeaponRepairCotsts = { --Prices to repair weapons.
    ["pistol"] = 1000,
    ["smg"] = 3000,
    ["shotgun"] = 4000,
    ["rifle"] = 5000,
    ["sniper"] = 6000,
    ["mg"] = 8000,
    ["grenadelauncher"] = 10000,
}


--░█████╗░████████╗████████╗░█████╗░░█████╗░██╗░░██╗███╗░░░███╗███████╗███╗░░██╗████████╗░██████╗
--██╔══██╗╚══██╔══╝╚══██╔══╝██╔══██╗██╔══██╗██║░░██║████╗░████║██╔════╝████╗░██║╚══██╔══╝██╔════╝
--███████║░░░██║░░░░░░██║░░░███████║██║░░╚═╝███████║██╔████╔██║█████╗░░██╔██╗██║░░░██║░░░╚█████╗░
--██╔══██║░░░██║░░░░░░██║░░░██╔══██║██║░░██╗██╔══██║██║╚██╔╝██║██╔══╝░░██║╚████║░░░██║░░░░╚═══██╗
--██║░░██║░░░██║░░░░░░██║░░░██║░░██║╚█████╔╝██║░░██║██║░╚═╝░██║███████╗██║░╚███║░░░██║░░░██████╔╝
--╚═╝░░╚═╝░░░╚═╝░░░░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═════╝░

Config.WeaponAttachments = {

    ["WEAPON_MK18"] = {     							
        ["scope"] = {
            component = "COMPONENT_MK18_SCOPE_01",
            label = "Scope 1",
            item = "mk18_scope1",
        },  
        ["scope2"] = {
            component = "COMPONENT_MK18_SCOPE_02",
            label = "Scope 2",
            item = "mk18_scope2",
        }, 
        ["scope3"] = {
            component = "COMPONENT_MK18_SCOPE_03",
            label = "Scope 3",
            item = "mk18_scope3",
        },  
        ["scope4"] = {
            component = "COMPONENT_MK18_SCOPE_04",
            label = "Scope 4",
            item = "mk18_scope4",
        },  
        ["scope5"] = {
            component = "COMPONENT_MK18_SCOPE_05",
            label = "Scope 5",
            item = "mk18_scope5",
        },  
        ["scope6"] = {
            component = "COMPONENT_MK18_SCOPE_06",
            label = "Scope 6",
            item = "mk18_scope6",
        },  
        ["scope7"] = {
            component = "COMPONENT_MK18_SCOPE_07",
            label = "Scope 7",
            item = "mk18_scope7",
        },  
        ["scope8"] = {
            component = "COMPONENT_MK18_SCOPE_08",
            label = "Scope 8",
            item = "mk18_scope8",
        },  
        ["scope9"] = {
            component = "COMPONENT_MK18_SCOPE_09",
            label = "Scope 9",
            item = "mk18_scope9",
        },  

        -- Suppresoors
        ["suppressor"] = {
            component = "COMPONENT_MK18_SUPPRESSOR_01",
            label = "Suppressor 1",
            item = "mk18_supp1",
        }, 
        ["suppressor2"] = {
            component = "COMPONENT_MK18_SUPPRESSOR_02",
            label = "Suppressor 2",
            item = "mk18_supp2",
        },
        ["suppressor3"] = {
            component = "COMPONENT_MK18_SUPPRESSOR_03",
            label = "Suppressor 3",
            item = "mk18_supp3",
        },
        ["suppressor4"] = {
            component = "COMPONENT_MK18_SUPPRESSOR_04",
            label = "Suppressor 4",
            item = "mk18_supp4",
        },
        ["suppressor5"] = {
            component = "COMPONENT_MK18_SUPPRESSOR_05",
            label = "Suppressor 5",
            item = "mk18_supp5",
        },
        ["suppressor6"] = {
            component = "COMPONENT_MK18_SUPPRESSOR_06",
            label = "Suppressor 6",
            item = "mk18_supp6",
        },

        ["suppressor7"] = {
            component = "COMPONENT_MK18_GRIP_01",
            label = "Grip 1",
            item = "mk18_grip1",
        }, 

        ["suppressor8"] = {
            component = "COMPONENT_MK18_STOCK_01",
            label = "Stock 1",
            item = "mk18_stock1",
        }, 

        ["tint"] = {
            component = "COMPONENT_MK18_FRAME_01",
            label = "Frame 1",
            item = "mk18_frame1",
        }, 
        ["tint2"] = {
            component = "COMPONENT_MK18_FRAME_02",
            label = "Frame 2",
            item = "mk18_frame2",
        }, 
        ["tint3"] = {
            component = "COMPONENT_MK18_FRAME_03",
            label = "Frame 3",
            item = "mk18_frame3",
        }, 
        --- Flashlight

        ["flashlight"] = {
            component = "COMPONENT_MK18_FLASH_01",
            label = "Flash 1",
            item = "mk18_flash1",
        }, 
        ["flashlight2"] = {
            component = "COMPONENT_MK18_FLASH_02",
            label = "Flash 2",
            item = "mk18_flash2",
        }, 
        ["flashlight3"] = {
            component = "COMPONENT_MK18_FLASH_03",
            label = "Flash 3",
            item = "mk18_flash3",
        }, 
        ["flashlight4"] = {
            component = "COMPONENT_MK18_FLASH_04",
            label = "Flash 4",
            item = "mk18_flash4",
        }, 
        ["flashlight5"] = {
            component = "COMPONENT_MK18_FLASH_05",
            label = "Flash 5",
            item = "mk18_flash5",
        },  
        ["flashlight6"] = {
            component = "COMPONENT_MK18_FLASH_06",
            label = "Flash 6",
            item = "mk18_flash6",
        },  
        ["flashlight7"] = {
            component = "COMPONENT_MK18_FLASH_07",
            label = "Flash 7",
            item = "mk18_flash7",
        }, 

        ["clip1"] = {
            component = "COMPONENT_MK18_CLIP_01",
            label = "Clip 1",
            item = "mk18_clip1",
        }, 
        ["clip2"] = {
            component = "COMPONENT_MK18_CLIP_02",
            label = "Clip 2",
            item = "mk18_clip2",
        }, 
        ["clip3"] = {
            component = "COMPONENT_MK18_CLIP_03",
            label = "Clip 3",
            item = "mk18_clip3",
        },
        ["clip4"] = {
            component = "COMPONENT_MK18_CLIP_04",
            label = "Clip 4",
            item = "mk18_clip4",
        }, 
        ["clip5"] = {
            component = "COMPONENT_MK18_CLIP_05",
            label = "Clip 5",
            item = "mk18_clip5",
        }, 
        ["clip6"] = {
            component = "COMPONENT_MK18_CLIP_06",
            label = "Clip 6",
            item = "mk18_clip6",
        },
        ["clip7"] = {
            component = "COMPONENT_MK18_CLIP_07",
            label = "Clip 7",
            item = "mk18_clip7",
        },
    },



    ["WEAPON_KNUCKLE"] = {
        ["knucklestyle1"] = {
            component = "COMPONENT_KNUCKLE_VARMOD_PIMP",
            label = "The Pimp",
            item = "knuckle_style_1",
        },
        ["knucklestyle2"] = {
            component = "COMPONENT_KNUCKLE_VARMOD_BALLAS",
            label = "The Ballas",
            item = "knuckle_style_2",
        },	
        ["knucklestyle3"] = {
            component = "COMPONENT_KNUCKLE_VARMOD_DOLLAR",
            label = "The Hustler",
            item = "knuckle_style_3",
        },	
        ["knucklestyle4"] = {
            component = "COMPONENT_KNUCKLE_VARMOD_DIAMOND",
            label = "The Rock",
            item = "knuckle_style_4",
        },	
        ["knucklestyle5"] = {
            component = "COMPONENT_KNUCKLE_VARMOD_HATE",
            label = "The Hater",
            item = "knuckle_style_5",
        },	
        ["knucklestyle6"] = {
            component = "COMPONENT_KNUCKLE_VARMOD_LOVE",
            label = "The Lover",
            item = "knuckle_style_6",
        },	
        ["knucklestyle7"] = {
            component = "COMPONENT_KNUCKLE_VARMOD_PLAYER",
            label = "The Player",
            item = "knuckle_style_7",
        },	
        ["knucklestyle8"] = {
            component = "COMPONENT_KNUCKLE_VARMOD_KING",
            label = "The King",
            item = "knuckle_style_8",
        },	
        ["knucklestyle9"] = {
            component = "COMPONENT_KNUCKLE_VARMOD_VAGOS",
            label = "The Vagos",
            item = "knuckle_style_9",
        },	
    },
    ["WEAPON_SWITCHBLADE"] = {
        ["switchbladestyle1"] = {
            component = "COMPONENT_SWITCHBLADE_VARMOD_VAR1",
            label = "Luxury",
            item = "blade_style_1",
        },
        ["switchbladestyle2"] = {
            component = "COMPONENT_SWITCHBLADE_VARMOD_VAR2",
            label = "Bodyguard",
            item = "blade_style_2",
        },
    },
    ["WEAPON_SNSPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_SNSPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_SNSPISTOL_VARMOD_LOWRIDER",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        }, 
    },
    ["WEAPON_COMBATPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_COMBATPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_PISTOL_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        }, 
    },
    ["WEAPON_APPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_APPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_APPISTOL_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },
    },
    ["WEAPON_PISTOL50"] = {
        ["extendedclip"] = {
            component = "COMPONENT_PISTOL50_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_PISTOL50_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },	
    },
    ["WEAPON_REVOLVER"] = {
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_REVOLVER_VARMOD_BOSS",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },
    },
    ["WEAPON_HEAVYPISTOL"] = {
        ["extendedclip"] = {
            component = "COMPONENT_HEAVYPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_HEAVYPISTOL_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },
    },
    ["WEAPON_RAYPISTOL"] = {
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_RAYPISTOL_VARMOD_XMAS18",
            label = "Luxury Tint",
            item = "luxury",
        },
    },
    ["WEAPON_VINTAGEPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_VINTAGEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
    },
    ["WEAPON_PISTOL"] = {
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight",
        },   
        ["extendedclip"] = {
            component = "COMPONENT_PISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP_02",
            label = "Suppressor",
            item = "pistol_suppressor",
        }, 
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_PISTOL_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },            
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },	                                   
    },
    ["WEAPON_ASSAULTRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_ASSAULTRIFLE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },    
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },  
        ["drummag"] = {
            component = "COMPONENT_ASSAULTRIFLE_CLIP_03",
            label = "Drum Magazine",
            item = "rifle_drummag",
        },                                                   
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "rifle_flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "rifle_grip",
        },  
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_ASSAULTRIFLE_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },                      
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },                         
    },
    ["WEAPON_CARBINERIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_CARBINERIFLE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },    
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "rifle_suppressor",
        },  
        ["drummag"] = {
            component = "COMPONENT_CARBINERIFLE_CLIP_03",
            label = "Drum Magazine",
            item = "rifle_drummag",
        },                                                   
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "rifle_flashlight",
        },  
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MEDIUM",
            label = "Scope",
            item = "rifle_scope",
        },  
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "rifle_grip",
        },  
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_CARBINERIFLE_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },      
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },                                        
    },                                             
    ["WEAPON_MICROSMG"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_MICROSMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Lantern",
            item = "smg_flashlight",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Binoculars",
            item = "smg_scope",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_MICROSMG_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },
    },
    ["WEAPON_SMG"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_SMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_SMG_CLIP_03",
            label = "Drum Magazine",
            item = "smg_drummag",
        }, 
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "smg_flashlight",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO_02",
            label = "Binoculars",
            item = "smg_scope",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_SMG_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },
    },
    ["WEAPON_ASSAULTSMG"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_ASSAULTSMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "smg_flashlight",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO",
            label = "Binoculars",
            item = "smg_scope",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },
    },
    ["WEAPON_MACHINEPISTOL"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_MACHINEPISTOL_CLIP_02",
            label = "Extended Clip",
            item = "pistol_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_MACHINEPISTOL_CLIP_03",
            label = "Drum Magazine",
            item = "pistol_drummag",
        }, 
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
    },
    ["WEAPON_COMBATPDW"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_COMBATPDW_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_COMBATPDW_CLIP_03",
            label = "Drum Magazine",
            item = "smg_drummag",
        }, 
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "smg_flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "smg_grip",
        },
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_SMALL",
            label = "Binoculars",
            item = "smg_scope",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
    },
    ["WEAPON_PUMPSHOTGUN"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_SR_SUPP",
            label = "Suppressor",
            item = "shotgun_suppressor",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "shotgun_flashlight",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER",
            label = "Luxury Tint",
            item = "luxury",
        },
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },
    },
    ["WEAPON_SAWNOFFSHOTGUN"] = {
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },
    },
    ["WEAPON_ASSAULTSHOTGUN"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "shotgun_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_ASSAULTSHOTGUN_CLIP_02",
            label = "Extended Clip",
            item = "shotgun_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "shotgun_flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "shotgun_grip",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
    },
    ["WEAPON_BULLPUPSHOTGUN"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "shotgun_suppressor",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "shotgun_flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "shotgun_grip",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
    },
    ["WEAPON_HEAVYSHOTGUN"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "shotgun_suppressor",
        },
        ["extendedclip"] = {
            component = "COMPONENT_HEAVYSHOTGUN_CLIP_02",
            label = "Extended Clip",
            item = "shotgun_extendedclip",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "shotgun_flashlight",
        },
        ["drummag"] = {
            component = "COMPONENT_HEAVYSHOTGUN_CLIP_03",
            label = "Drum Magazine",
            item = "shotgun_drummag",
        }, 
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "shotgun_grip",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
    },
    ["WEAPON_MINISMG"] = {
        ["extendedclip"] = {
            component = "COMPONENT_MINISMG_CLIP_02",
            label = "Extended Clip",
            item = "smg_extendedclip",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
    },
    ["WEAPON_COMPACTRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },
        ["drummag"] = {
            component = "COMPONENT_COMPACTRIFLE_CLIP_03",
            label = "Extended Clip",
            item = "rifle_drummag",
        },
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
    },
    ["WEAPON_ADVANCEDRIFLE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_ADVANCEDRIFLE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },    
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "rifle_suppressor",
        },                                                     
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "rifle_flashlight",
        },  
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_SMALL",
            label = "Scope",
            item = "rifle_scope",
        },   
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },    
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },                                           
    },
    ["WEAPON_SPECIALCARBINE"] = {
        ["extendedclip"] = {
            component = "COMPONENT_SPECIALCARBINE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },    
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },  
        ["drummag"] = {
            component = "COMPONENT_SPECIALCARBINE_CLIP_03",
            label = "Drum Magazine",
            item = "rifle_drummag",
        },                                                   
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Lantern",
            item = "rifle_flashlight",
        },  
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MEDIUM",
            label = "Scope",
            item = "rifle_scope",
        },  
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "rifle_grip",
        },  
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER",
            label = "Luxury Tint",
            item = "luxury",
        },    
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },                                           
    },
    ["WEAPON_MG"] = {
        ["extendedclip"] = {
            component = "COMPONENT_MG_CLIP_02",
            label = "Extended Clip",
            item = "mg_extendedclip",
        },                                                       
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_SMALL_02",
            label = "Scope",
            item = "mg_scope",
        },   
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_MG_VARMOD_LOWRIDER",
            label = "Luxury Tint",
            item = "luxury",
        },  
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },                                             
    },
    ["WEAPON_COMBATMG"] = {
        ["extendedclip"] = {
            component = "COMPONENT_COMBATMG_CLIP_02",
            label = "Extended Clip",
            item = "mg_extendedclip",
        },                                                       
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MEDIUM",
            label = "Scope",
            item = "mg_scope",
        },  
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "mg_grip",
        },  
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_COMBATMG_VARMOD_LOWRIDER",
            label = "Luxury Tint",
            item = "luxury",
        },             
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },                                  
    },
    ["WEAPON_GUSENBERG"] = {
        ["extendedclip"] = {
            component = "COMPONENT_GUSENBERG_CLIP_02",
            label = "Extended Clip",
            item = "mg_extendedclip",
        },                                                        
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },                                          
    },
    ["WEAPON_SNIPERRIFLE"] = { 
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "sniper_suppressor",
        },  
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_LARGE",
            label = "Scope",
            item = "sniper_scope",
        },  
        ["advancedscope"] = {
            component = "COMPONENT_AT_SCOPE_MAX",
            label = "Advanced Scope",
            item = "snipere_advancedscope",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "sniper_grip",
        },  
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },
        ["luxury"] = {
            component = "COMPONENT_SNIPERRIFLE_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },                            
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },                   
    },
    ["WEAPON_HEAVYSNIPER"] = {  
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_LARGE",
            label = "Scope",
            item = "sniper_scope",
        },  
        ["advancedscope"] = {
            component = "COMPONENT_AT_SCOPE_MAX",
            label = "Advanced Scope",
            item = "sniper_advancedscope",
        }, 
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },                                          
    },
    ["WEAPON_MARKSMANRIFLE"] = {  
        ["extendedclip"] = {
            component = "COMPONENT_MARKSMANRIFLE_CLIP_02",
            label = "Extended Clip",
            item = "sniper_extendedclip",
        }, 
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "sniper_suppressor",
        },  
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM",
            label = "Scope",
            item = "sniper_scope",
        },  
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Flashlight",
            item = "sniper_flashlight",
        }, 
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "sniper_grip",
        }, 
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },   
        ["luxury"] = {
            component = "COMPONENT_MARKSMANRIFLE_VARMOD_LUXE",
            label = "Luxury Tint",
            item = "luxury",
        },       
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },                                    
    },
    ["WEAPON_GRENADELAUNCHER"] = {   
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_SMALL",
            label = "Scope",
            item = "grenadelauncher_scope",
        },  
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Flashlight",
            item = "grenadelauncher_flashlight",
        }, 
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "grenadelauncher_grip",
        }, 
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },                                            
    },

    -- MK2

    ["WEAPON_REVOLVER_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MACRO_MK2",
            label = "Small Scope",
            item = "pistol_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH",
            label = "Flashlight",
            item = "pistol_flashlight",
        },	
        ["compensator"] = {
            component = "COMPONENT_AT_PI_COMP_03",
            label = "Compensator",
            item = "pistol_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_SNSPISTOL_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_PI_RAIL_02",
            label = "Mounted Scope",
            item = "pistol_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH_03",
            label = "Flashlight",
            item = "pistol_flashlight",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP_02",
            label = "Suppressor",
            item = "pistol_suppressor",
        },
        ["compensator"] = {
            component = "COMPONENT_AT_PI_COMP_02",
            label = "Compensator",
            item = "pistol_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_SMG_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_SMALL_SMG_MK2",
            label = "Large Scope",
            item = "smg_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_PI_FLSH_03",
            label = "Flashlight",
            item = "smg_flashlight",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP",
            label = "Suppressor",
            item = "smg_suppressor",
        },
        ["compensator"] = {
            component = "COMPONENT_AT_MUZZLE_02",
            label = "Compensator",
            item = "smg_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_PUMPSHOTGUN_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_SMALL_MK2",
            label = "Medium Scope",
            item = "shotgun_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Flashlight",
            item = "shotgun_flashlight",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_SR_SUPP_03",
            label = "Suppressor",
            item = "shotgun_suppressor",
        },
        ["compensator"] = {
            component = "COMPONENT_AT_MUZZLE_08",
            label = "Compensator",
            item = "shotgun_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_BULLPUPRIFLE_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SIGHTS",
            label = "Holographic Scope",
            item = "shotgun_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH_REH",
            label = "Flashlight",
            item = "shotgun_flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP_02",
            label = "Grip",
            item = "shotgun_grip",
        },
        ["extendedclip"] = {
            component = "COMPONENT_BULLPUPRIFLE_MK2_CLIP_02",
            label = "Extended Clip",
            item = "shotgun_extendedclip",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "shotgun_suppressor",
        },
        ["compensator"] = {
            component = "COMPONENT_AT_MUZZLE_02",
            label = "Compensator",
            item = "shotgun_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_SPECIALCARBINE_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
            label = "Large Scope",
            item = "rifle_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Flashlight",
            item = "rifle_flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_SC_BARREL_02",
            label = "Grip",
            item = "rifle_grip",
        },
        ["extendedclip"] = {
            component = "COMPONENT_SPECIALCARBINE_MK2_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
        ["compensator"] = {
            component = "COMPONENT_AT_MUZZLE_05",
            label = "Compensator",
            item = "rifle_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_ASSAULTRIFLE_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SIGHTS",
            label = "Holographic Scope",
            item = "rifle_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Flashlight",
            item = "rifle_flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP_02",
            label = "Grip",
            item = "rifle_grip",
        },
        ["extendedclip"] = {
            component = "COMPONENT_ASSAULTRIFLE_MK2_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
        ["compensator"] = {
            component = "COMPONENT_AT_MUZZLE_03",
            label = "Compensator",
            item = "rifle_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_CARBINERIFLE_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
            label = "Large Scope",
            item = "rifle_scope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Flashlight",
            item = "rifle_flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP_02",
            label = "Grip",
            item = "rifle_grip",
        },
        ["extendedclip"] = {
            component = "COMPONENT_CARBINERIFLE_MK2_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
        ["compensator"] = {
            component = "COMPONENT_AT_MUZZLE_02",
            label = "Compensator",
            item = "rifle_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_COMBATMG_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
            label = "Large Scope",
            item = "mg_scope",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP_02",
            label = "Grip",
            item = "mg_grip",
        },
        ["extendedclip"] = {
            component = "COMPONENT_COMBATMG_MK2_CLIP_02",
            label = "Extended Clip",
            item = "mg_extendedclip",
        },	
        ["compensator"] = {
            component = "COMPONENT_AT_MUZZLE_05",
            label = "Compensator",
            item = "mg_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_MARKSMANRIFLE_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_MEDIUM_MK2",
            label = "Large Scope",
            item = "sniper_scope",
        },
        ["advancedscope"] = {
            component = "COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2",
            label = "Zoom Scope",
            item = "sniper_advancedscope",
        },
        ["flashlight"] = {
            component = "COMPONENT_AT_AR_FLSH",
            label = "Flashlight",
            item = "sniper_flashlight",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP_02",
            label = "Grip",
            item = "sniper_grip",
        },
        ["extendedclip"] = {
            component = "COMPONENT_MARKSMANRIFLE_MK2_CLIP_02",
            label = "Extended Clip",
            item = "sniper_extendedclip",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP",
            label = "Suppressor",
            item = "sniper_suppressor",
        },
        ["compensator"] = {
            component = "COMPONENT_AT_MUZZLE_05",
            label = "Compensator",
            item = "sniper_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_HEAVYSNIPER_MK2"] = {
        ["scope"] = {
            component = "COMPONENT_AT_SCOPE_LARGE_MK2",
            label = "Zoom Scope",
            item = "sniper_scope",
        },
        ["advancedscope"] = {
            component = "COMPONENT_AT_SCOPE_MAX",
            label = "Advanced Scope",
            item = "sniper_advancedscope",
        },
        ["nightvision"] = {
            component = "COMPONENT_AT_SCOPE_NV",
            label = "Night Vision Scope",
            item = "sniper_nightvision",
        },
        ["extendedclip"] = {
            component = "COMPONENT_HEAVYSNIPER_MK2_CLIP_02",
            label = "Extended Clip",
            item = "sniper_extendedclip",
        },	
        ["suppressor"] = {
            component = "COMPONENT_AT_SR_SUPP_03",
            label = "Suppressor",
            item = "sniper_suppressor",
        },
        ["compensator"] = {
            component = "COMPONENT_AT_MUZZLE_08",
            label = "Compensator",
            item = "sniper_compensator",
        },	
        ["weaponcolormk2_1"] = {
            component = "weaponcolor1",
            label = "Gray Tint",
            item = "weapontintmk2_1",
        },	
        ["weaponcolormk2_2"] = {
            component = "weaponcolor2",
            label = "Two-Tone Tint",
            item = "weapontintmk2_2",
        },
        ["weaponcolormk2_3"] = {
            component = "weaponcolor3",
            label = "White Tint",
            item = "weapontintmk2_3",
        },
        ["weaponcolormk2_4"] = {
            component = "weaponcolor4",
            label = "Beige Tint",
            item = "weapontintmk2_4",
        },
        ["weaponcolormk2_5"] = {
            component = "weaponcolor5",
            label = "Green Tint",
            item = "weapontintmk2_5",
        },
        ["weaponcolormk2_6"] = {
            component = "weaponcolor6",
            label = "Blue Tint",
            item = "weapontintmk2_6",
        }, 
        ["weaponcolormk2_7"] = {
            component = "weaponcolor7",
            label = "Earth Tint",
            item = "weapontintmk2_7",
        },	
        ["weaponcolormk2_8"] = {
            component = "weaponcolor8",
            label = "Brown & Black Tint",
            item = "weapontintmk2_8",
        },
        ["weaponcolormk2_9"] = {
            component = "weaponcolor9",
            label = "Red Contrast Tint",
            item = "weapontintmk2_9",
        },
        ["weaponcolormk2_10"] = {
            component = "weaponcolor10",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_10",
        },
        ["weaponcolormk2_11"] = {
            component = "weaponcolor11",
            label = "Blue Contrast Tint",
            item = "weapontintmk2_11",
        },
        ["weaponcolormk2_12"] = {
            component = "weaponcolor12",
            label = "Orange Contrast Tint",
            item = "weapontintmk2_12",
        }, 
        ["weaponcolormk2_13"] = {
            component = "weaponcolor13",
            label = "Pink Tint",
            item = "weapontintmk2_13",
        },	
        ["weaponcolormk2_14"] = {
            component = "weaponcolor14",
            label = "Purple & Yellow Tint",
            item = "weapontintmk2_14",
        },
        ["weaponcolormk2_15"] = {
            component = "weaponcolor15",
            label = "Orange Tint",
            item = "weapontintmk2_15",
        },
        ["weaponcolormk2_16"] = {
            component = "weaponcolor16",
            label = "Green & Purple Tint",
            item = "weapontintmk2_16",
        },
        ["weaponcolormk2_17"] = {
            component = "weaponcolor17",
            label = "Red Features Tint",
            item = "weapontintmk2_17",
        },
        ["weaponcolormk2_18"] = {
            component = "weaponcolor18",
            label = "Green Features Tint",
            item = "weapontintmk2_18",
        }, 
        ["weaponcolormk2_19"] = {
            component = "weaponcolor19",
            label = "Cyan Features Tint",
            item = "weapontintmk2_19",
        },	
        ["weaponcolormk2_20"] = {
            component = "weaponcolor20",
            label = "Yellow Features Tint",
            item = "weapontintmk2_20",
        },
        ["weaponcolormk2_21"] = {
            component = "weaponcolor21",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_21",
        },
        ["weaponcolormk2_22"] = {
            component = "weaponcolor22",
            label = "Blue & White Tint",
            item = "weapontintmk2_22",
        },
        ["weaponcolormk2_23"] = {
            component = "weaponcolor23",
            label = "Metallic Gold Tint",
            item = "weapontintmk2_23",
        },
        ["weaponcolormk2_24"] = {
            component = "weaponcolor24",
            label = "Metallic Platinum Tint",
            item = "weapontintmk2_24",
        }, 
        ["weaponcolormk2_25"] = {
            component = "weaponcolor25",
            label = "Gray & Lilac Tint",
            item = "weapontintmk2_25",
        },
        ["weaponcolormk2_26"] = {
            component = "weaponcolor26",
            label = "Purple & Lime Tint",
            item = "weapontintmk2_26",
        },
        ["weaponcolormk2_27"] = {
            component = "weaponcolor27",
            label = "Metallic Red Tint",
            item = "weapontintmk2_27",
        },
        ["weaponcolormk2_28"] = {
            component = "weaponcolor28",
            label = "Metallic Green Tint",
            item = "weapontintmk2_28",
        },
        ["weaponcolormk2_29"] = {
            component = "weaponcolor29",
            label = "Metallic Blue Tint",
            item = "weapontintmk2_29",
        }, 
        ["weaponcolormk2_30"] = {
            component = "weaponcolor30",
            label = "White & Aqua Tint",
            item = "weapontintmk2_30",
        },	
        ["weaponcolormk2_31"] = {
            component = "weaponcolor31",
            label = "Red & Yellow Tint",
            item = "weapontintmk2_31",
        },
    },
    ["WEAPON_TACTICALRIFLE"] = {
        ["suppressor"] = {
            component = "COMPONENT_AT_AR_SUPP_02",
            label = "Suppressor",
            item = "rifle_suppressor",
        },
        ["grip"] = {
            component = "COMPONENT_AT_AR_AFGRIP",
            label = "Grip",
            item = "rifle_grip",
        },
        ["extendedclip"] = {
            component = "COMPONENT_TACTICALRIFLE_CLIP_02",
            label = "Extended Clip",
            item = "rifle_extendedclip",
        },
    },
    ["WEAPON_PISTOL_MK2"] = {
        ['defaultclip'] = {
            component = 'COMPONENT_PISTOL_MK2_CLIP_01',
            item = 'pistol_mk2_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL_MK2_CLIP_02',
            item = 'pistol_mk2_extended_clip',
            type = 'clip',
        },
        ['tracerclip'] = {
            component = 'COMPONENT_PISTOL_MK2_CLIP_TRACER',
            item = 'pistol_mk2_tracer_clip',
            type = 'clip',
        },
        ['incendiaryclip'] = {
            component = 'COMPONENT_PISTOL_MK2_CLIP_INCENDIARY',
            item = 'pistol_mk2_incendiary_clip',
            type = 'clip',
        },
        ['hollowpointclip'] = {
            component = 'COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT',
            item = 'pistol_mk2_hollowpoint_clip',
            type = 'clip',
        },
        ['fmjclip'] = {
            component = 'COMPONENT_PISTOL_MK2_CLIP_FMJ',
            item = 'pistol_extended_clip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH_02',
            item = 'pistol_flashlight',
        },
        ["suppressor"] = {
            component = "COMPONENT_AT_PI_SUPP_02",
            label = "Suppressor",
            item = "pistol_mk2_suppressor",
        }, 
        ["compensator"] = {
            component = "COMPONENT_AT_PI_COMP",
            label = "Compensator",
            item = "pistol_mk2_compensator",
        }, 
        ["weaponcolor1"] = {
            component = "weaponcolor1",
            label = "Green Tint",
            item = "weapontint_1",
        },	
        ["weaponcolor2"] = {
            component = "weaponcolor2",
            label = "Gold Tint",
            item = "weapontint_2",
        },
        ["weaponcolor3"] = {
            component = "weaponcolor3",
            label = "Pink Tint",
            item = "weapontint_3",
        },
        ["weaponcolor4"] = {
            component = "weaponcolor4",
            label = "Army Tint",
            item = "weapontint_4",
        },
        ["weaponcolor5"] = {
            component = "weaponcolor5",
            label = "LSPD Tint",
            item = "weapontint_5",
        },
        ["weaponcolor6"] = {
            component = "weaponcolor6",
            label = "Orange Tint",
            item = "weapontint_6",
        },
        ["weaponcolor7"] = {
            component = "weaponcolor7",
            label = "Platinum Tint",
            item = "weapontint_7",
        },                   
        ["weapontinturl"] = {
            component = "weapontinturlattach",
            label = "Weapon Tint Custom",
            item = "weapontinturl",
        },
    },
}

Config.WeaponTints = {
	[1] = {name = 'Pistol', hash = '453432689', ytd = 'w_pi_pistol', texture = 'w_pi_pistol'},
	[2] = {name = 'PistolMK2', hash = '3219281620', ytd = 'w_pi_pistolmk2', texture = 'w_pi_pistolmk2'},
	[3] = {name = 'Combat Pistol', hash = '1593441988', ytd = 'w_pi_combatpistol', texture = 'w_pi_combatpistol'},
	[4] = {name = 'Pistol50', hash = '-1716589765', ytd = 'w_pi_pistol50', texture = 'w_pl_pistol50'},
	[5] = {name = 'SNSPistol', hash = '-1076751822', ytd = 'w_pi_sns_pistol', texture = 'w_pi_sns_pistol'},
	[6] = {name = 'HeavyPistol', hash = '-771403250', ytd = 'w_pi_heavypistol', texture = 'w_pi_heavypistol'},
	[7] = {name = 'VintagePistol', hash = '137902532', ytd = 'w_pi_vintage_pistol', texture = 'w_pi_vintage_pistol'},
	[8] = {name = 'MarksmanPistol', hash = '-598887786', ytd = 'w_pi_singleshot', texture = 'w_pi_singleshot_dm'},
	[9] = {name = 'Revolver', hash = '-1045183535', ytd = 'w_pi_revolver', texture = 'w_pi_revolver'},
	[10] = {name = 'StunGun', hash = '911657153', ytd = 'w_pi_stungun', texture = 'w_pi_stungun'},
	[11] = {name = 'MicroSMG', hash = '324215364', ytd = 'w_sb_microsmg', texture = 'w_sb_microsmg'},
	[12] = {name = 'MachinePistol', hash = '-619010992', ytd = 'w_sb_compactsmg', texture = 'w_sb_compactsmg'},
	[13] = {name = 'SMG', hash = '736523883', ytd = 'w_sb_smg', texture = 'w_sb_smg'},
	[14] = {name = 'SMGMk2', hash = '2024373456', ytd = 'w_sb_smgmk2', texture = 'w_sb_smgmk2'},
	[15] = {name = 'AssaultSMG', hash = '-270015777', ytd = 'w_sb_assaultsmg', texture = 'w_sb_assaultsmg'},
	[16] = {name = 'CombatPDW', hash = '171789620', ytd = 'w_sb_pdw', texture = 'w_sb_pdw'},
	[17] = {name = 'MG', hash = '-1660422300', ytd = 'w_mg_mg', texture = 'w_mg_mg'},
	[18] = {name = 'CombatMG', hash = '2144741730', ytd = 'w_mg_combatmg', texture = 'w_mg_combatmg_tint'},
	[19] = {name = 'CombatMGMk2', hash = '3686625920', ytd = 'w_mg_combatmgmk2', texture = 'w_mg_combatmgmk2_l1'},
	[20] = {name = 'Gusenberg', hash = '1627465347', ytd = 'w_sb_gusenberg', texture = 'w_sb_gusenberg'},
	[21] = {name = 'MiniSMG', hash = '-1121678507', ytd = 'w_sb_minismg', texture = 'w_sb_minismg_dm'},
	[22] = {name = 'AssaultRifle', hash = '-1074790547', ytd = 'w_ar_assaultrifle', texture = 'w_ar_assaultrifle'},
	[23] = {name = 'AssaultRifleMk2', hash = '961495388', ytd = 'w_ar_assaultriflemk2', texture = 'w_ar_assaultriflemk2'},
	[24] = {name = 'CarbineRifle', hash = '-2084633992', ytd = 'w_ar_carbinerifle', texture = 'w_ar_carbinerifle'},
	[25] = {name = 'CarbineRifleMk2', hash = '4208062921', ytd = 'w_ar_carbineriflemk2', texture = 'w_ar_carbineriflemk2'},
	[26] = {name = 'SpecialCarbine', hash = '-1063057011', ytd = 'w_ar_specialcarbine', texture = 'w_ar_specialcarbine_tint'},
	[27] = {name = 'BullpupRifle', hash = '2132975508', ytd = 'w_ar_bullpuprifle', texture = 'w_ar_bullpuprifle'},
	[28] = {name = 'CompactRifle', hash = '1649403952', ytd = 'w_ar_assaultrifle_smg', texture = 'w_ar_assaultrifle_smg_d'},
	[29] = {name = 'SniperRifle', hash = '100416529', ytd = 'w_sr_sniperrifle', texture = 'w_sr_sniperrifle'},
	[30] = {name = 'HeavySniper', hash = '205991906', ytd = 'w_sr_heavysniper', texture = 'w_sr_heavysniper'},
	[31] = {name = 'HeavySniperMk2', hash = '177293209', ytd = 'w_sr_heavysnipermk2', texture = 'w_sr_heavysnipermk2'},
	[32] = {name = 'MarksmanRifle', hash = '-952879014', ytd = 'w_sr_marksmanrifle', texture = 'w_sr_marksmanrifle'},
	[33] = {name = 'PumpShotgun', hash = '487013001', ytd = 'w_sg_pumpshotgun', texture = 'w_sg_pumpshotgun'},
	[34] = {name = 'SawnoffShotgun', hash = '2017895192', ytd = 'w_sg_sawnoff', texture = 'w_sg_sawnoff'},
	[35] = {name = 'BullpupShotgun', hash = '-1654528753', ytd = 'w_sg_bullpupshotgun', texture = 'w_sg_bullpupshotgun'},
	[36] = {name = 'AssaultShotgun', hash = '-494615257', ytd = 'w_sg_assaultshotgun', texture = 'w_sg_assaultshotgun'},
	[37] = {name = 'Musket', hash = '-1466123874', ytd = 'w_ar_musket', texture = 'w_ar_musket_d'},
	[38] = {name = 'DoubleBarrelShotgun', hash = '-275439685', ytd = 'w_sg_doublebarrel', texture = 'w_sg_doublebarrel_dm'},
	[39] = {name = 'APPistol', hash = '584646201', ytd = 'w_pi_appistol', texture = 'w_pi_appistol'},
	[40] = {name = 'AdvancedRifle', hash = '-1357824103', ytd = 'w_ar_advancedrifle', texture = 'w_ar_advancedrifle'}
}
--██╗░░░██╗░██████╗░█████╗░██████╗░██╗░░░░░███████╗  ██╗████████╗███████╗███╗░░░███╗░██████╗
--██║░░░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░██╔════╝  ██║╚══██╔══╝██╔════╝████╗░████║██╔════╝
--██║░░░██║╚█████╗░███████║██████╦╝██║░░░░░█████╗░░  ██║░░░██║░░░█████╗░░██╔████╔██║╚█████╗░
--██║░░░██║░╚═══██╗██╔══██║██╔══██╗██║░░░░░██╔══╝░░  ██║░░░██║░░░██╔══╝░░██║╚██╔╝██║░╚═══██╗
--╚██████╔╝██████╔╝██║░░██║██████╦╝███████╗███████╗  ██║░░░██║░░░███████╗██║░╚═╝░██║██████╔╝
--░╚═════╝░╚═════╝░╚═╝░░╚═╝╚═════╝░╚══════╝╚══════╝  ╚═╝░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝╚═════╝░

--- @param Do not add any item that is not an attachment (weapon accessory)

if Config.Framework == 'ESX' then

--[[ 
-- Repair weapon item example

QS.RegisterUsableItem('weapon_carbinerifle_fixer', function(source, item)
    local player = QS.GetPlayerFromId(source)
    fixWeapon(player, 'weapon_carbinerifle')
end) 
]]

QS.RegisterUsableItem('serie_changer', function(source, item)
    local player = QS.GetPlayerFromId(source)
    TriggerClientEvent('weapons:client:SetWeaponSerie', source)
end) 

-- Barrels
QS.RegisterUsableItem("m870_barrel_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)	
	
QS.RegisterUsableItem("m870_barrel_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_2")
end)

QS.RegisterUsableItem("m870_barrel_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_3")
end)

QS.RegisterUsableItem("m870_barrel_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_4")
end)

QS.RegisterUsableItem("m870_barrel_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_5")
end)

QS.RegisterUsableItem("m870_barrel_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_6")
end)

QS.RegisterUsableItem("m870_barrel_7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_7")
end)

-- Handguard
QS.RegisterUsableItem("m870_handguard_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_handguard_1")
end)

QS.RegisterUsableItem("m870_handguard_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_handguard_2")
end)

QS.RegisterUsableItem("m870_handguard_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_handguard_3")
end)

-- Mags
QS.RegisterUsableItem("m870_mag_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_mag_1")
end)

QS.RegisterUsableItem("m870_mag_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_mag_2")
end)

QS.RegisterUsableItem("m870_mag_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_mag_3")
end)	
	
-- Scopes
QS.RegisterUsableItem("m870_scope_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "advancedscope")
end)

QS.RegisterUsableItem("m870_scope_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QS.RegisterUsableItem("m870_scope_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_scope_3")
end)

QS.RegisterUsableItem("m870_scope_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_scope_4")
end)

-- Stocks
QS.RegisterUsableItem("m870_stock_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_1")
end)

QS.RegisterUsableItem("m870_stock_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_2")
end)

QS.RegisterUsableItem("m870_stock_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_3")
end)

QS.RegisterUsableItem("m870_stock_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_4")
end)

QS.RegisterUsableItem("m870_stock_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_5")
end)

QS.RegisterUsableItem("m870_stock_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_6")
end)

-- MK 18 Frame
QS.RegisterUsableItem("mk18_frame1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "tint")
end)

QS.RegisterUsableItem("mk18_frame2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "tint2")
end)

QS.RegisterUsableItem("mk18_frame3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "tint3")
end)

-- MK 18 Mags
QS.RegisterUsableItem("mk18_clip1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip1")
end)

QS.RegisterUsableItem("mk18_clip2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip2")
end)

QS.RegisterUsableItem("mk18_clip3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip3")
end)

QS.RegisterUsableItem("mk18_clip4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip4")
end)

QS.RegisterUsableItem("mk18_clip5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip5")
end)

QS.RegisterUsableItem("mk18_clip6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip6")
end)

QS.RegisterUsableItem("mk18_clip7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip7")
end)

-- MK 18 Flash
QS.RegisterUsableItem("mk18_flash1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QS.RegisterUsableItem("mk18_flash2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight2")
end)

QS.RegisterUsableItem("mk18_flash3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight3")
end)

QS.RegisterUsableItem("mk18_flash4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight4")
end)

QS.RegisterUsableItem("mk18_flash5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight5")
end)

QS.RegisterUsableItem("mk18_flash6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight6")
end)

QS.RegisterUsableItem("mk18_flash7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight7")
end)

-- MK 18 Scope
QS.RegisterUsableItem("mk18_scope1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QS.RegisterUsableItem("mk18_scope2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope2")
end)

QS.RegisterUsableItem("mk18_scope3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope3")
end)

QS.RegisterUsableItem("mk18_scope4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope4")
end)

QS.RegisterUsableItem("mk18_scope5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope5")
end)

QS.RegisterUsableItem("mk18_scope6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope6")
end)

QS.RegisterUsableItem("mk18_scope7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope7")
end)

QS.RegisterUsableItem("mk18_scope8", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope8")
end)

QS.RegisterUsableItem("mk18_scope9", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope9")
end)

-- MK 18 Suppressor
QS.RegisterUsableItem("mk18_supp1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QS.RegisterUsableItem("mk18_supp2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor2")
end)

QS.RegisterUsableItem("mk18_supp3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor3")
end)

QS.RegisterUsableItem("mk18_supp4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor4")
end)

QS.RegisterUsableItem("mk18_supp5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor5")
end)

QS.RegisterUsableItem("mk18_supp6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor6")
end)

-- MK 18 Suppressor
QS.RegisterUsableItem("mk18_grip1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor6")
end)

QS.RegisterUsableItem("mk18_grip2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_grip2")
end)

QS.RegisterUsableItem("mk18_grip3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_grip3")
end)

QS.RegisterUsableItem("mk18_grip4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_grip4")
end)

QS.RegisterUsableItem("mk18_grip5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_grip5")
end)

-- MK 18 Stocks
QS.RegisterUsableItem("mk18_stock1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor8")
end)

QS.RegisterUsableItem("mk18_stock2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock2")
end)

QS.RegisterUsableItem("mk18_stock3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock3")
end)

QS.RegisterUsableItem("mk18_stock4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock4")
end)

QS.RegisterUsableItem("mk18_stock5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock5")
end)

QS.RegisterUsableItem("mk18_stock6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock6")
end)

QS.RegisterUsableItem("mk18_stock7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock7")
end)

-- * Tints
QS.RegisterUsableItem("luxury", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "luxury")
end)

QS.RegisterUsableItem("weapontint_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor1")
end)

QS.RegisterUsableItem("weapontint_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor2")
end)

QS.RegisterUsableItem("weapontint_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor3")
end)

QS.RegisterUsableItem("weapontint_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor4")
end)

QS.RegisterUsableItem("weapontint_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor5")
end)

QS.RegisterUsableItem("weapontint_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor6")
end)

QS.RegisterUsableItem("weapontint_7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor7")
end)

-- MK2
QS.RegisterUsableItem("weapontintmk2_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_1")
end)

QS.RegisterUsableItem("weapontintmk2_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_2")
end)

QS.RegisterUsableItem("weapontintmk2_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_3")
end)

QS.RegisterUsableItem("weapontintmk2_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_4")
end)

QS.RegisterUsableItem("weapontintmk2_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_5")
end)

QS.RegisterUsableItem("weapontintmk2_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_6")
end)

QS.RegisterUsableItem("weapontintmk2_7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_7")
end)

QS.RegisterUsableItem("weapontintmk2_8", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_8")
end)

QS.RegisterUsableItem("weapontintmk2_9", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_9")
end)

QS.RegisterUsableItem("weapontintmk2_10", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_10")
end)

QS.RegisterUsableItem("weapontintmk2_11", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_11")
end)

QS.RegisterUsableItem("weapontintmk2_12", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_12")
end)

QS.RegisterUsableItem("weapontintmk2_13", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_13")
end)

QS.RegisterUsableItem("weapontintmk2_14", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_14")
end)

QS.RegisterUsableItem("weapontintmk2_15", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_15")
end)

QS.RegisterUsableItem("weapontintmk2_16", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_16")
end)

QS.RegisterUsableItem("weapontintmk2_17", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_17")
end)

QS.RegisterUsableItem("weapontintmk2_18", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_18")
end)

QS.RegisterUsableItem("weapontintmk2_19", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_19")
end)

QS.RegisterUsableItem("weapontintmk2_20", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_20")
end)

QS.RegisterUsableItem("weapontintmk2_21", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_21")
end)

QS.RegisterUsableItem("weapontintmk2_22", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_22")
end)

QS.RegisterUsableItem("weapontintmk2_23", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_23")
end)

QS.RegisterUsableItem("weapontintmk2_24", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_24")
end)

QS.RegisterUsableItem("weapontintmk2_25", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_25")
end)

QS.RegisterUsableItem("weapontintmk2_26", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_26")
end)

QS.RegisterUsableItem("weapontintmk2_27", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_27")
end)

QS.RegisterUsableItem("weapontintmk2_28", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_280")
end)

QS.RegisterUsableItem("weapontintmk2_29", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_29")
end)

QS.RegisterUsableItem("weapontintmk2_30", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_30")
end)

QS.RegisterUsableItem("weapontintmk2_31", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_31")
end)

QS.RegisterUsableItem("weapontinturl", function(source, item)
	if item.info.urltint == nil then
		TriggerClientEvent("weapons:client:ConfigureTint", source, item)
	else
		TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weapontinturl")
	end
end)

-- * Knuckle Style
QS.RegisterUsableItem("knuckle_style_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle1")
end)

QS.RegisterUsableItem("knuckle_style_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle2")
end)

QS.RegisterUsableItem("knuckle_style_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle3")
end)

QS.RegisterUsableItem("knuckle_style_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle4")
end)

QS.RegisterUsableItem("knuckle_style_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle5")
end)

QS.RegisterUsableItem("knuckle_style_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle6")
end)

QS.RegisterUsableItem("knuckle_style_7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle7")
end)

QS.RegisterUsableItem("knuckle_style_8", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle8")
end)

QS.RegisterUsableItem("knuckle_style_9", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle9")
end)

-- * Switchblade Style
QS.RegisterUsableItem("blade_style_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "switchbladestyle1")
end)

QS.RegisterUsableItem("blade_style_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "switchbladestyle2")
end)

-- * Components
QS.RegisterUsableItem("pistol_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_PISTOL", 12, item)
end)

QS.RegisterUsableItem("rifle_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_RIFLE", 30, item)
end)

QS.RegisterUsableItem("sniper_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_SNIPER", 30, item)
end)

QS.RegisterUsableItem("grenadelauncher_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_GRENADELAUNCHER", 30, item)
end)

QS.RegisterUsableItem("smg_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_SMG", 20, item)
end)

QS.RegisterUsableItem("shotgun_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_SHOTGUN", 10, item)
end)

QS.RegisterUsableItem("mg_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_MG", 30, item)
end)

QS.RegisterUsableItem("pistol_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QS.RegisterUsableItem("pistol_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QS.RegisterUsableItem("pistol_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QS.RegisterUsableItem("pistol_compensator", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "compensator")
end)

QS.RegisterUsableItem("smg_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QS.RegisterUsableItem("rifle_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QS.RegisterUsableItem("rifle_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QS.RegisterUsableItem("pistol_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QS.RegisterUsableItem("smg_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QS.RegisterUsableItem("smg_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QS.RegisterUsableItem("smg_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QS.RegisterUsableItem("smg_compensator", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "compensator")
end)

QS.RegisterUsableItem("smg_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QS.RegisterUsableItem("smg_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QS.RegisterUsableItem("smg_drummag", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "drummag")
end)

QS.RegisterUsableItem("rifle_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QS.RegisterUsableItem("rifle_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QS.RegisterUsableItem("rifle_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QS.RegisterUsableItem("rifle_drummag", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "drummag")
end)

QS.RegisterUsableItem("shotgun_drummag", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "drummag")
end)

QS.RegisterUsableItem("shotgun_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QS.RegisterUsableItem("shotgun_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QS.RegisterUsableItem("shotgun_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QS.RegisterUsableItem("shotgun_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QS.RegisterUsableItem("mg_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QS.RegisterUsableItem("mg_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QS.RegisterUsableItem("mg_compensator", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "compensator")
end)

QS.RegisterUsableItem("mg_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QS.RegisterUsableItem("grenadelauncher_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QS.RegisterUsableItem("grenadelauncher_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QS.RegisterUsableItem("grenadelauncher_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QS.RegisterUsableItem("sniper_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QS.RegisterUsableItem("sniper_advancedscope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "advancedscope")
end)

QS.RegisterUsableItem("sniper_nightvision", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "nightvision")
end)

QS.RegisterUsableItem("sniper_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QS.RegisterUsableItem("sniper_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QS.RegisterUsableItem("sniper_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QS.RegisterUsableItem("sniper_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

elseif Config.Framework == 'QBCore' then

--[[ 
-- Repair weapon item example

QBCore.Functions.CreateUseableItem('weapon_carbinerifle_fixer', function(source, item)
    local player = QBCore.Functions.GetPlayer(source)
    fixWeapon(player, 'weapon_carbinerifle')
end) 
]]

QBCore.Functions.CreateUseableItem('serie_changer', function(source, item)
    local player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('weapons:client:SetWeaponSerie', source)
end) 

-- Barrels
QBCore.Functions.CreateUseableItem("m870_barrel_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)	
	
QBCore.Functions.CreateUseableItem("m870_barrel_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_2")
end)

QBCore.Functions.CreateUseableItem("m870_barrel_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_3")
end)

QBCore.Functions.CreateUseableItem("m870_barrel_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_4")
end)

QBCore.Functions.CreateUseableItem("m870_barrel_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_5")
end)

QBCore.Functions.CreateUseableItem("m870_barrel_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_6")
end)

QBCore.Functions.CreateUseableItem("m870_barrel_7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_barrel_7")
end)

-- Handguard
QBCore.Functions.CreateUseableItem("m870_handguard_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_handguard_1")
end)

QBCore.Functions.CreateUseableItem("m870_handguard_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_handguard_2")
end)

QBCore.Functions.CreateUseableItem("m870_handguard_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_handguard_3")
end)

-- Mags
QBCore.Functions.CreateUseableItem("m870_mag_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_mag_1")
end)

QBCore.Functions.CreateUseableItem("m870_mag_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_mag_2")
end)

QBCore.Functions.CreateUseableItem("m870_mag_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_mag_3")
end)	
	
-- Scopes
QBCore.Functions.CreateUseableItem("m870_scope_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "advancedscope")
end)

QBCore.Functions.CreateUseableItem("m870_scope_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QBCore.Functions.CreateUseableItem("m870_scope_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_scope_3")
end)

QBCore.Functions.CreateUseableItem("m870_scope_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_scope_4")
end)

-- Stocks
QBCore.Functions.CreateUseableItem("m870_stock_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_1")
end)

QBCore.Functions.CreateUseableItem("m870_stock_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_2")
end)

QBCore.Functions.CreateUseableItem("m870_stock_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_3")
end)

QBCore.Functions.CreateUseableItem("m870_stock_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_4")
end)

QBCore.Functions.CreateUseableItem("m870_stock_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_5")
end)

QBCore.Functions.CreateUseableItem("m870_stock_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "m870_stock_6")
end)

-- MK 18 Frame
QBCore.Functions.CreateUseableItem("mk18_frame1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "tint")
end)

QBCore.Functions.CreateUseableItem("mk18_frame2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "tint2")
end)

QBCore.Functions.CreateUseableItem("mk18_frame3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "tint3")
end)

-- MK 18 Mags
QBCore.Functions.CreateUseableItem("mk18_clip1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip1")
end)

QBCore.Functions.CreateUseableItem("mk18_clip2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip2")
end)

QBCore.Functions.CreateUseableItem("mk18_clip3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip3")
end)

QBCore.Functions.CreateUseableItem("mk18_clip4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip4")
end)

QBCore.Functions.CreateUseableItem("mk18_clip5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip5")
end)

QBCore.Functions.CreateUseableItem("mk18_clip6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip6")
end)

QBCore.Functions.CreateUseableItem("mk18_clip7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "clip7")
end)

-- MK 18 Flash
QBCore.Functions.CreateUseableItem("mk18_flash1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QBCore.Functions.CreateUseableItem("mk18_flash2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight2")
end)

QBCore.Functions.CreateUseableItem("mk18_flash3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight3")
end)

QBCore.Functions.CreateUseableItem("mk18_flash4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight4")
end)

QBCore.Functions.CreateUseableItem("mk18_flash5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight5")
end)

QBCore.Functions.CreateUseableItem("mk18_flash6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight6")
end)

QBCore.Functions.CreateUseableItem("mk18_flash7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight7")
end)

-- MK 18 Scope
QBCore.Functions.CreateUseableItem("mk18_scope1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QBCore.Functions.CreateUseableItem("mk18_scope2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope2")
end)

QBCore.Functions.CreateUseableItem("mk18_scope3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope3")
end)

QBCore.Functions.CreateUseableItem("mk18_scope4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope4")
end)

QBCore.Functions.CreateUseableItem("mk18_scope5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope5")
end)

QBCore.Functions.CreateUseableItem("mk18_scope6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope6")
end)

QBCore.Functions.CreateUseableItem("mk18_scope7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope7")
end)

QBCore.Functions.CreateUseableItem("mk18_scope8", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope8")
end)

QBCore.Functions.CreateUseableItem("mk18_scope9", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope9")
end)

-- MK 18 Suppressor
QBCore.Functions.CreateUseableItem("mk18_supp1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QBCore.Functions.CreateUseableItem("mk18_supp2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor2")
end)

QBCore.Functions.CreateUseableItem("mk18_supp3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor3")
end)

QBCore.Functions.CreateUseableItem("mk18_supp4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor4")
end)

QBCore.Functions.CreateUseableItem("mk18_supp5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor5")
end)

QBCore.Functions.CreateUseableItem("mk18_supp6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor6")
end)

-- MK 18 Suppressor
QBCore.Functions.CreateUseableItem("mk18_grip1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor6")
end)

QBCore.Functions.CreateUseableItem("mk18_grip2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_grip2")
end)

QBCore.Functions.CreateUseableItem("mk18_grip3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_grip3")
end)

QBCore.Functions.CreateUseableItem("mk18_grip4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_grip4")
end)

QBCore.Functions.CreateUseableItem("mk18_grip5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_grip5")
end)

-- MK 18 Stocks
QBCore.Functions.CreateUseableItem("mk18_stock1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor8")
end)

QBCore.Functions.CreateUseableItem("mk18_stock2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock2")
end)

QBCore.Functions.CreateUseableItem("mk18_stock3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock3")
end)

QBCore.Functions.CreateUseableItem("mk18_stock4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock4")
end)

QBCore.Functions.CreateUseableItem("mk18_stock5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock5")
end)

QBCore.Functions.CreateUseableItem("mk18_stock6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock6")
end)

QBCore.Functions.CreateUseableItem("mk18_stock7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "mk18_stock7")
end)

-- * Tints
QBCore.Functions.CreateUseableItem("luxury", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "luxury")
end)

QBCore.Functions.CreateUseableItem("weapontint_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor1")
end)

QBCore.Functions.CreateUseableItem("weapontint_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor2")
end)

QBCore.Functions.CreateUseableItem("weapontint_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor3")
end)

QBCore.Functions.CreateUseableItem("weapontint_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor4")
end)

QBCore.Functions.CreateUseableItem("weapontint_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor5")
end)

QBCore.Functions.CreateUseableItem("weapontint_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor6")
end)

QBCore.Functions.CreateUseableItem("weapontint_7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolor7")
end)

-- MK2
QBCore.Functions.CreateUseableItem("weapontintmk2_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_1")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_2")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_3")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_4")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_5")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_6")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_7")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_8", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_8")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_9", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_9")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_10", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_10")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_11", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_11")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_12", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_12")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_13", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_13")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_14", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_14")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_15", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_15")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_16", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_16")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_17", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_17")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_18", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_18")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_19", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_19")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_20", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_20")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_21", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_21")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_22", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_22")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_23", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_23")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_24", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_24")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_25", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_25")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_26", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_26")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_27", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_27")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_28", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_280")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_29", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_29")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_30", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_30")
end)

QBCore.Functions.CreateUseableItem("weapontintmk2_31", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weaponcolormk2_31")
end)

QBCore.Functions.CreateUseableItem("weapontinturl", function(source, item)
	if item.info.urltint == nil then
		TriggerClientEvent("weapons:client:ConfigureTint", source, item)
	else
		TriggerClientEvent("weapons:client:EquipAttachment", source, item, "weapontinturl")
	end
end)

-- * Knuckle Style
QBCore.Functions.CreateUseableItem("knuckle_style_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle1")
end)

QBCore.Functions.CreateUseableItem("knuckle_style_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle2")
end)

QBCore.Functions.CreateUseableItem("knuckle_style_3", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle3")
end)

QBCore.Functions.CreateUseableItem("knuckle_style_4", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle4")
end)

QBCore.Functions.CreateUseableItem("knuckle_style_5", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle5")
end)

QBCore.Functions.CreateUseableItem("knuckle_style_6", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle6")
end)

QBCore.Functions.CreateUseableItem("knuckle_style_7", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle7")
end)

QBCore.Functions.CreateUseableItem("knuckle_style_8", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle8")
end)

QBCore.Functions.CreateUseableItem("knuckle_style_9", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "knucklestyle9")
end)

-- * Switchblade Style
QBCore.Functions.CreateUseableItem("blade_style_1", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "switchbladestyle1")
end)

QBCore.Functions.CreateUseableItem("blade_style_2", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "switchbladestyle2")
end)

-- * Components
QBCore.Functions.CreateUseableItem("pistol_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_PISTOL", 12, item)
end)

QBCore.Functions.CreateUseableItem("rifle_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_RIFLE", 30, item)
end)

QBCore.Functions.CreateUseableItem("sniper_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_SNIPER", 30, item)
end)

QBCore.Functions.CreateUseableItem("grenadelauncher_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_GRENADELAUNCHER", 30, item)
end)

QBCore.Functions.CreateUseableItem("smg_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_SMG", 20, item)
end)

QBCore.Functions.CreateUseableItem("shotgun_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_SHOTGUN", 10, item)
end)

QBCore.Functions.CreateUseableItem("mg_ammo", function(source, item)
    TriggerClientEvent("weapon:client:AddAmmo", source, "AMMO_MG", 30, item)
end)

QBCore.Functions.CreateUseableItem("pistol_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QBCore.Functions.CreateUseableItem("pistol_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QBCore.Functions.CreateUseableItem("pistol_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QBCore.Functions.CreateUseableItem("pistol_compensator", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "compensator")
end)

QBCore.Functions.CreateUseableItem("smg_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QBCore.Functions.CreateUseableItem("rifle_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QBCore.Functions.CreateUseableItem("rifle_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QBCore.Functions.CreateUseableItem("pistol_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QBCore.Functions.CreateUseableItem("smg_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QBCore.Functions.CreateUseableItem("smg_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QBCore.Functions.CreateUseableItem("smg_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QBCore.Functions.CreateUseableItem("smg_compensator", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "compensator")
end)

QBCore.Functions.CreateUseableItem("smg_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QBCore.Functions.CreateUseableItem("smg_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QBCore.Functions.CreateUseableItem("smg_drummag", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "drummag")
end)

QBCore.Functions.CreateUseableItem("rifle_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QBCore.Functions.CreateUseableItem("rifle_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QBCore.Functions.CreateUseableItem("rifle_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QBCore.Functions.CreateUseableItem("rifle_drummag", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "drummag")
end)

QBCore.Functions.CreateUseableItem("shotgun_drummag", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "drummag")
end)

QBCore.Functions.CreateUseableItem("shotgun_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QBCore.Functions.CreateUseableItem("shotgun_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QBCore.Functions.CreateUseableItem("shotgun_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QBCore.Functions.CreateUseableItem("shotgun_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QBCore.Functions.CreateUseableItem("mg_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QBCore.Functions.CreateUseableItem("mg_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QBCore.Functions.CreateUseableItem("mg_compensator", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "compensator")
end)

QBCore.Functions.CreateUseableItem("mg_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QBCore.Functions.CreateUseableItem("grenadelauncher_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QBCore.Functions.CreateUseableItem("grenadelauncher_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QBCore.Functions.CreateUseableItem("grenadelauncher_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QBCore.Functions.CreateUseableItem("sniper_scope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "scope")
end)

QBCore.Functions.CreateUseableItem("sniper_advancedscope", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "advancedscope")
end)

QBCore.Functions.CreateUseableItem("sniper_nightvision", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "nightvision")
end)

QBCore.Functions.CreateUseableItem("sniper_grip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "grip")
end)

QBCore.Functions.CreateUseableItem("sniper_extendedclip", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "extendedclip")
end)

QBCore.Functions.CreateUseableItem("sniper_suppressor", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "suppressor")
end)

QBCore.Functions.CreateUseableItem("sniper_flashlight", function(source, item)
    TriggerClientEvent("weapons:client:EquipAttachment", source, item, "flashlight")
end)

QBCore.Functions.CreateUseableItem("id_card", function(source, item)
    local PlayerPed = GetPlayerPed(source)
    local PlayerCoords = GetEntityCoords(PlayerPed)
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local TargetPed = GetPlayerPed(v)
        local dist = #(PlayerCoords - GetEntityCoords(TargetPed))
        if dist < 3.0 then
            local gender = "Man"
            if item.info.gender == 1 then
                gender = "Woman"
            end
            TriggerClientEvent('chat:addMessage', v,  {
                    template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>Civ ID:</strong> {1} <br><strong>First Name:</strong> {2} <br><strong>Last Name:</strong> {3} <br><strong>Birthdate:</strong> {4} <br><strong>Gender:</strong> {5} <br><strong>Nationality:</strong> {6}</div></div>',
                    args = {
                        "ID Card",
                        item.info.citizenid,
                        item.info.firstname,
                        item.info.lastname,
                        item.info.birthdate,
                        gender,
                        item.info.nationality
                    }
                }
            )
        end
    end
end)

QBCore.Functions.CreateUseableItem("driver_license", function(source, item)
    local PlayerPed = GetPlayerPed(source)
    local PlayerCoords = GetEntityCoords(PlayerPed)
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local TargetPed = GetPlayerPed(v)
        local dist = #(PlayerCoords - GetEntityCoords(TargetPed))
        if dist < 3.0 then
            TriggerClientEvent('chat:addMessage', v,  {
                    template = '<div class="chat-message advert"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>First Name:</strong> {1} <br><strong>Last Name:</strong> {2} <br><strong>Birth Date:</strong> {3} <br><strong>Licenses:</strong> {4}</div></div>',
                    args = {
                        "Drivers License",
                        item.info.firstname,
                        item.info.lastname,
                        item.info.birthdate,
                        item.info.type
                    }
                }
            )
        end
    end
end)
end
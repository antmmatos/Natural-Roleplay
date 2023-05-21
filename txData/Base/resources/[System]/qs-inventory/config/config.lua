Config = {}

--░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░
--██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░
--██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░
--██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░
--╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
--░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝

Config.Debug = false -- Debug mode, only for development.

Config.status_onTick = "esx_status:onTick" --Modify it if you use an Status Custom.
Config.status_getStatus = "esx_status:getStatus" --Modify it if you use an Status Custom.

Config.DropRefreshTime = 18000000 --Time for me to refresh the Drops.

--Player
Config.MaxWeight = 250000 -- This is the maximum weight of each player (Remember to add the same in qs-core/config.lua)
Config.MaxInventorySlots = 41 -- The maximum slots of each player (Remember to add the same in qs-core/config.lua)

-- Drop
Config.DropMaxWeight = 1500000 -- Max weight on droped items

--Stashes
Config.StashWeight = 100000 --Stash's maximum weight (Everyone will have this maximum)
Config.StashSlots = 50 --Stash's maximum slots (Everyone will have this maximum)

--Glovebox
Config.GloveboxWeight = 10000 --Glovebox's maximum weight (Everyone will have this maximum)
Config.GloveboxSlots = 5 --Glovebox's maximum slots (Everyone will have this maximum)

--Hotbar
Config.EnableVisualHotBar = true -- Enable the visual hotbar by default in TAB
Config.ShowWeapons = true -- Show a notification every time you use a weapon.
Config.ShowItems = true -- Show a notification every time you use an item.

Config.ItemsUsableFromHotbar = true -- Set if the items can be used from the hotbar or not.
Config.ItemsUsableFromHotbarInVehicle = true -- If the option above its true, you can only disable usage of items in vehicles (Not weapons).

Config.UpdateWeaponQuality = true -- Do you want weapons to degrade?

-- Reload
Config.Reload = false -- With this system, you will reload the weapon with keys.
Config.ReloadMappingName = 'Recarregar' -- Explanatory text of the command?

-- Prop
Config.UseItemDrop = true -- If you use false, the drop will be a marker, if true it will be a prop.
Config.MaxDropViewDistance = 12.5 -- Distance at which the prop is seen.
Config.ItemDropObject = `prop_money_bag_01` -- This prop will be the drop (https://gtahash.ru/)

--Handsup.
Config.HandsUp = true --Hands Up is important, as it will allow other players to steal when they raise their hands.
Config.HandsUpKeyMappingName = 'Handsup' -- Name of the key mapping.
Config.WeaponNeededToSteal = true -- True if you need a weapon in hand to steal someone else
Config.EnableSearchOtherPlayersInventory = true -- Enable or not search other players inventory
Config.EnableSearchOtherPlayersInventoryDead = true -- Enable or not search other players inventory if they are dead

Config.DistanceCheckEnable = true -- Enable distance check when you are stealing someone or not. (Only works in Onesync servers, DISABLE THIS IF YOU ARE NOT USING ONESYNC)
Config.DistanceCheckSteal = 10.0 -- Distance check to prevent hacker to open inventory of player that are far from them (Not recommended to lower it).

Config.ListAccountsSteal = { -- List of accounts to be stealed only in QBCore version.
    { account = 'cash' , name = 'Cash' },
    { account = 'crypto' , name = 'Crypto' },
}

Config.OpenAnimation = true --If you put true here, there will be an animation when opening the inventory

-- Near players give items.
Config.ShowNameNearPlayer = true --Set to false it would just show the ID of the target

-- To be able to use this you should be in ESX and follow the docs to add the event that trigger this once you join in the server for the first time
-- Event to trigger only from serverside to serverside for segurity reason.
-- Event TriggerEvent('qs-inventory:GiveStarterItems', id)
Config.StarterItems = { 
    ['water_bottle'] = 3, -- Insert item first and then the amount
    ['tosti'] = 5,
}

Config.Commands = { --Modify the commands as you want
    ["fix"] = "inventoryfix",
    ["giveitem"] = "giveitem",
    ["giveweapon"] = "giveweapon",
    ["giveweaponcolor"] = "giveweaponcolor",
    ["randomitems"] = "randomitems",
    ["search"] = "search",
    ["handsup"] = "handsup",
    ["clearinventory"] = "clearinventory",
    ["reloadweapon"] = "reloadweapon",
    ["openhotbar"] = "openhotbar",
    ["openinventory"] = "openinventory",
    ["openinventorytarget"] = "openinventorytarget",
    ["opentrunk"] = "opentrunk",
    ["openglovebox"] = "openglovebox",
}

Config.Keys = { --Basic inventory keys
    ["OpenHotBar"] = "TAB",
    ["OpenInventory"] = "F2",
    ["OpenVending"] = "E",
    ["OpenStash"] = "E",
    ["RepairWeapon"] = "E",
    ["OpenCrafting"] = "E",
    ["HandsUp"] = "X",
    ["Reload"] = "R",
}

Config.notStolenItems = {
    ['id_card'] = true
}

Config.notStoredStashItems = {
    ['backpack'] = true, -- Don't modify this
}

function SendTextMessage(msg, type) --You can add your notification system here for simple messages.
    if type == 'inform' then 
      --SetNotificationTextEntry('STRING')
      --AddTextComponentString(msg)
      --DrawNotification(0,1)
  
      --MORE EXAMPLES OF NOTIFICATIONS.
      exports['qs-core']:Notify(msg, "primary")
      --exports['mythic_notify']:DoHudText('inform', msg)
    end
    if type == 'error' then 
      --SetNotificationTextEntry('STRING')
      --AddTextComponentString(msg)
      --DrawNotification(0,1)
  
      --MORE EXAMPLES OF NOTIFICATIONS.
      exports['qs-core']:Notify(msg, "error")
      --exports['mythic_notify']:DoHudText('error', msg)
    end
    if type == 'success' then 
      --SetNotificationTextEntry('STRING')
      --AddTextComponentString(msg)
      --DrawNotification(0,1)
  
      --MORE EXAMPLES OF NOTIFICATIONS.
      exports['qs-core']:Notify(msg, "success")
      --exports['mythic_notify']:DoHudText('success', msg)
    end
end

function CustomNotify(x, y, z, text)
    -- Add your custom draw notification system here.
end


--██████╗░███████╗░██████╗░  ██╗████████╗███████╗███╗░░░███╗░██████╗
--██╔══██╗██╔════╝██╔═══██╗  ██║╚══██╔══╝██╔════╝████╗░████║██╔════╝
--██████╔╝█████╗░░██║██╗██║  ██║░░░██║░░░█████╗░░██╔████╔██║╚█████╗░
--██╔══██╗██╔══╝░░╚██████╔╝  ██║░░░██║░░░██╔══╝░░██║╚██╔╝██║░╚═══██╗
--██║░░██║███████╗░╚═██╔═╝░  ██║░░░██║░░░███████╗██║░╚═╝░██║██████╔╝
--╚═╝░░╚═╝╚══════╝░░░╚═╝░░░  ╚═╝░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝╚═════╝░

Config.ReqItems = {
    --{
    --    coords = vec3(2699.0739746094, 3296.3061523438, 55.703121185303),
    --    dist = 5.0,
    --    items = {
    --        'lockpick',
    --        'advancedlockpick'
    --    },
    --},
    --{
    --    coords = vec3(2691.1044921875, 3284.0744628906, 55.240516662598),
    --    dist = 5.0,
    --    items = {
    --        'sandwich',
    --        'advancedlockpick'
    --    },
    --},
}

 
--██╗░░░██╗███████╗██╗░░██╗██╗░█████╗░██╗░░░░░███████╗░██████╗
--██║░░░██║██╔════╝██║░░██║██║██╔══██╗██║░░░░░██╔════╝██╔════╝
--╚██╗░██╔╝█████╗░░███████║██║██║░░╚═╝██║░░░░░█████╗░░╚█████╗░
--░╚████╔╝░██╔══╝░░██╔══██║██║██║░░██╗██║░░░░░██╔══╝░░░╚═══██╗
--░░╚██╔╝░░███████╗██║░░██║██║╚█████╔╝███████╗███████╗██████╔╝
--░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═╝░╚════╝░╚══════╝╚══════╝╚═════╝░

Config.WeaponsOnVehicle = true -- Recomended in false

-- Glovebox
Config.OpenGloveboxesAll = true -- Set to true to allow all players to open the glovebox of the vehicles / Set false to allow only the owner of the vehicle to open the glovebox
Config.OpenGloveboxesPolice = true -- If the option above its set to false, set if the police can open the trunk or not anyways
Config.OpenGloveboxesPoliceGrade = 0 -- Grade from the police will be able to open the gloveboxs

-- Trunk
Config.OpenTrunkAll = true -- Set to true to allow all players to open the trunk of the vehicles / Set false to allow only the owner of the vehicle to open the trunk
Config.OpenTrunkPolice = true -- If the option above its set to false, set if the police can open the trunk or not anyways
Config.OpenTrunkPoliceGrade = 0 -- Grade from the police will be able to open the trunks

Config.TrunkWeightVehicles = { -- Add here the vehicles you want to have an specific weight or slots in the trunk (Respect the type of quotation marks, if not it will not work)
    ['flatbed'] = 100000,
    ['sandking'] = 750000,
    ['sandking2'] = 750000,
    ["rebel"] = 400000,
    ["rebel2"] = 400000,
    ["yosemite"] = 400000,
    ["yosemite3"] = 400000,
    ["slamvan"] = 400000,
    ["slamvan2"] = 400000,
    ["slamvan3"] = 400000,
    ["caracara"] = 750000,
    ["caracara2"] = 750000,
    ["everon"] = 600000,
    ["bodhi2"] = 600000,
    ["f150"] = 700000,
    ["riata"] = 600000,
    ["dubsta3"] = 600000,
    ["kamacho"] = 600000,
    ["rr14"] = 600000,
    ["22g63"] = 600000,
    ["bagger"] = 350000,
    ["brioso2"] = 500000,
    ["sultanrs"] = 300000,
    ["sultan"] = 300000,
}

Config.TrunkWeight = { --You can check the type of vehicle here or in its META files https://wiki.rage.mp/index.php?title=Vehicles#Compacts.
    [0] =   { MaxWeight = 5000,    slots = 50 }, -- Compacts
    [1] =   { MaxWeight = 5000,    slots = 50 }, --Sedans
    [2] =   { MaxWeight = 5000,    slots = 50 }, --SUVs
    [3] =   { MaxWeight = 5000,    slots = 50 }, --Coupes
    [4] =   { MaxWeight = 5000,    slots = 50 }, --Muscle
    [5] =   { MaxWeight = 5000,    slots = 50 }, -- Sports Classics
    [6] =   { MaxWeight = 5000,    slots = 50 }, --Sports
    [7] =   { MaxWeight = 5000,    slots = 50 }, --Super
    [8] =   { MaxWeight = 5000,    slots = 50 }, --Motorcycles
    [9] =   { MaxWeight = 5000,    slots = 50 }, --Off-road
    [10] =  { MaxWeight = 5000,    slots = 50 }, --Industrial
    [11] =  { MaxWeight = 5000,    slots = 50 }, --Utility
    [12] =  { MaxWeight = 5000,    slots = 50 }, --van
    [13] =  { MaxWeight = 5000,    slots = 50 }, --Cycles
    [14] =  { MaxWeight = 5000,    slots = 50 }, --boats
    [15] =  { MaxWeight = 5000,    slots = 50 }, --Helicopters
    [16] =  { MaxWeight = 5000,    slots = 50 }, --Planes
    [17] =  { MaxWeight = 5000,    slots = 50 }, -- Service
    [18] =  { MaxWeight = 5000,    slots = 50 }, --Emergency
    [19] =  { MaxWeight = 5000,    slots = 50 }, --Military
    [20] =  { MaxWeight = 5000,    slots = 50 }, -- Commerical
    [21] =  { MaxWeight = 5000,    slots = 50 }  --Trains
}

Config.BackEngineVehicles = { --The cars on this list will have the trunk in front.
    'ninef',
    'adder',
    'vagner',
    't20',
    'infernus',
    'zentorno',
    'reaper',
    'comet2',
    'comet3',
    'jester',
    'jester2',
    'cheetah',
    'cheetah2',
    'prototipo',
    'turismor',
    'pfister811',
    'ardent',
    'nero',
    'nero2',
    'tempesta',
    'vacca',
    'bullet',
    'osiris',
    'entityxf',
    'turismo2',
    'fmj',
    're7b',
    'tyrus',
    'italigtb',
    'penetrator',
    'monroe',
    'ninef2',
    'stingergt',
    'surfer',
    'surfer2',
    'comet3',
}


--░██████╗░░█████╗░██████╗░██████╗░░█████╗░░██████╗░███████╗
--██╔════╝░██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝░██╔════╝
--██║░░██╗░███████║██████╔╝██████╦╝███████║██║░░██╗░█████╗░░
--██║░░╚██╗██╔══██║██╔══██╗██╔══██╗██╔══██║██║░░╚██╗██╔══╝░░
--╚██████╔╝██║░░██║██║░░██║██████╦╝██║░░██║╚██████╔╝███████╗
--░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝░╚═════╝░╚══════╝

Config.GarbageItems = {}

Config.FreezeGarbages = true -- Recommendation to set this config true to freeze all garbages in the Config.Garbage Props config to not allow players to move them with a vehicle.

Config.GarbageRefreshTime = 3600000 --Time in milliseconds for new objects to appear in the trash.

Config.GarbageProps = { --Modify the props of the garbage cans (Search the props in google)
    [218085040] = true,
    [666561306] = true, 
	[-58485588] = true,
	[-206690185] = true,
	[1511880420] = true,
    [682791951] = true, 
}

Config.RandomGarbageItems = { --Add here the trash items (One of these random options will appear)
    [1] = {
        [1] = {
            name = "aluminum",
            amount = math.random(1, 4),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "plastic",
            amount = math.random(1, 7),
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    [2] = {
        [1] = {
            name = "plastic",
            amount = math.random(1, 7),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "metalscrap",
            amount = math.random(1, 5),
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    [3] = {
        [1] = {
            name = "glass",
            amount = math.random(1, 7),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "joint",
            amount = 1,
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    [4] = {
        [1] = {
            name = "lighter",
            amount = math.random(1, 2),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "metalscrap",
            amount = math.random(1, 7),
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
    [5] = {
        [1] = {
            name = "metalscrap",
            amount = math.random(1, 10),
            price = 4,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "rubber",
            amount = math.random(1, 15),
            price = 4,
            info = {},
            type = "item",
            slot = 2,
        },
    },
}

--██╗░░░██╗██╗░██████╗██╗░░░██╗░█████╗░██╗░░░░░  ░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░
--██║░░░██║██║██╔════╝██║░░░██║██╔══██╗██║░░░░░  ██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░
--╚██╗░██╔╝██║╚█████╗░██║░░░██║███████║██║░░░░░  ██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░
--░╚████╔╝░██║░╚═══██╗██║░░░██║██╔══██║██║░░░░░  ██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗
--░░╚██╔╝░░██║██████╔╝╚██████╔╝██║░░██║███████╗  ╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝
--░░░╚═╝░░░╚═╝╚═════╝░░╚═════╝░╚═╝░░╚═╝╚══════╝  ░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░

Config.HideMinimap = true --If you activate this, you will hide the map when opening the inventory and reveal it when closing it.
Config.ToggleHud = true --If you don't use this option, just leave it false (Hide your hud when opening the inventory)

function ClothingComponent(data)
    if data.component == 'mask' then
        ExecuteCommand('mask')
    elseif data.component == 'glasses' then
        ExecuteCommand('glasses')
    elseif data.component == 'shirt' then
        ExecuteCommand('shirt')
    elseif data.component == 'vest' then
        ExecuteCommand('vest')
    elseif data.component == 'pants' then
        ExecuteCommand('pants')
    elseif data.component == 'shoes' then
        ExecuteCommand('shoes')
    elseif data.component == 'bag' then
        ExecuteCommand('bag')
    elseif data.component == 'gloves' then
        ExecuteCommand('gloves')
    elseif data.component == 'watch' then
        ExecuteCommand('watch')
    else
        ExecuteCommand(data.component)
    end
end

function ToggleHudTrue(toggle) --If your Hud has this system, you can add these functions.
    -- Put your event here!
end

function ToggleHudFalse(toggle) --If your Hud has this system, you can add these functions.
    -- Put your event here!
end

Config.RepairMarker = { --Modify the Stash marker as you like.
    enablemarker = false,
    type = 2, 
    scale = {x = 0.2, y = 0.2, z = 0.1}, 
    colour = {r = 71, g = 181, b = 255, a = 120},
    movement = 1, --Use 0 to disable movement.
    distanceMarker = 10.0,
    distanceText = 1.5,
}

Config.DropMarker = { --Modify the Drop marker as you like.
    enabletext = false,
    type = 2, 
    scale = {x = 0.2, y = 0.2, z = 0.1}, 
    colour = {r = 71, g = 181, b = 255, a = 120},
    movement = 1, --Use 0 to disable movement.
    distanceMarker = 7.5,
    distanceText = 2.5,
}

function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = string.len(text) / 370
    DrawRect(0.0, 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

RegisterNetEvent('ActionNotifications')
AddEventHandler('ActionNotifications', function(data, source, name, item, count)
    NotificationActions(data, source, name, item, count)
end)

Config.EnableActionNotifications = true

function NotificationActions(data, source, name, item, count)
    if Config.EnableActionNotifications then
        if data then 
            if data == 'givetoplayer' then 
                --TriggerEvent('inform:sendInform', name .. ' give x' .. count .. ' '.. item, source)
            elseif data == 'otherplayer' then 
                --TriggerEvent('inform:sendInform', name .. ' start to search the target', source)
            elseif data == 'stash' then
                --TriggerEvent('inform:sendInform', name .. ' open an inventory', source)
            elseif data == 'trunk' then
                --TriggerEvent('inform:sendInform', name .. ' open the trunk', source)
            elseif data == 'glovebox' then
                --TriggerEvent('inform:sendInform', name .. ' open the glovebox', source)
            elseif data == 'shop' then
                --TriggerEvent('inform:sendInform', name .. ' its looking the products', source)
            elseif data == 'garbage' then
                --TriggerEvent('inform:sendInform', name .. ' its looking into the garbage', source)
            elseif data == '' then
            end
        end
    end
end
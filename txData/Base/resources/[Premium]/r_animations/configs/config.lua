Config = {}

-- 0 standalone
-- 1 ESX
-- 2 QBCore
-- 3 NEW ESX (USING EXPORT NOT TRIGGER EVENT)
Config.Framework = 3

Config.QBCoreFrameworkResource = 'qb-core' -- if you don't use qb-core skip this point

Config.ESXGetSharedObjectTrigger = 'esx:getSharedObject' -- if you don't use ESX skip this point
-- 0 oxmysql/mysql-async 
-- 1 ghmattimysql
Config.SQLType = 0

-- 0 steamhex
-- 1 xPlayer.identifier (ESX) or citizenid (QBCore) !!!supports only frameworks ESX and QBCore!!!
Config.IdentifierType = 1

Config.UpdateChecker = true

Config.BlurBackground = true -- Blur background

Config.DeadCheck = { -- Disable menu and playing animations while player is dead
    Enable = true,
    UseStateBag = false -- Will use LocalPlayer.state.dead instead of IsPedDeadOrDying(PlayerPedId())
}

Config.OpenMenu = {
    Command = 'animationmenu', -- Name of command to open animation menu.
    Keybind = 'F4' -- Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
}

Config.CancelAnimation = {
    CommandToogle = true, 
    Command = 'c', -- Name of command to cancel animation
    Keybind = 'X' -- Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
}

Config.AnimationPlayCommand = 'e'

Config.DisableInCar = false -- Disable playing all animations in cars

Config.ChangeAnimationSetCommand = 'emoteset' -- It allows players to set their preset set of favorite animations (numbers 1-6)

Config.CombineAnimations = true

Config.QuickAnim = {
    Enabled = false,
    Key1 = '1', -- SHIFT + Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Key2 = '2', -- SHIFT + Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Key3 = '3', -- SHIFT + Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Key4 = '4', -- SHIFT + Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Key5 = '5' -- SHIFT + Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
}

Config.Saving = {
    WalkStyle = true, -- WalkStyle in Database Saving
    FaceExpression = true -- FaceExpression in Database Saving
}

Config.Pointing = {
    Enabled = true, -- Toogle Pointing
    Keybind = 'B',  -- Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    DisableInCar = true,
}

Config.Crouch = {
    Enabled = true, -- Toogle Crouch
    Key = 36, -- Control Index from https://docs.fivem.net/docs/game-references/controls/
    CanShoot = true, -- Players can shoot crouched? true/false 
    DisableSprint = false, -- Disable sprint while crouched
}

Config.Crawl = {
    Enabled = true, -- Toogle Crawl
    Keybind = 'RCONTROL' -- The default keybind for crawling
}

Config.HandsUp = {
    Enabled = false, -- Toogle HandsUp
    Keybind = 'X' -- Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
}

Config.Ragdoll = {
    Enable = true, -- Toogle Ragdoll
    Keybind = 'M', -- Input Parameter from https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    DisableWhileDead = true
}

Config.InjuredWalkStyle = {
    Enable = true,  -- Toogle Injured Walk style by Ped HP
    PedHealth = 130, -- Number of Ped HP from native GetEntityHealth (https://docs.fivem.net/natives/?_0xEEF059FAD016D209)
}

Config.AnimEdit = {
    Enable = false,
    CanEditAll = true,
    Command = 'animedit',
    MaxDistance = 3,
    UpKey = 44,
    DownKey = 20, 
    FrontKey = 32,
    BackKey = 33, 
    LeftKey = 34,
    RightKey = 35,
    AcceptKey = 23,
}

-- ** UPDATE 1.4.0

Config.WalkWhileUsing = true

-- ** END OF NEW OPTIONS

-- Weapons that work with aim styles 
Config.WeaponAnimationsAllowed = {
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_APPISTOL",
    "WEAPON_PISTOL50",
    "WEAPON_SNSPISTOL",
    "WEAPON_HEAVYPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_MARKSMANPISTOL",
    "WEAPON_MACHINEPISTOL",
    "WEAPON_VINTAGEPISTOL",
    "WEAPON_PISTOL_MK2",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_FLAREGUN",
    "WEAPON_STUNGUN",
    "WEAPON_REVOLVER",
}

Config.CustomNotifiaction = false
--[[
    -- To use custom notifications, implement client event handler, example:

    AddEventHandler('rd-animations:notification', function(message)
        print(message)
    end)
]]

Config.CustomHelpNotifiaction = false
--[[
    -- To use custom notifications, implement client event handler, example:

    AddEventHandler('rd-animations:helpnotification', function(message)
        print(message)
    end)
]]

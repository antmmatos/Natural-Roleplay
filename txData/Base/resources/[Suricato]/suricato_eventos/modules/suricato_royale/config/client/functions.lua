local base = {}
local cache = { 
    names = {},
    minimap = false 
}
local weaponNames = {
    ["0"] = 'UNDEFINED',
    [GetHashKey('WEAPON_UNARMED')] = 'WEAPON_UNARMED',
    [GetHashKey('WEAPON_RUN_OVER_BY_CAR')] = 'WEAPON_RUN_OVER_BY_CAR',
    [GetHashKey('WEAPON_RAMMED_BY_CAR')] = 'WEAPON_RAMMED_BY_CAR',
    [GetHashKey('VEHICLE_WEAPON_ROTORS')] = 'VEHICLE_WEAPON_ROTORS',
    [GetHashKey('WEAPON_DAGGER')] = 'WEAPON_DAGGER',
    [GetHashKey('WEAPON_BAT')] = 'WEAPON_BAT',
    [GetHashKey('WEAPON_BOTTLE')] = 'WEAPON_BOTTLE',
    [GetHashKey('WEAPON_CROWBAR')] = 'WEAPON_CROWBAR',
    [GetHashKey('WEAPON_FLASHLIGHT')] = 'WEAPON_FLASHLIGHT',
    [GetHashKey('WEAPON_GOLFCLUB')] = 'WEAPON_GOLFCLUB',
    [GetHashKey('WEAPON_HAMMER')] = 'WEAPON_HAMMER',
    [GetHashKey('WEAPON_HATCHET')] = 'WEAPON_HATCHET',
    [GetHashKey('WEAPON_KNUCKLE')] = 'WEAPON_KNUCKLE',
    [GetHashKey('WEAPON_KNIFE')] = 'WEAPON_KNIFE',
    [GetHashKey('WEAPON_MACHETE')] = 'WEAPON_MACHETE',
    [GetHashKey('WEAPON_SWITCHBLADE')] = 'WEAPON_SWITCHBLADE',
    [GetHashKey('WEAPON_NIGHTSTICK')] = 'WEAPON_NIGHTSTICK',
    [GetHashKey('WEAPON_WRENCH')] = 'WEAPON_WRENCH',
    [GetHashKey('WEAPON_BATTLEAXE')] = 'WEAPON_BATTLEAXE',
    [GetHashKey('WEAPON_POOLCUE')] = 'WEAPON_POOLCUE',
    [GetHashKey('WEAPON_STONE_HATCHET')] = 'WEAPON_STONE_HATCHET',
    [GetHashKey('WEAPON_PISTOL')] = 'WEAPON_PISTOL',
    [GetHashKey('WEAPON_PISTOL_MK2')] = 'WEAPON_PISTOL_MK2',
    [GetHashKey('WEAPON_COMBATPISTOL')] = 'WEAPON_COMBATPISTOL',
    [GetHashKey('WEAPON_APPISTOL')] = 'WEAPON_APPISTOL',
    [GetHashKey('WEAPON_STUNGUN')] = 'WEAPON_STUNGUN',
    [GetHashKey('WEAPON_PISTOL50')] = 'WEAPON_PISTOL50',
    [GetHashKey('WEAPON_SNSPISTOL')] = 'WEAPON_SNSPISTOL',
    [GetHashKey('WEAPON_SNSPISTOL_MK2')] = 'WEAPON_SNSPISTOL_MK2',
    [GetHashKey('WEAPON_HEAVYPISTOL')] = 'WEAPON_HEAVYPISTOL',
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = 'WEAPON_VINTAGEPISTOL',
    [GetHashKey('WEAPON_FLAREGUN')] = 'WEAPON_FLAREGUN',
    [GetHashKey('WEAPON_MARKSMANPISTOL')] = 'WEAPON_MARKSMANPISTOL',
    [GetHashKey('WEAPON_REVOLVER')] = 'WEAPON_REVOLVER',
    [GetHashKey('WEAPON_REVOLVER_MK2')] = 'WEAPON_REVOLVER_MK2',
    [GetHashKey('WEAPON_DOUBLEACTION')] = 'WEAPON_DOUBLEACTION',
    [GetHashKey('WEAPON_RAYPISTOL')] = 'WEAPON_RAYPISTOL',
    [GetHashKey('WEAPON_CERAMICPISTOL')] = 'WEAPON_CERAMICPISTOL',
    [GetHashKey('WEAPON_NAVYREVOLVER')] = 'WEAPON_NAVYREVOLVER',
    [GetHashKey('WEAPON_GADGETPISTOL')] = 'WEAPON_GADGETPISTOL',
    [GetHashKey('WEAPON_MICROSMG')] = 'WEAPON_MICROSMG',
    [GetHashKey('WEAPON_SMG')] = 'WEAPON_SMG',
    [GetHashKey('WEAPON_SMG_MK2')] = 'WEAPON_SMG_MK2',
    [GetHashKey('WEAPON_ASSAULTSMG')] = 'WEAPON_ASSAULTSMG',
    [GetHashKey('WEAPON_COMBATPDW')] = 'WEAPON_COMBATPDW',
    [GetHashKey('WEAPON_MACHINEPISTOL')] = 'WEAPON_MACHINEPISTOL',
    [GetHashKey('WEAPON_MINISMG')] = 'WEAPON_MINISMG',
    [GetHashKey('WEAPON_RAYCARBINE')] = 'WEAPON_RAYCARBINE',
    [GetHashKey('WEAPON_PUMPSHOTGUN')] = 'WEAPON_PUMPSHOTGUN',
    [GetHashKey('WEAPON_PUMPSHOTGUN_MK2')] = 'WEAPON_PUMPSHOTGUN_MK2',
    [GetHashKey('WEAPON_SAWNOFFSHOTGUN')] = 'WEAPON_SAWNOFFSHOTGUN',
    [GetHashKey('WEAPON_ASSAULTSHOTGUN')] = 'WEAPON_ASSAULTSHOTGUN',
    [GetHashKey('WEAPON_BULLPUPSHOTGUN')] = 'WEAPON_BULLPUPSHOTGUN',
    [GetHashKey('WEAPON_MUSKET')] = 'WEAPON_MUSKET',
    [GetHashKey('WEAPON_HEAVYSHOTGUN')] = 'WEAPON_HEAVYSHOTGUN',
    [GetHashKey('WEAPON_DBSHOTGUN')] = 'WEAPON_DBSHOTGUN',
    [GetHashKey('WEAPON_AUTOSHOTGUN')] = 'WEAPON_AUTOSHOTGUN',
    [GetHashKey('WEAPON_COMBATSHOTGUN')] = 'WEAPON_COMBATSHOTGUN',
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = 'WEAPON_ASSAULTRIFLE',
    [GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = 'WEAPON_ASSAULTRIFLE_MK2',
    [GetHashKey('WEAPON_CARBINERIFLE')] = 'WEAPON_CARBINERIFLE',
    [GetHashKey('WEAPON_CARBINERIFLE_MK2')] = 'WEAPON_CARBINERIFLE_MK2',
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = 'WEAPON_ADVANCEDRIFLE',
    [GetHashKey('WEAPON_SPECIALCARBINE')] = 'WEAPON_SPECIALCARBINE',
    [GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = 'WEAPON_SPECIALCARBINE_MK2',
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = 'WEAPON_BULLPUPRIFLE',
    [GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = 'WEAPON_BULLPUPRIFLE_MK2',
    [GetHashKey('WEAPON_COMPACTRIFLE')] = 'WEAPON_COMPACTRIFLE',
    [GetHashKey('WEAPON_MILITARYRIFLE')] = 'WEAPON_MILITARYRIFLE',
    [GetHashKey('WEAPON_MG')] = 'WEAPON_MG',
    [GetHashKey('WEAPON_COMBATMG')] = 'WEAPON_COMBATMG',
    [GetHashKey('WEAPON_COMBATMG_MK2')] = 'WEAPON_COMBATMG_MK2',
    [GetHashKey('WEAPON_GUSENBERG')] = 'WEAPON_GUSENBERG',
    [GetHashKey('WEAPON_SNIPERRIFLE')] = 'WEAPON_SNIPERRIFLE',
    [GetHashKey('WEAPON_HEAVYSNIPER')] = 'WEAPON_HEAVYSNIPER',
    [GetHashKey('WEAPON_HEAVYSNIPER_MK2')] = 'WEAPON_HEAVYSNIPER_MK2',
    [GetHashKey('WEAPON_MARKSMANRIFLE')] = 'WEAPON_MARKSMANRIFLE',
    [GetHashKey('WEAPON_MARKSMANRIFLE_MK2')] = 'WEAPON_MARKSMANRIFLE_MK2',
    [GetHashKey('WEAPON_RPG')] = 'WEAPON_RPG',
    [GetHashKey('WEAPON_GRENADELAUNCHER')] = 'WEAPON_GRENADELAUNCHER',
    [GetHashKey('WEAPON_MINIGUN')] = 'WEAPON_MINIGUN',
    [GetHashKey('WEAPON_FIREWORK')] = 'WEAPON_FIREWORK',
    [GetHashKey('WEAPON_RAILGUN')] = 'WEAPON_RAILGUN',
    [GetHashKey('WEAPON_HOMINGLAUNCHER')] = 'WEAPON_HOMINGLAUNCHER',
    [GetHashKey('WEAPON_COMPACTLAUNCHER')] = 'WEAPON_COMPACTLAUNCHER',
    [GetHashKey('WEAPON_RAYMINIGUN')] = 'WEAPON_RAYMINIGUN',
    [GetHashKey('WEAPON_GRENADE')] = 'WEAPON_GRENADE',
    [GetHashKey('WEAPON_BZGAS')] = 'WEAPON_BZGAS',
    [GetHashKey('WEAPON_MOLOTOV')] = 'WEAPON_MOLOTOV',
    [GetHashKey('WEAPON_STICKYBOMB')] = 'WEAPON_STICKYBOMB',
    [GetHashKey('WEAPON_PROXMINE')] = 'WEAPON_PROXMINE',
    [GetHashKey('WEAPON_SNOWBALL')] = 'WEAPON_SNOWBALL',
    [GetHashKey('WEAPON_PIPEBOMB')] = 'WEAPON_PIPEBOMB',
    [GetHashKey('WEAPON_BALL')] = 'WEAPON_BALL',
    [GetHashKey('WEAPON_SMOKEGRENADE')] = 'WEAPON_SMOKEGRENADE',
    [GetHashKey('WEAPON_FLARE')] = 'WEAPON_FLARE',
    [GetHashKey('WEAPON_PETROLCAN')] = 'WEAPON_PETROLCAN',
    [GetHashKey('WEAPON_PARACHUTE')] = 'WEAPON_PARACHUTE',
    [GetHashKey('WEAPON_FIREEXTINGUISHER')] = 'WEAPON_FIREEXTINGUISHER',
    [GetHashKey('WEAPON_HAZARDCAN')] = 'WEAPON_HAZARDCAN',
}

function base.giveWeapon(ped, weaponHash, ammoCount, toCurrent, weaponName) 
    GiveWeaponToPed(ped, weaponHash, ammoCount, false, toCurrent)
end 

function base.setAmmoByType(ped, ammoType, ammoCount, weaponName) 
    -- SetPedAmmoByType(ped, ammoType, ammoCount)
    SetPedAmmo(ped, GetHashKey(weaponName), ammoCount)
end 

function base.removeAllWeapons(ped) 
    RemoveAllPedWeapons(ped)
end 

function base.getWeaponName(hash)
    return weaponNames[hash] or 'UNDEFINED'
end 

function base.getVehicleName(model)
    return GetDisplayNameFromVehicleModel(model)
end 

function base.getPlayerName(source)
    local player = GetPlayerFromServerId(source)

    if player > -1 then 
        if not cache.names[source] then 
            cache.names[source] = GetPlayerName(player)
        end
        
        return cache.names[source]
    end 
end 

function base.createVehicle(model, coordinates, heading, isNetwork)
    if IsModelValid(model) then 
        while not HasModelLoaded(model) do 
            RequestModel(model)
            Wait(10)
        end 

	    return CreateVehicle(model, coordinates.x, coordinates.y, coordinates.z, heading, isNetwork, true)
    end 
end

function base.createObject(model, coordinates, isNetwork, netMissionEntity)
    if IsModelValid(model) then 
        while not HasModelLoaded(model) do 
            RequestModel(model)

            Citizen.Wait(0)
        end 

        return CreateObject(model, coordinates.x, coordinates.y, coordinates.z, isNetwork, netMissionEntity)
    end
end 

function base.deleteEntity(entity)
    if DoesEntityExist(entity) then 
        SetEntityAsNoLongerNeeded(entity)
        SetEntityAsMissionEntity(entity, true, true)

        if IsEntityAnObject(entity) then 
            DeleteObject(entity)
        elseif IsEntityAVehicle(entity) then 
            DeleteVehicle(entity)
        end 

        Citizen.CreateThread(function()
            while DoesEntityExist(entity) do 
                if IsEntityAnObject(entity) then 
                    DeleteObject(entity)
                elseif IsEntityAVehicle(entity) then 
                    DeleteVehicle(entity)
                end 

                Citizen.Wait(0)
            end 
        end)
    end
end 

function base.drawText3D(coordinates, text)
	local _,_x,_y = World3dToScreen2d(coordinates.x, coordinates.y, coordinates.z)

	SetTextFont(4)
	SetTextScale(0.40, 0.40)
	SetTextColour(255, 255, 255, 200)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)

	DrawText(_x, _y)
	DrawRect(_x, _y+0.0125, 0.01+(#text / 300), 0.03, 0, 0, 0, 80)
end

function base.getScaleform()
    PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
    ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)

    local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

    while not HasScaleformMovieLoaded(scaleform) do
        scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

        Citizen.Wait(0)
    end

    if HasScaleformMovieLoaded(scaleform) then
        Citizen.Wait(0)

        PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
        BeginTextComponent("STRING")
        AddTextComponentString("~r~você morreu")
        EndTextComponent()
        PopScaleformMovieFunctionVoid()

        Citizen.Wait(500)

        PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
    end

    return scaleform
end

function base.disableControls()
    local controls = {
        29,38,47,56,57,73,137,166,167,169,170,182,187,188,189,190,243,245,257,288,289,311,344
    }

    BlockWeaponWheelThisFrame()

    for _, control in ipairs(controls) do 
        DisableControlAction(0, control, true)
    end
end

function base.disableControlsInInventory()
    local controls = {
        37, 24, 25
    }

    BlockWeaponWheelThisFrame()
    DisablePlayerFiring(PlayerId(), true)

    for _, control in ipairs(controls) do 
        DisableControlAction(0, control)
    end
end

function base.openingChest(inProgress)
    local ped = PlayerPedId()
    local player = PlayerId()

    local dict = 'amb@prop_human_parking_meter@female@idle_a'
    local anim = 'idle_a_female'

    if inProgress then 
        SetPlayerSprint(player, false)
        
        if not IsEntityPlayingAnim(ped, dict, anim, 49) then 
            while not HasAnimDictLoaded(dict) do
                RequestAnimDict(dict)
                
                Citizen.Wait(10)
            end

			TaskPlayAnim(ped, 'amb@prop_human_parking_meter@female@idle_a', 'idle_a_female', 2.0, 2.0, -1, 49, 0, 0, 0, 0)
        end 
    else 
        ClearPedTasks(ped)
        ClearPedSecondaryTask(ped)
    end 
end

function base.drawMarker(...)
    DrawMarker(...)
end 

function base.addBlipForRadius(...)
    return AddBlipForRadius(...)
end 

function base.setMinimap()
    if not cache.minimap then 
        cache.minimap = true 

        Citizen.CreateThread( function()
            local minimap = RequestScaleformMovie("minimap")

            SetRadarBigmapEnabled(true, false)

            Citizen.Wait(0)

            SetRadarBigmapEnabled(false, false)

            cache.minimap = minimap 
        end)
    end 

    DisplayRadar(true)

    if type(cache.minimap) ~= 'boolean' then 
        BeginScaleformMovieMethod(cache.minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end 
end 

local bagFilter = 'player:'..GetPlayerServerId(PlayerId())

AddStateBagChangeHandler('inRoyale', bagFilter, function(bagName, key, value, reserved, replicated)
    if value == false then 
        Citizen.Wait(5000)
        
        local ped = PlayerPedId()

        local pedCoords = GetEntityCoords(ped)
        local pedHeading = GetEntityHeading(ped)
		local pedHealth = GetEntityHealth(ped)

        NetworkResurrectLocalPlayer(pedCoords.x, pedCoords.y, pedCoords.z, pedHeading, false, true) 
        SetEntityHealth(ped, pedHealth)
	end 
end)

RegisterNetEvent('royale:inRoyale', function(status)
end)
RegisterNetEvent('royale:onPlayerRevive', function(collected)
end)
RegisterNetEvent('royale:onPlayerDie', function(collected)
end)

return base 
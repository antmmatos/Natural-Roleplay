--░█████╗░██╗░░░░░██╗███████╗███╗░░██╗████████╗  ░█████╗░░█████╗░███╗░░██╗███████╗██╗░██████╗░
--██╔══██╗██║░░░░░██║██╔════╝████╗░██║╚══██╔══╝  ██╔══██╗██╔══██╗████╗░██║██╔════╝██║██╔════╝░
--██║░░╚═╝██║░░░░░██║█████╗░░██╔██╗██║░░░██║░░░  ██║░░╚═╝██║░░██║██╔██╗██║█████╗░░██║██║░░██╗░
--██║░░██╗██║░░░░░██║██╔══╝░░██║╚████║░░░██║░░░  ██║░░██╗██║░░██║██║╚████║██╔══╝░░██║██║░░╚██╗
--╚█████╔╝███████╗██║███████╗██║░╚███║░░░██║░░░  ╚█████╔╝╚█████╔╝██║░╚███║██║░░░░░██║╚██████╔╝
--░╚════╝░╚══════╝╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░  ░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝░╚═════╝░

local lib, anim = 'missminuteman_1ig_2' , 'handsup_base'
local canUseInventoryAndHotbar = true
local canHandsUp = true

AddEventHandler('canUseInventoryAndHotbar:toggle', function(parameter)
	canUseInventoryAndHotbar = parameter
end)

AddEventHandler('canHandsUp:toggle', function(parameter)
	canHandsUp = parameter
end)

RegisterCommand(Config.Commands["handsup"], function ()
    if Config.HandsUp then
        if not IsPedInAnyVehicle(PlayerPed, false) then
            RequestAnimDict(lib)
            while not HasAnimDictLoaded(lib) do
                Citizen.Wait(100)
            end
            if IsEntityPlayingAnim(PlayerPed, lib, anim, 3) then
                ClearPedSecondaryTask(PlayerPed)
            else
                if canHandsUp then
                    TaskPlayAnim(PlayerPed, lib, anim, 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
                end
            end
        end
	end
end)

RegisterKeyMapping(Config.Commands["openinventory"], 'OpenInventory', 'keyboard', Config.Keys['OpenInventory'])
RegisterKeyMapping(Config.Commands["handsup"], Config.HandsUpKeyMappingName, 'keyboard', Config.Keys['HandsUp'])
RegisterKeyMapping(Config.Commands["reloadweapon"], Config.ReloadMappingName, 'keyboard', Config.Keys['Reload'])

RegisterCommand(Config.Commands["openinventory"], function()
    if Config.Framework == 'ESX' then
        if IsPedDeadOrDying(PlayerPed, 1) then
            return
        end
    elseif Config.Framework == 'QBCore' then
        local data = QBCore.Functions.GetPlayerData()
        if data and data.metadata then 
            if data.metadata['isdead'] or data.metadata['inlaststand'] or data.metadata['ishandcuffed'] then 
                return
            end 
        end
    end
    Citizen.CreateThread(function()
        if IsInputDisabled(0) and not isCrafting and canUseInventoryAndHotbar then
            local garbage = nil
            local pCoords = PlayerPos
            local playerPed = PlayerPed
            local entity, entityDst = GetClosestObject(pCoords, Config.GarbageProps)
            local CurrentGarbage = {}
            if DoesEntityExist(entity) and entityDst <= 2 and not IsPedInAnyVehicle(PlayerPed) then
                local x, y, z = table.unpack(GetEntityCoords(entity))
                local _, floorZ = GetGroundZFor_3dCoord(x, y, z)
                garbage = getOwnerFromCoordsForGarbage(vector3(x, y, floorZ))
                CurrentGarbage.label = Lang("GARBAGE_LABEL")
                CurrentGarbage.items = Config.RandomGarbageItems
                CurrentGarbage.slots = 30
            end
            curVeh = nil
            if IsPedInAnyVehicle(PlayerPed) then
                local vehicle = GetVehiclePedIsIn(PlayerPed, false)
                CurrentGlovebox = all_trim(GetVehicleNumberPlateText(vehicle))
                curVeh = vehicle
                CurrentVehicle = nil
            else
                local vehicle
                if Config.Framework == 'ESX' then
                    vehicle = ESX.Game.GetClosestVehicle()
                elseif Config.Framework == 'QBCore' then
                    vehicle = QBCore.Functions.GetClosestVehicle()
                end
                if vehicle ~= 0 and vehicle ~= nil then
                    local pos = PlayerPos
                    local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -2.5, 0)
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, 2.5, 0)
                    end
                    if (GetDistanceBetweenCoords(pos.x, pos.y, pos.z, trunkpos) < 2.0) and not IsPedInAnyVehicle(PlayerPed) then
                        if GetVehicleDoorLockStatus(vehicle) < 2 then
                            CurrentVehicle = all_trim(GetVehicleNumberPlateText(vehicle))
                            curVeh = vehicle
                            CurrentGlovebox = nil
                        else
                            SendTextMessage(Lang("VEHICLE_LOCKED"), 'error')
                            CurrentVehicle = nil
                            curVeh = nil
                            CurrentGlovebox = nil
                        end
                    else
                        CurrentVehicle = nil
                    end
                else
                    CurrentVehicle = nil
                end
            end

            if CurrentVehicle then -- Trunk
                local maxweight = CheckWeight(curVeh)
                local other = {
                    maxweight = maxweight.weight,
                    slots = maxweight.slots, --- change this to your preffered slot space
                }
                TriggerServerEvent("inventory:server:OpenInventory", "trunk", CurrentVehicle, other)
                RemoveAllPedWeapons(playerPed, true)
                OpenTrunk() -- stop right here
            elseif CurrentGlovebox ~= nil then
                TriggerServerEvent("inventory:server:OpenInventory", "glovebox", CurrentGlovebox)
                RemoveAllPedWeapons(playerPed, true)
            elseif CurrentDrop ~= 0 and not IsPedInAnyVehicle(PlayerPed) then
                if Config.OpenAnimation then
                    TriggerEvent('randPickupAnim')
                end
                TriggerServerEvent("inventory:server:OpenInventory", "drop", CurrentDrop)
            elseif garbage ~= nil and not IsPedInAnyVehicle(PlayerPed) then
                TriggerServerEvent("inventory:server:OpenInventory", 'garbage', garbage, CurrentGarbage) 
                RemoveAllPedWeapons(playerPed, true)
                OpenGarbage()
            else
                if Config.OpenAnimation then TriggerEvent('randPickupAnim') end
                TriggerServerEvent("inventory:server:OpenInventory")
            end
        end
    end)
end)

function all_trim(s)
    return s:match( "^%s*(.-)%s*$" )
 end

function OpenGarbageTarget()
    local garbage = nil
    local pCoords = PlayerPos
    local entity, entityDst = GetClosestObject(pCoords, Config.GarbageProps)
    local CurrentGarbage = {}
    local x, y, z = table.unpack(GetEntityCoords(entity))
    local _, floorZ = GetGroundZFor_3dCoord(x, y, z)
    garbage = getOwnerFromCoordsForGarbage(vector3(x, y, floorZ))
    CurrentGarbage.label = Lang("GARBAGE_LABEL")
    CurrentGarbage.items = Config.RandomGarbageItems
    CurrentGarbage.slots = 30

    TriggerServerEvent("inventory:server:OpenInventory", 'garbage', garbage, CurrentGarbage)
end

RegisterKeyMapping('+' .. Config.Commands["openhotbar"], 'OpenHotBar', 'keyboard', Config.Keys['OpenHotBar'])

local openHotBar = false
RegisterCommand('+' .. Config.Commands["openhotbar"], function()
    if canUseInventoryAndHotbar then
        ToggleHotbar(true)
    end
end)

RegisterCommand('-'.. Config.Commands["openhotbar"], function()
    ToggleHotbar(false)
end, false)

-- Function in Steal button
AddEventHandler('inventory:client:search', function()
    if Config.Framework == 'ESX' then
        local player, distance = ESX.Game.GetClosestPlayer()
        if player ~= -1 and distance < 3.0 then
            local playerId = GetPlayerServerId(player)
            local searchPlayerPed = GetPlayerPed(player)
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if DoesEntityExist(searchPlayerPed) and (IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) or IsEntityDeadCheck(searchPlayerPed)) then
                loadanimdict('combat@aim_variations@arrest')
                TaskPlayAnim(PlayerPed, 'combat@aim_variations@arrest', 'cop_med_arrest_01', 8.0, -8,3750, 2, 0, 0, 0, 0)
                exports['progressbar']:Progress({
                    name = "robbing",
                    duration = 5000,
                    label = 'Robbing...',
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                }, function(cancelled)
                    if not cancelled then
                        TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
                    else
                        SendTextMessage(Lang("STOP_ROBBERY"))
                    end
                end)
                Citizen.Wait(5000)
                ClearPedTasks(PlayerPed)
                ClearPedSecondaryTask(PlayerPed)
            else
                SendTextMessage(Lang("PLAYER_SEARCH"))
            end
        else
            SendTextMessage(Lang("NO_PLAYERS"))
        end
    elseif Config.Framework == 'QBCore' then
        local pCoords = PlayerPos
        local player, distance = QBCore.Functions.GetClosestPlayer(pCoords)
        if player ~= -1 and distance < 3.0 then
            local playerId = GetPlayerServerId(player)
            local searchPlayerPed = GetPlayerPed(player)
            local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer(pCoords)
            if DoesEntityExist(searchPlayerPed) and (IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) or IsEntityDeadCheck(searchPlayerPed)) then
                loadanimdict('combat@aim_variations@arrest')
                TaskPlayAnim(PlayerPed, 'combat@aim_variations@arrest', 'cop_med_arrest_01', 8.0, -8,3750, 2, 0, 0, 0, 0)
                exports['progressbar']:Progress({
                    name = "robbing",
                    duration = 5000,
                    label = 'Robbing',
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                }, function(cancelled)
                    if not cancelled then
                        TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", playerId)
                    else
                        SendTextMessage(Lang("STOP_ROBBERY"))
                    end
                end)
                Citizen.Wait(5000)
                ClearPedTasks(PlayerPed)
                ClearPedSecondaryTask(PlayerPed)
            else
                SendTextMessage(Lang("PLAYER_SEARCH"))
            end
        else
            SendTextMessage(Lang("NO_PLAYERS"))
        end
    end
end)

AddEventHandler("inventory:client:OpenInventory", function(PlayerAmmo, inventory, other)
    local pCoords = PlayerPos

    if Config.Framework == 'ESX' then
        if IsPedDeadOrDying(PlayerPed, 1) then
            return
        end
        ToggleHotbar(false)
        SetNuiFocus(true, true)
        if other and other.id then
            local target = tonumber(other.id)
            local playerTarget = GetPlayerFromServerId(target)
            local pedTarget = GetPlayerPed(playerTarget)
            if other ~= nil then
                currentOtherInventory = other.name     
            end
            if target and DoesEntityExist(pedTarget) then
                local pos = GetEntityCoords(playerPed)
                local targetPos = GetEntityCoords(pedTarget)
                local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z, true)
                if distance < 3.0 then
                    inInventory = true
                    StealingPed = pedTarget
                    TriggerEvent('inventory:client:RobPlayer', target)
                end
            end
        else
            local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
            if closestPlayer and closestPlayer ~= -1 and closestDistance < 3.0 then
                local playerId = GetPlayerServerId(closestPlayer)
                local searchPlayerPed = GetPlayerPed(closestPlayer)
                if searchPlayerPed and searchPlayerPed ~= 0 then
                    if DoesEntityExist(searchPlayerPed) and (IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) or IsEntityDeadCheck(searchPlayerPed)) then
                        inInventory = true
                        StealingPed = searchPlayerPed
                        TriggerEvent('inventory:client:RobPlayer', playerId)
                    end
                end
            end
        end

        pid = GetPlayerServerId(PlayerId())
        data = ESX.GetPlayerData()
        job = data.job.label
        ranklabel = data.job.grade_label
        money, bank, blackmoney, vip = 0, 0, 0, 0
        
        for i = 1, #data.accounts do 
            if data.accounts[i].name == 'money' then 
                money = data.accounts[i].money
            elseif data.accounts[i].name == 'bank' then
                bank = data.accounts[i].money
            elseif data.accounts[i].name == 'black_money' then
                blackmoney = data.accounts[i].money
            end
        end

        SendNUIMessage({
            action = "open",
            inventory = inventory,
            slots = Config.MaxInventorySlots - 1,
            other = other,
            maxweight = Config.MaxWeight,
            Ammo = PlayerAmmo,
            DropMaxWeight = Config.DropMaxWeight,

            playerhp = GetEntityHealth(PlayerPed),
            playerarmor = GetPedArmour(PlayerPed),
            playerhunger = hunger,
            playerthirst = thirst,

            playerId = GetPlayerServerId(PlayerId()),
            playerJob = ESX.GetPlayerData().job.label,
            playerMoney = money,
            playerBank = bank,
            playerBlackMoney = blackmoney,

            playerName = GetPlayerName(PlayerId()),
            notStolenItems = Config.notStolenItems,
            notStoredStashItems = Config.notStoredStashItems,
            qs = QS.Shared.Items,

            availableHud = Config.InventoryHud,
            InventoryPlayerName = Config.InventoryPlayerName,
            
            availableplayerhp = Config.InventoryBoxes.playerhp,
            availableplayerarmor = Config.InventoryBoxes.playerarmor,
            availableplayerhunger = Config.InventoryBoxes.playerhunger,
            availableplayerthirst = Config.InventoryBoxes.playerthirst,

            availableplayerid = Config.InventoryBoxes.playerid,
            availableplayermoney = Config.InventoryBoxes.playermoney,
            availableplayerbank = Config.InventoryBoxes.playerbank,
            availableblackmoney = Config.InventoryBoxes.playerblackmoney,
        })

        if Config.ToggleHud then
            ToggleHudFalse(toggle)
        end
        if Config.HideMinimap then
            DisplayRadar(false)
        end
    elseif Config.Framework == 'QBCore' then
        local data = QBCore.Functions.GetPlayerData()
        if data and data.metadata['isdead'] or data.metadata['inlaststand'] or data.metadata['ishandcuffed'] then 
            return 
        end
        ToggleHotbar(false)
        SetNuiFocus(true, true)
        if other and other.id then
            local target = tonumber(other.id)
            local playerTarget = GetPlayerFromServerId(target)
            local pedTarget = GetPlayerPed(playerTarget)
            if other ~= nil then
                currentOtherInventory = other.name     
            end
            if target and DoesEntityExist(pedTarget) then
                local pos = GetEntityCoords(PlayerPed)
                local targetPos = GetEntityCoords(pedTarget)
                local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, targetPos.x, targetPos.y, targetPos.z, true)
                if distance < 3.0 then
                    StealingPed = pedTarget
                    TriggerEvent('inventory:client:RobPlayer', target)
                end
            end
        else
            local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer(pCoords)
            if closestPlayer and closestPlayer ~= -1 and closestDistance < 3.0 then
                local playerId = GetPlayerServerId(closestPlayer)
                local searchPlayerPed = GetPlayerPed(closestPlayer)
                if searchPlayerPed and searchPlayerPed ~= 0 then 
                    if DoesEntityExist(searchPlayerPed) and (IsEntityPlayingAnim(searchPlayerPed, lib, anim, 3) or IsEntityDeadCheck(searchPlayerPed)) then
                        StealingPed = pedTarget
                        TriggerEvent('inventory:client:RobPlayer', playerId)
                    end
                end
            end
        end

        local PlayerData = QBCore.Functions.GetPlayerData()
        SendNUIMessage({
            action = "open",
            inventory = inventory,
            slots = Config.MaxInventorySlots - 1,
            other = other,
            maxweight = Config.MaxWeight,
            Ammo = PlayerAmmo,

            playerhp = GetEntityHealth(PlayerPed),
            playerarmor = GetPedArmour(PlayerPed),
            playerhunger = PlayerData.metadata['hunger'], 
            playerthirst = PlayerData.metadata['thirst'],

            playerId = GetPlayerServerId(PlayerId()),
            playerJob = QBCore.Functions.GetPlayerData().job.label,
            playerMoney = PlayerData.money['cash'],
            playerBank = PlayerData.money['bank'],
            playerBlackMoney = PlayerData.money['crypto'],

            playerName = GetPlayerName(PlayerId()),
            notStolenItems = Config.notStolenItems,
            notStoredStashItems = Config.notStoredStashItems,
            qs = QBCore.Shared.Items,

            availableHud = Config.InventoryHud,
            InventoryPlayerName = Config.InventoryPlayerName,
            
            availableplayerhp = Config.InventoryBoxes.playerhp,
            availableplayerarmor = Config.InventoryBoxes.playerarmor,
            availableplayerhunger = Config.InventoryBoxes.playerhunger,
            availableplayerthirst = Config.InventoryBoxes.playerthirst,

            availableplayerid = Config.InventoryBoxes.playerid,
            availableplayermoney = Config.InventoryBoxes.playermoney,
            availableplayerbank = Config.InventoryBoxes.playerbank,
            availableblackmoney = Config.InventoryBoxes.playerblackmoney,
        })
        inInventory = true
        if Config.ToggleHud then
            ToggleHudFalse(toggle)
        end
        if Config.HideMinimap then
            DisplayRadar(false)
        end
    end
end)

function IsEntityDeadCheck(pedX)
    local ped = pedX
    if Config.EnableSearchOtherPlayersInventoryDead then 
        if Config.Framework == 'ESX' then
            if IsPedDeadOrDying(ped, 1) then
                return true
            else 
                return false
            end
        elseif Config.Framework == 'QBCore' then
            if IsPedDeadOrDying(ped, 1) then 
                return true
            else 
                local isDead = nil
                local player = NetworkGetPlayerIndexFromPed(ped)
                if player and player ~= -1 then
                    local serverId = GetPlayerServerId(player)
                    if serverId then
                        QBCore.Functions.TriggerCallback('QBCore:CheckIfTargetItsDead', function(result)
                            isDead = result
                        end, serverId)
                        while isDead == nil do Wait(10) end
                        return isDead
                    else 
                        return false
                    end
                else 
                    return false
                end
            end
        end
    else 
        return false
    end
end 

Citizen.CreateThread(function()
    local initialPosition = nil
	while true do
		Wait(100)
        if inInventory then
            if not canUseInventoryAndHotbar then 
                SendNUIMessage({action = "close"})
            else 
                local ped = PlayerPed
                if CurrentGlovebox then -- Glovebox
                    if not IsPedInAnyVehicle(ped) then
                        SendNUIMessage({action = "close"})
                    end
                    initialPosition = nil
                elseif CurrentStash ~= nil then -- Stash
                    if initialPosition == nil then 
                        initialPosition = GetEntityCoords(ped)
                    else
                        local tempPosition = GetEntityCoords(ped)
                        if (GetDistanceBetweenCoords(initialPosition.x, initialPosition.y, initialPosition.z, tempPosition.x, tempPosition.y, tempPosition.z, true) > 2.5) then
                            SendNUIMessage({action = "close"})
                            initialPosition = nil
                        end
                    end
                elseif CurrentVehicle ~= nil then -- Trunk
                    local tempPosition = GetEntityCoords(ped)
                    local vehPosition = GetEntityCoords(curVeh)
                    if not DoesEntityExist(curVeh) or GetDistanceBetweenCoords(vehPosition.x, vehPosition.y, vehPosition.z, tempPosition.x, tempPosition.y, tempPosition.z, true) > 10.0 then 
                        SendNUIMessage({action = "close"})
                    end
                elseif CurrentDrop ~= 0 then
                    if initialPosition == nil then 
                        initialPosition = GetEntityCoords(ped)
                    else
                        local tempPosition = GetEntityCoords(ped)
                        if (GetDistanceBetweenCoords(initialPosition.x, initialPosition.y, initialPosition.z, tempPosition.x, tempPosition.y, tempPosition.z, true) > 4.0) or IsPedInAnyVehicle(ped) then
                            SendNUIMessage({action = "close"})
                            initialPosition = nil
                        end
                    end
                elseif StealingPed then -- Stealing player
                    if DoesEntityExist(StealingPed) then
                        local tempPosition = GetEntityCoords(ped)
                        local targetPosition = GetEntityCoords(StealingPed)
                        if (GetDistanceBetweenCoords(tempPosition.x, tempPosition.y, tempPosition.z, targetPosition.x, targetPosition.y, targetPosition.z, true) > 3.5) or IsPedInAnyVehicle(ped) then
                            SendNUIMessage({action = "close"})
                        end
                    else
                        SendNUIMessage({action = "close"})
                    end
                else -- Others
                    if IsPedInAnyVehicle(ped) then 
                        SendNUIMessage({action = "close"})
                    end
                    initialPosition = nil
                end
            end
        else
            Citizen.Wait(1000)
            initialPosition = nil
        end
    end
end)

RegisterNetEvent("inventory:giveitemtoplayer:animation") -- Animation when you give an item to a player
AddEventHandler("inventory:giveitemtoplayer:animation", function()
    loadAnimDict('mp_common')
    TaskPlayAnim(PlayerPed,'mp_common', 'givetake1_a',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Wait(1000)
    ClearPedSecondaryTask(PlayerPed)
end)

if Config.Framework == 'ESX' then
    Citizen.CreateThread(function()
        while true do
            Wait(1000)
            local ped = PlayerPed
            if IsPedDeadOrDying(ped, 1) then
                if inInventory then 
                    SendNUIMessage({
                        action = "close",
                    })
                end
            end
        end
    end)
elseif Config.Framework == 'QBCore' then
    Citizen.CreateThread(function()
        while not QBCore do Wait(100) end
        while true do
            Wait(1000)
            local data = QBCore.Functions.GetPlayerData()
            if data and data.metadata then 
                if data.metadata['isdead'] or data.metadata['inlaststand'] or data.metadata['ishandcuffed'] then 
                    if inInventory then 
                        SendNUIMessage({
                            action = "close",
                        })
                    end
                end
            end
        end
    end)
end

function CheckWeight(curVeh)
    local vehicleClass = GetVehicleClass(curVeh)
    local vehModel = GetEntityModel(curVeh)

    for k,v in pairs(Config.TrunkWeightVehicles) do
        if vehModel == GetHashKey(k) then
            maxweight = v
            local datavehWeightCalc = {
                weight = maxweight,
                slots = Config.TrunkWeight[vehicleClass].slots
            }
            return datavehWeightCalc
        end
    end

    local datavehWeightCalc = {
        weight = Config.TrunkWeight[vehicleClass].MaxWeight,
        slots = Config.TrunkWeight[vehicleClass].slots

    }
    return datavehWeightCalc
end

RegisterNetEvent("inventory:client:UseWeapon")
AddEventHandler("inventory:client:UseWeapon", function(weaponData, shootbool)
    if not Config.WeaponsOnVehicle and IsPedInAnyVehicle(PlayerPed, false) then
        DebugPrint('Local player is in a vehicle, you cant use weapons here...')
        return false
    end
    local weaponName = tostring(weaponData.name)
    local _,currentWeaponLocal = GetCurrentPedWeapon(PlayerPed)
    if currentWeapon == weaponName and currentWeaponLocal ~= GetHashKey("WEAPON_UNARMED") then
        SetCurrentPedWeapon(PlayerPed, GetHashKey("WEAPON_UNARMED"), true)
        RemoveAllPedWeapons(PlayerPed, true)
        TriggerEvent('weapons:client:SetCurrentWeapon', nil, shootbool)
        currentWeapon = nil
    elseif Config.Bombs[GetHashKey(weaponName)] then
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        local ammo = tonumber(weaponData.info.ammo)
        if ammo == 0 or ammo == nil then
            ammo = Config.BombsAmount[GetHashKey(weaponName)] or 1
        else 
            ammo = ammo
        end
        GiveWeaponToPed(PlayerPed, GetHashKey(weaponName), ammo, false, false)
        SetPedAmmo(PlayerPed, GetHashKey(weaponName), ammo)
        SetCurrentPedWeapon(PlayerPed, GetHashKey(weaponName), true)
        currentWeapon = weaponName
    elseif weaponName == weaponName == "weapon_shoe" then
        GiveWeaponToPed(ped, GetHashKey(weaponName), 1, false, false)
        SetPedAmmo(ped, GetHashKey(weaponName), 1)
        SetCurrentPedWeapon(ped, GetHashKey(weaponName), true)
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        currentWeapon = weaponName
    else
        TriggerEvent('weapons:client:SetCurrentWeapon', weaponData, shootbool)
        local ammo = tonumber(weaponData.info.ammo)
        if weaponName == 'weapon_petrolcan' or weaponName == 'weapon_fireextinguisher' then 
            if ammo == 0 or ammo == nil then
                ammo = 4000
            end
        end
        GiveWeaponToPed(PlayerPed, GetHashKey(weaponName), ammo, false, false)
        SetPedAmmo(PlayerPed, GetHashKey(weaponName), ammo)
        SetCurrentPedWeapon(PlayerPed, GetHashKey(weaponName), true)
        if weaponData.info.attachments ~= nil then				
            for _, attachment in pairs(weaponData.info.attachments) do
                if attachment.component == "weaponcolor1" 
                or attachment.component == "weaponcolor2" 
                or attachment.component == "weaponcolor3" 
                or attachment.component == "weaponcolor4" 
                or attachment.component == "weaponcolor5" 
                or attachment.component == "weaponcolor6" 
                or attachment.component == "weaponcolor7" 
                or attachment.component == "weaponcolor1" 
                or attachment.component == "weaponcolor2" 
                or attachment.component == "weaponcolor3" 
                or attachment.component == "weaponcolor4" 
                or attachment.component == "weaponcolor5" 
                or attachment.component == "weaponcolor6" 
                or attachment.component == "weaponcolor7" 
                or attachment.component == "weaponcolor8" 
                or attachment.component == "weaponcolor9" 
                or attachment.component == "weaponcolor10" 
                or attachment.component == "weaponcolor11" 
                or attachment.component == "weaponcolor12" 
                or attachment.component == "weaponcolor13" 
                or attachment.component == "weaponcolor14" 
                or attachment.component == "weaponcolor15" 
                or attachment.component == "weaponcolor16" 
                or attachment.component == "weaponcolor17" 
                or attachment.component == "weaponcolor18" 
                or attachment.component == "weaponcolor19" 
                or attachment.component == "weaponcolor20" 
                or attachment.component == "weaponcolor21" 
                or attachment.component == "weaponcolor22" 
                or attachment.component == "weaponcolor23" 
                or attachment.component == "weaponcolor24" 
                or attachment.component == "weaponcolor25" 
                or attachment.component == "weaponcolor26" 
                or attachment.component == "weaponcolor27" 
                or attachment.component == "weaponcolor28" 
                or attachment.component == "weaponcolor29" 
                or attachment.component == "weaponcolor30" 
                or attachment.component == "weaponcolor31" then
                    local colorid = GetAttachmentColorNoText(attachment.component)
                    SetPedWeaponTintIndex(PlayerPed, GetHashKey(weaponName), tonumber(colorid))
                elseif attachment.component == "weapontinturlattach" then
                    Citizen.Wait(300)
                    for i = 1, #Config.WeaponTints do
                        if tostring(GetHashKey(weaponName)) == Config.WeaponTints[i].hash then
                            txd = CreateRuntimeTxd(Config.WeaponTints[i].name)
                            duiObj = CreateDui(tostring(attachment.urltint), 250, 250)
                            dui = GetDuiHandle(duiObj)
                            tx = CreateRuntimeTextureFromDuiHandle(txd, "skin", dui)
                            AddReplaceTexture(Config.WeaponTints[i].ytd, Config.WeaponTints[i].texture, Config.WeaponTints[i].name, "skin")
                            break
                        end
                    end							
                else					
                    GiveWeaponComponentToPed(PlayerPed, GetHashKey(weaponName), GetHashKey(attachment.component))
                end
            end
        end
        currentWeapon = weaponName
    end
end)

-- Custom stash event test
--[[ local sleep = 250
Citizen.CreateThread(function ()
    while true do
        Wait(sleep)
        perform = true
        local player = PlayerPed
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, 442.6626, -1365.8806, 43.5543, true)
        if dst <= 5 then
            perform = false
            DrawText3Ds(442.6626, -1365.8806, 43.5543, "[E] - Crafing", 0.40)
            if IsControlJustReleased(0, 38) and dst <= 2 then
                OpenCrafting()
            end

            if perform then
                sleep = 250
            elseif not perform then
                sleep = 7
            end
        end
    end
end)

function OpenCrafting()
    local CustomCrafting = {
        [1] = {
            name = "weapon_carbinerifle",
            amount = 1,
            info = {},
            costs = {
                ["tosti"] = 1,
            },
            type = "weapon",
            slot = 1,
            threshold = 0,
            points = 1,
            time = 5000,
        },
        [2] = {
            name = "tosti",
            amount = 1,
            info = {},
            costs = {
                ["weapon_carbinerifle"] = 1,
            },
            type = "item",
            slot = 2,
            threshold = 0,
            points = 1,
            time = 5000,
        },
    }

    local crafting = {
        label = 'Craft',
        items = exports['qs-inventory']:SetUpCrafing(CustomCrafting)
    }
    TriggerServerEvent('inventory:server:SetInventoryItems', CustomCrafting)
    TriggerServerEvent("inventory:server:OpenInventory", "customcrafting", crafting.label, crafting)
end  ]]

-- Only for clientside (not safe)
--[[ RegisterCommand('additem', function ()
    TriggerServerEvent('inventory:server:addClientItem', 'tosti', 4)
end) ]]

--[[ RegisterCommand('removeitem', function ()
    TriggerServerEvent('inventory:server:removeClientItem', 'tosti', 1)
end) ]]
hunger               = 0
thirst               = 0
stress               = 0
voice                = 2
talkingRadio         = false
local vehicle        = nil
local numgears       = nil
local topspeedGTA    = nil
local topspeedms     = nil
local acc            = nil
local hash           = nil
local selectedgear   = 0
local hbrake         = nil
local currspeedlimit = nil
local ready          = false

Config               = {}

Config.gears         = {
    [1] = { 0.90 },                                                --1
    [2] = { 3.33, 0.90 },                                          --2
    [3] = { 3.33, 1.57, 0.90 },                                    --3
    [4] = { 3.33, 1.83, 1.22, 0.90 },                              --4
    [5] = { 3.33, 1.92, 1.36, 1.05, 0.90 },                        --5
    [6] = { 3.33, 1.95, 1.39, 1.09, 0.95, 0.90 },                  --6
    [7] = { 4.00, 2.34, 1.67, 1.31, 1.14, 1.08, 0.90 },            --7
    [8] = { 5.31, 3.11, 2.22, 1.74, 1.51, 1.43, 1.20, 0.90 },      --8
    [9] = { 7.70, 4.51, 3.22, 2.52, 2.20, 2.08, 1.73, 1.31, 0.90 } --9
}

Config.vehicles      = {
    [GetHashKey('')] = true
}

AddEventHandler("pma-voice:radioActive", function(radioTalking) talkingRadio = radioTalking end)

RegisterNetEvent("pma-voice:setTalkingMode")
AddEventHandler("pma-voice:setTalkingMode", function(mode)
    voice = mode
end)

RegisterNetEvent("esx_status:onTick")
AddEventHandler("esx_status:onTick", function()
    TriggerEvent("esx_status:getStatus", 'hunger', function(status)
        hunger = status.val / 10000
    end)
    TriggerEvent("esx_status:getStatus", 'thirst', function(status)
        thirst = status.val / 10000
    end)
    TriggerEvent("esx_status:getStatus", 'stress', function(status)
        stress = status.val / 10000
    end)
end)

Citizen.CreateThread(function()
    local ped
    while true do
        ped = PlayerPedId()
        SendNUIMessage({
            setHud = true,
            health = (GetEntityHealth(ped) - 100),
            armour = GetPedArmour(ped),
            hunger = hunger,
            thirst = thirst,
            stress = stress,
            stamina = (100 - GetPlayerSprintStaminaRemaining(PlayerId())),
            voice = voice,
            radioOn = LocalPlayer.state.radioChannel,
            isTalking = NetworkIsPlayerTalking(PlayerId()),
            talkingRadio = talkingRadio
        })
        Citizen.Wait(300)
    end
end)

Citizen.CreateThread(function()
    local ped
    local vehicle
    DisplayRadar(false)
    while true do
        ped = PlayerPedId()
        vehicle = GetVehiclePedIsIn(ped, false)
        if vehicle and (GetPedInVehicleSeat(vehicle, -1) == ped or GetPedInVehicleSeat(vehicle, 0) == ped) then
            carRPM                    = GetVehicleCurrentRpm(vehicle)
            carSpeed                  = GetEntitySpeed(vehicle)
            carGear                   = GetVehicleCurrentGear(vehicle)
            carIL                     = GetVehicleIndicatorLights(vehicle)
            carLS_r, carLS_o, carLS_h = GetVehicleLightsState(vehicle)

            SendNUIMessage({
                ShowHud             = true,
                CurrentCarRPM       = carRPM,
                CurrentCarGear      = Config.vehicles[hash] and getinfo(selectedgear) or carGear,
                CurrentCarSpeed     = carSpeed,
                CurrentCarKmh       = math.ceil(carSpeed * 3.6),
                CurrentCarIL        = carIL,
                CurrentCarLS_r      = carLS_r,
                CurrentCarLS_o      = carLS_o,
                CurrentCarLS_h      = carLS_h,
                CurrentCarHandbrake = GetVehicleHandbrake(vehicle),
                CurrentCarBrake     = (GetVehicleWheelSpeed(vehicle, 0) == 0.0) and (carSpeed > 0.0),
                PlayerID            = GetPlayerServerId(GetPlayerIndex()),
                CurrentCarFuel      = GetVehicleFuelLevel(vehicle)
            })
            DisplayRadar(true)
        else
            DisplayRadar(false)
            SendNUIMessage({ HideHud = true })
            Citizen.Wait(2000)
        end
        Citizen.Wait(50)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if hash and Config.vehicles[hash] ~= nil then
            local ped = PlayerPedId()
            local newveh = GetVehiclePedIsIn(ped, false)
            local class = GetVehicleClass(newveh)

            if newveh == vehicle then

            elseif newveh == 0 and vehicle ~= nil then
                resetvehicle()
            else
                if GetPedInVehicleSeat(newveh, -1) == ped then
                    if class ~= 13 and class ~= 14 and class ~= 15 and class ~= 16 and class ~= 21 then
                        vehicle = newveh
                        hash = GetEntityModel(newveh)


                        if GetVehicleMod(vehicle, 13) < 0 then
                            numgears = GetVehicleHandlingInt(newveh, "CHandlingData", "nInitialDriveGears")
                        else
                            numgears = GetVehicleHandlingInt(newveh, "CHandlingData", "nInitialDriveGears") + 1
                        end



                        hbrake = GetVehicleHandlingFloat(newveh, "CHandlingData", "fHandBrakeForce")

                        topspeedGTA = GetVehicleHandlingFloat(newveh, "CHandlingData", "fInitialDriveMaxFlatVel")
                        topspeedms = (topspeedGTA * 1.32) / 3.6

                        acc = GetVehicleHandlingFloat(newveh, "CHandlingData", "fInitialDriveForce")
                        selectedgear = 0
                        Citizen.Wait(50)
                        ready = true
                    end
                end
            end
        else
            Citizen.Wait(1500)
        end
    end
end)

function resetvehicle()
    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", acc)
    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", topspeedGTA)
    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
    SetVehicleHighGear(vehicle, numgears)
    ModifyVehicleTopSpeed(vehicle, 1)
    SetVehicleHandbrake(vehicle, false)

    vehicle = nil
    numgears = nil
    topspeedGTA = nil
    topspeedms = nil
    acc = nil
    hash = nil
    hbrake = nil
    selectedgear = 0
    currspeedlimit = nil
    ready = false
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if hash and Config.vehicles[hash] ~= nil then
            DisableControlAction(0, 80, true)
            DisableControlAction(0, 21, true)
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if vehicle ~= nil then
            if hash and Config.vehicles[hash] ~= nil then
                if ready == true then
                    if IsDisabledControlJustPressed(0, 21) then
                        if selectedgear <= numgears - 1 then
                            DisableControlAction(0, 71, true)
                            Wait(300)
                            selectedgear = selectedgear + 1
                            DisableControlAction(0, 71, false)
                            SimulateGears()
                        end
                    elseif IsDisabledControlJustPressed(0, 80) then
                        if selectedgear > -1 then
                            DisableControlAction(0, 71, true)
                            Wait(300)
                            selectedgear = selectedgear - 1
                            DisableControlAction(0, 71, false)
                            SimulateGears()
                        end
                    end
                end
            else
                Citizen.Wait(1000)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

function SimulateGears()
    local engineup = GetVehicleMod(vehicle, 11)

    if selectedgear > 0 then
        local ratio
        if hash and Config.vehicles[hash] ~= nil then
            if selectedgear ~= 0 and selectedgear ~= nil then
                if numgears ~= nil and selectedgear ~= nil then
                    ratio = Config.gears[numgears][selectedgear] * (1 / 0.9)
                else

                end
            end
            if ratio ~= nil then
                SetVehicleHighGear(vehicle, 1)
                newacc = ratio * acc
                newtopspeedGTA = topspeedGTA / ratio
                newtopspeedms = topspeedms / ratio
                SetVehicleHandbrake(vehicle, false)
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", newacc)
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", newtopspeedGTA)
                SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                ModifyVehicleTopSpeed(vehicle, 1)
                currspeedlimit = newtopspeedms
            end
        else
            Citizen.Wait(1000)
        end
    elseif selectedgear == -1 then
        SetVehicleHandbrake(vehicle, false)
        SetVehicleHighGear(vehicle, numgears)
        SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveForce", acc)
        SetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel", topspeedGTA)
        SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
        ModifyVehicleTopSpeed(vehicle, 1)
    end
    SetVehicleMod(vehicle, 11, engineup, false)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if hash and Config.vehicles[hash] ~= nil then
            if selectedgear == -1 then
                if GetVehicleCurrentGear(vehicle) == 1 then
                    DisableControlAction(0, 71, true)
                end
            elseif selectedgear > 0 then
                if GetEntitySpeedVector(vehicle, true).y < 0.0 then
                    DisableControlAction(0, 72, true)
                end
            elseif selectedgear == 0 then
                SetVehicleHandbrake(vehicle, true)
                if IsControlPressed(0, 76) == false then
                    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", 0.0)
                else
                    SetVehicleHandlingFloat(vehicle, "CHandlingData", "fHandBrakeForce", hbrake)
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

local disable = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if hash and Config.vehicles[hash] ~= nil then
            if selectedgear > 1 then
                if IsControlPressed(0, 71) then
                    local speed = GetEntitySpeed(vehicle)
                    local minspeed = currspeedlimit / 7

                    if speed < minspeed then
                        if GetVehicleCurrentRpm(vehicle) < 0.4 then
                            disable = true
                        end
                    end
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if hash and Config.vehicles[hash] ~= nil then
            if disable == true then
                SetVehicleEngineOn(vehicle, false, true, false)
                Citizen.Wait(1000)

                disable = false
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if hash and Config.vehicles[hash] then
            local speed = GetEntitySpeed(vehicle)

            if currspeedlimit ~= nil then
                if speed >= currspeedlimit then
                    SetVehicleCheatPowerIncrease(vehicle, 0.0)
                end
            else
                if speed >= topspeedms then
                    SetVehicleCheatPowerIncrease(vehicle, 0.0)
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

function getinfo(gea)
    if gea == 0 then
        return "N"
    elseif gea == -1 then
        return "R"
    else
        return gea
    end
end
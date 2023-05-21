local start = false
local isWorking = false

local coords = {
    x = -424.6323,
    y = -1685.6693,
    z = 19.0291
}

local doors = {
    "door_dside_f",
    "door_pside_f",
    "door_dside_r",
    "door_pside_r"
}

local wheels = {
    "wheel_lf",
    "wheel_lr",
    "wheel_rf",
    "wheel_rr"
}

local other = {
    "bonnet",
    "boot"
}

local SkillbarOBJ = nil

Citizen.CreateThread(function()
    while not GetSkillbarObject do
        Citizen.Wait(100)
    end
    while not SkillbarOBJ do
        SkillbarOBJ = GetSkillbarObject()
        Citizen.Wait(100)
    end
    local ped
    local vehicle
    local sleep = 0
    local shown = false
    local pedPos
    while true do
        sleep = 5
        ped = PlayerPedId()
        vehicle = GetVehiclePedIsIn(ped, false)
        if vehicle ~= 0 and not start then
            pedPos = GetEntityCoords(ped)
            if Vdist(pedPos.x, pedPos.y, pedPos.z, coords.x, coords.y, coords.z) < 15.0 then
                DrawMarker(27, coords.x, coords.y, coords.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 255,
                    0, 0, 0, 0)
                if Vdist(pedPos.x, pedPos.y, pedPos.z, coords.x, coords.y, coords.z) < 3.0 then
                    if not shown then
                        shown = true
                        exports["okokTextUI"]:Open("Pressione [E] para começar", "darkblue", "right")
                    end
                    if IsControlJustPressed(0, 51) then
                        if shown then
                            shown = false
                            exports["okokTextUI"]:Close()
                        end
                        if not start then
                            TriggerServerEvent("Natural:Server:Desmanche:Sync", vehicle, true)
                            SetEntityCoords(vehicle, coords.x, coords.y, coords.z)
                            TaskLeaveVehicle(ped, vehicle, 0)
                            start = true
                            Start(vehicle, ped)
                        else
                            TriggerServerEvent("Natural:Server:Desmanche:Sync", vehicle, false)
                            start = false
                        end
                    end
                end
            else
                if shown then
                    shown = false
                    exports["okokTextUI"]:Close()
                end
                sleep = 1000
            end
        else
            if shown then
                shown = false
                exports["okokTextUI"]:Close()
            end
            sleep = 1000
        end
        Citizen.Wait(sleep)
    end
end)

function Start(vehicle, ped)
    doorsBroken = {
        ["door_dside_f"] = false,
        ["door_pside_f"] = false,
        ["door_dside_r"] = false,
        ["door_pside_r"] = false
    }
    for k, v in pairs(doorsBroken) do
        if GetEntityBoneIndexByName(vehicle, k) == -1 then
            doorsBroken[k] = true
        end
    end
    wheelsBroken = {
        ["wheel_lf"] = false,
        ["wheel_lr"] = false,
        ["wheel_rf"] = false,
        ["wheel_rr"] = false
    }
    for k, v in pairs(wheelsBroken) do
        if GetEntityBoneIndexByName(vehicle, k) == -1 then
            wheelsBroken[k] = true
        end
    end
    otherBroken = {
        ["bonnet"] = false,
        ["boot"] = false
    }
    isFinished = false
    canPass = true
    Citizen.CreateThread(function()
        while start do
            for i = 1, #doors do
                local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, doors[i]))
                if bonePos ~= GetEntityCoords(vehicle) and not doorsBroken[doors[i]] then
                    DrawMarker(20, bonePos.x, bonePos.y, bonePos.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3,
                        255, 255, 255, 150, false, true
                        , 2, false, false, false, false)

                    for k, v in pairs(doorsBroken) do
                        if not v then
                            canPass = false
                            break
                        end
                    end
                    if canPass then
                        canPass = false
                        StartWheels(vehicle, ped)
                        TerminateThisThread()
                        return
                    else
                        if Vdist(GetEntityCoords(ped), bonePos) < 1.0 then
                            ESX.ShowHelpNotification("Pressione ~INPUT_CONTEXT~ para retirar a porta")
                            if IsControlJustPressed(0, 51) and not isWorking then
                                isWorking = true
                                SkillbarOBJ.Start({
                                    duration = math.random(750, 2450),
                                    pos = math.random(10, 80),
                                    width = math.random(6, 10),
                                }, function()
                                    if doors[i] == "door_dside_f" then
                                        SetVehicleDoorOpen(vehicle, 0, false, false)
                                    elseif doors[i] == "door_pside_f" then
                                        SetVehicleDoorOpen(vehicle, 1, false, false)
                                    elseif doors[i] == "door_dside_r" then
                                        SetVehicleDoorOpen(vehicle, 2, false, false)
                                    elseif doors[i] == "door_pside_r" then
                                        SetVehicleDoorOpen(vehicle, 3, false, false)
                                    end
                                    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 10, true)
                                    Citizen.Wait(10000)
                                    ClearPedTasks(ped)
                                    doorsBroken[doors[i]] = true
                                    if doors[i] == "door_dside_f" then
                                        SetVehicleDoorBroken(vehicle, 0, true)
                                    elseif doors[i] == "door_pside_f" then
                                        SetVehicleDoorBroken(vehicle, 1, true)
                                    elseif doors[i] == "door_dside_r" then
                                        SetVehicleDoorBroken(vehicle, 2, true)
                                    elseif doors[i] == "door_pside_r" then
                                        SetVehicleDoorBroken(vehicle, 3, true)
                                    end
                                    TriggerServerEvent("Natural:Server:Desmanche:Porta")
                                    isWorking = false
                                    for k, v in pairs(doorsBroken) do
                                        if not v then
                                            isFinished = false
                                            break
                                        else
                                            isFinished = true
                                        end
                                    end
                                    if isFinished then
                                        StartWheels(vehicle, ped)
                                        TerminateThisThread()
                                        return
                                    end
                                end, function()
                                    isWorking = false
                                end)
                            end
                        end
                    end
                end
            end
            Citizen.Wait(5)
        end
    end)
end

function StartWheels(vehicle, ped)
    Citizen.CreateThread(function()
        while start do
            isFinished = false
            for i = 1, #wheels do
                local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, wheels[i]))
                if bonePos ~= GetEntityCoords(vehicle) and not wheelsBroken[wheels[i]] then
                    DrawMarker(20, bonePos.x, bonePos.y, bonePos.z + 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3,
                        255, 255,
                        255, 150, false, true
                        , 2, false, false, false, false)
                    for k, v in pairs(wheelsBroken) do
                        if not v then
                            canPass = false
                            break
                        end
                    end
                    if canPass then
                        canPass = false
                        StartOther(vehicle, ped)
                        TerminateThisThread()
                        return
                    else
                        if Vdist(GetEntityCoords(ped), bonePos) < 1.0 then
                            ESX.ShowHelpNotification("Pressione ~INPUT_CONTEXT~ para retirar o pneu")
                            if IsControlJustPressed(0, 51) and not isWorking then
                                isWorking = true
                                SkillbarOBJ.Start({
                                    duration = math.random(750, 2450),
                                    pos = math.random(10, 80),
                                    width = math.random(6, 10),
                                }, function()
                                    TaskStartScenarioInPlace(ped, "CODE_HUMAN_MEDIC_TEND_TO_DEAD", 10, true)
                                    Citizen.Wait(10000)
                                    ClearPedTasks(ped)
                                    wheelsBroken[wheels[i]] = true
                                    if wheels[i] == "wheel_lf" then
                                        SetVehicleTyreBurst(vehicle, 0, true, 1000.0)
                                    elseif wheels[i] == "wheel_lr" then
                                        SetVehicleTyreBurst(vehicle, 4, true, 1000.0)
                                    elseif wheels[i] == "wheel_rf" then
                                        SetVehicleTyreBurst(vehicle, 1, true, 1000.0)
                                    elseif wheels[i] == "wheel_rr" then
                                        SetVehicleTyreBurst(vehicle, 5, true, 1000.0)
                                    end
                                    TriggerServerEvent("Natural:Server:Desmanche:Roda")
                                    isWorking = false
                                    for k, v in pairs(wheelsBroken) do
                                        if not v then
                                            isFinished = false
                                            break
                                        else
                                            isFinished = true
                                        end
                                    end
                                    if isFinished then
                                        StartOther(vehicle, ped)
                                        TerminateThisThread()
                                        return
                                    end
                                end, function()
                                    isWorking = false
                                end)
                            end
                        end
                    end
                end
            end
            Citizen.Wait(5)
        end
    end)
end

function StartOther(vehicle, ped)
    Citizen.CreateThread(function()
        while start do
            isFinished = false
            for i = 1, #other do
                local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, other[i]))
                if bonePos ~= GetEntityCoords(vehicle) and not otherBroken[other[i]] then
                    DrawMarker(20, bonePos.x, bonePos.y, bonePos.z + 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3,
                        255, 255,
                        255, 150, false, true
                        , 2, false, false, false, false)
                    for k, v in pairs(otherBroken) do
                        if not v then
                            canPass = false
                            break
                        end
                    end
                    if canPass then
                        canPass = false
                        start = false
                        TriggerServerEvent("Natural:Server:Desmanche:Sync", vehicle, false)
                        Wait(500)
                        DeleteEntity(vehicle)
                        TerminateThisThread()
                        return
                    else
                        if Vdist(GetEntityCoords(ped), bonePos) < 2.0 then
                            if other[i] == "bonnet" then
                                ESX.ShowHelpNotification("Pressione ~INPUT_CONTEXT~ para retirar o capô")
                            elseif other[i] == "boot" then
                                ESX.ShowHelpNotification("Pressione ~INPUT_CONTEXT~ para retirar o porta-malas")
                            end
                            if IsControlJustPressed(0, 51) and not isWorking then
                                isWorking = true
                                SkillbarOBJ.Start({
                                    duration = math.random(750, 2450),
                                    pos = math.random(10, 80),
                                    width = math.random(6, 10),
                                }, function()
                                    if other[i] == "bonnet" then
                                        SetVehicleDoorOpen(vehicle, 4, false, false)
                                    elseif other[i] == "boot" then
                                        SetVehicleDoorOpen(vehicle, 5, false, false)
                                    end
                                    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 10, true)
                                    Citizen.Wait(10000)
                                    ClearPedTasks(ped)
                                    otherBroken[other[i]] = true
                                    if other[i] == "bonnet" then
                                        SetVehicleDoorBroken(vehicle, 4, true)
                                    elseif other[i] == "boot" then
                                        SetVehicleDoorBroken(vehicle, 5, true)
                                    end
                                    TriggerServerEvent("Natural:Server:Desmanche:Other")
                                    isWorking = false
                                    for k, v in pairs(otherBroken) do
                                        if not v and GetEntityBoneIndexByName(vehicle, k) ~= -1 then
                                            isFinished = false
                                            break
                                        else
                                            isFinished = true
                                        end
                                    end
                                    if isFinished then
                                        start = false
                                        TriggerServerEvent("Natural:Server:Desmanche:Sync", vehicle, false)
                                        Wait(500)
                                        DeleteEntity(vehicle)
                                        TerminateThisThread()
                                        return
                                    end
                                end, function()
                                    isWorking = false
                                end)
                            end
                        end
                    end
                end
            end
            Citizen.Wait(5)
        end
    end)
end

RegisterNetEvent("Natural:Client:Desmanche:Sync")
AddEventHandler("Natural:Client:Desmanche:Sync", function(vehicle, bool)
    FreezeEntityPosition(vehicle, bool)
end)
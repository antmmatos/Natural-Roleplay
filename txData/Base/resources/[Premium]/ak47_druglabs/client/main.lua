local isPickingUp, isProcessing = false, false
local inField = false
local sleep = 1000

AddEventHandler('ak47_druglabs:startTpInArea', function(zone)
    tpSleep = 0
    while tpArea do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(coords, zone, true) > 20 then
            tpSleep = 1000
            tpArea = false
        end
    end
end)

AddEventHandler('ak47_druglabs:startFieldInArea', function(zone)
    sleep = 0
    while inField do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(coords, zone, true) > 20 then
            sleep = 1000
            inField = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(sleep)
        local coords = GetEntityCoords(PlayerPedId())
        for i = 1, #Config.CircleZones, 1 do
            for j = 1, #Config.CircleZones[i].collect, 1 do 
                local collectDistance = GetDistanceBetweenCoords(coords, Config.CircleZones[i].collect[j].pos, true)
                if collectDistance <= 20.0 then
                    if not inField then
                        inField = true
                        TriggerEvent('ak47_druglabs:startFieldInArea', Config.CircleZones[i].collect[j].pos)
                    end
                    DrawMarker(1, Config.CircleZones[i].collect[j].pos.x, Config.CircleZones[i].collect[j].pos.y, Config.CircleZones[i].collect[j].pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 0.1, 0, 0, 180, 200, false, true, 2, false, false, false, false)
                    if collectDistance < 1.5 then
                        if collectDistance < 1.5 then
                            if not isPickingUp then
                                ShowHelpNotification(string.format(Locales['drug_pickupprompt'], Config.CircleZones[i].xLabel))
                            end
                            if IsControlJustReleased(0, 38) and not isPickingUp then
                                collectDrug(Config.CircleZones[i].collect[j].pos, Config.CircleZones[i].collect[j].heading, Config.CircleZones[i].collect[j].quantity, Config.CircleZones[i].xItem, Config.CircleZones[i].xLabel)
                            end
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(sleep)
        local coords = GetEntityCoords(PlayerPedId())
        for i = 1, #Config.CircleZones, 1 do
            for k = 1, #Config.CircleZones[i].process, 1 do
                local processDistance = GetDistanceBetweenCoords(coords, Config.CircleZones[i].process[k].pos, true)
                if processDistance <= 20.0 then
                    if not inField then
                        inField = true
                        TriggerEvent('ak47_druglabs:startFieldInArea', Config.CircleZones[i].process[k].pos)
                    end
                    DrawMarker(1, Config.CircleZones[i].process[k].pos.x, Config.CircleZones[i].process[k].pos.y, Config.CircleZones[i].process[k].pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 0.1, 0, 180, 0, 200, false, true, 2, false, false, false, false)
                    if processDistance < 1.5 then
                        if not isProcessing then
                            ShowHelpNotification(string.format(Locales['drug_processprompt'], Config.CircleZones[i].xLabel))
                        end
                        if IsControlJustReleased(0, 38) and not isProcessing then
                            if Config.CircleZones[i].requiredForProcess then
                                ESX.TriggerServerCallback('ak47_druglabs:checkRequired', function(cb)
                                    if cb then
                                        ESX.TriggerServerCallback('ak47_druglabs:cannabis_count', function(xCannabis)
                                            processDrug(Config.CircleZones[i].process[k].pos, Config.CircleZones[i].process[k].heading, Config.CircleZones[i].xItem, Config.CircleZones[i].xQuantity, Config.CircleZones[i].yItem, Config.CircleZones[i].yQuantity, Config.CircleZones[i].xLabel, Config.CircleZones[i].yLabel, Config.CircleZones[i].processDelay, Config.CircleZones[i].requiredForProcess, Config.CircleZones[i].removable)
                                        end, Config.CircleZones[i].xItem, Config.CircleZones[i].xQuantity)
                                    else
                                        showNotification(string.format(Locales['drug_required'], Config.CircleZones[i].yQuantity, Config.CircleZones[i].requiredForProcessLabel), 'inform', 5000)
                                    end
                                end, Config.CircleZones[i].requiredForProcess, Config.CircleZones[i].yQuantity)
                            else
                                ESX.TriggerServerCallback('ak47_druglabs:cannabis_count', function(xCannabis)
                                    processDrug(Config.CircleZones[i].process[k].pos, Config.CircleZones[i].process[k].heading, Config.CircleZones[i].xItem, Config.CircleZones[i].xQuantity, Config.CircleZones[i].yItem, Config.CircleZones[i].yQuantity, Config.CircleZones[i].xLabel, Config.CircleZones[i].yLabel, Config.CircleZones[i].processDelay)
                                end, Config.CircleZones[i].xItem, Config.CircleZones[i].xQuantity)
                            end
                        end
                    end
                end
            end
        end
    end
end)

function collectDrug(coords, heading, xQuantity, xItem, xLabel)
    isPickingUp = true
    showNotification(string.format(Locales['drug_collectstarted'], xLabel))
    SetEntityHeading(GetPlayerPed(-1), heading)
    playAnimProcess("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", -1)
    TriggerServerEvent('ak47_druglabs:cancollect', true)
    TriggerServerEvent('ak47_druglabs:collectDrugs', xItem, xQuantity, xLabel)
    local playerPed = PlayerPedId()
    while isPickingUp do
        Citizen.Wait(0)
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), coords, false) > 1.5 then
            TriggerServerEvent('ak47_druglabs:cancollect', false)
            isPickingUp = false
        end
    end
    ClearPedTasksImmediately(GetPlayerPed(-1))
end

function processDrug(coords, heading, xItem, xQuantity, yItem, yQuantity, xLabel, yLabel, delay, required, removable)
    isProcessing = true
    showNotification(string.format(Locales['drug_processingstarted'], xLabel, yLabel), 'inform', 5000)
    SetEntityHeading(GetPlayerPed(-1), heading)
    playAnimProcess("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", -1)
    TriggerServerEvent('ak47_druglabs:canprocess', true)
    TriggerServerEvent('ak47_druglabs:processCannabis', xItem, xQuantity, yItem, yQuantity, xLabel, yLabel, delay, required, removable)
    local playerPed = PlayerPedId()
    while isProcessing do
        Citizen.Wait(0)
        if GetDistanceBetweenCoords(GetEntityCoords(playerPed), coords, false) > 1.5 then
            showNotification(Locales['drug_processingtoofar'])
            TriggerServerEvent('ak47_druglabs:canprocess', false)
            isProcessing = false
        end
    end
    ClearPedTasksImmediately(GetPlayerPed(-1))
end

function playAnimProcess(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Citizen.Wait(0) 
    end
    TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

RegisterNetEvent('ak47_druglabs:cancelProcessing')
AddEventHandler('ak47_druglabs:cancelProcessing', function()
    isProcessing = false
end)

RegisterNetEvent('ak47_druglabs:cancelCollect')
AddEventHandler('ak47_druglabs:cancelCollect', function()
    isPickingUp = false
end)
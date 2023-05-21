RegisterNetEvent('Natural:Client:RepairKit:Use')
AddEventHandler('Natural:Client:RepairKit:Use', function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)

    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        local vehicle = nil

        if IsPedInAnyVehicle(playerPed, false) then
            vehicle = GetVehiclePedIsIn(playerPed, false)
        else
            vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
        end

        if DoesEntityExist(vehicle) then
            TriggerServerEvent('Natural:Server:RepairKit:RemoveKit')
            TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_BUM_BIN", 0, true)
            ThreadID = GetIdOfThisThread()

            exports["progressbar"]:Progress({
                name = "repairkit",
                duration = 10000,
                label = "A arranjar o veículo...",
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = true,
                    disableCombat = true,
                },
            }, function(cancelled)
                if not cancelled then
                    SetVehicleFixed(vehicle)
                    SetVehicleDeformationFixed(vehicle)
                    SetVehicleUndriveable(vehicle, false)
                    SetVehicleEngineOn(vehicle, true, true)
                    ClearPedTasksImmediately(playerPed)

                    ESX.ShowNotification("Veículo arranjado", "success")
                end
            end)
        end
    else
        ESX.ShowNotification("Sem veículos por perto", "warning")
    end
end)

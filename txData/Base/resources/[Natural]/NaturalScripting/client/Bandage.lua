RegisterNetEvent('Natural:Client:Bandage')
AddEventHandler('Natural:Client:Bandage', function()
    local lib, anim = 'anim@amb@business@weed@weed_inspecting_high_dry@', 'weed_inspecting_high_base_inspector'
    local playerPed = PlayerPedId()

    ESX.Streaming.RequestAnimDict(lib, function()
        TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 49, 0, false, false, false)

        exports["progressbar"]:Progress({
            name = "use_bandage",
            duration = 7000,
            label = "A usar bandagem...",
            useWhileDead = false,
            canCancel = false,
            controlDisables = {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
            },
        }, function(cancelled)
            if not cancelled then
                ClearPedTasks(playerPed)
                local playerPed = PlayerPedId()
                local maxHealth = GetEntityMaxHealth(playerPed)
                local health = GetEntityHealth(playerPed)
                local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
                SetEntityHealth(playerPed, newHealth)
            end
        end)
    end)
end)

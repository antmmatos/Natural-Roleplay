local peds = {}

RegisterNetEvent('Natural:Client:PedManager:Setup')
AddEventHandler('Natural:Client:PedManager:Setup', function(pedTable)
    peds = {}
    for k, v in pairs(pedTable) do
        table.insert(peds, { label = v.label, value = v.model })
    end
end)

RegisterCommand('ped', function(source, args, rawCommand)
    if #peds > 0 then
        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "ped",
            { title = "Menu de Peds", align = "center", elements = peds }, function(data, menu)
                if data.current.value ~= nil then
                    if data.current.value == "default" then
                        
                    else
                        local model = data.current.value
                        RequestModel(model)
                        while not HasModelLoaded(model) do
                            Citizen.Wait(0)
                        end
                        SetPlayerModel(PlayerId(), model)
                        SetModelAsNoLongerNeeded(model)
                    end
                end
                menu.close()
            end, function(data, menu)
            menu.close()
        end)
    else
        ESX.ShowNotification("Você não tem nenhum ped", "warning")
    end
end)

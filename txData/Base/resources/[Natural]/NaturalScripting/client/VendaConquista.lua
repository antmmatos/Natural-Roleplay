local counter = 0
local started = false

RegisterCommand("vender", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    if inTable(ESX.PlayerData.job.name) then
        if #(coords - posCoords) < maxDistancePed then
            counter = 0
            TriggerServerEvent("Natural:Server:DrugSellConquest:Start")
        else
            ESX.ShowNotification("Não estás perto da zona de venda.", "warning")
        end
    else
        ESX.ShowNotification("Não pertences a nenhuma organização criminosa.", "error")
    end
end)

RegisterNetEvent("Natural:Server:DrugSellConquest:Start")
AddEventHandler("Natural:Server:DrugSellConquest:Start", function(svCounter)
    counter = svCounter
    Citizen.CreateThread(function()
        SendNUIMessage({
            acao = "start",
            type = "first",
            counter = counter .. "%"
        })
        while tonumber(counter) < 100 do
            SendNUIMessage({
                acao = "update",
                type = "first",
                counter = counter .. "%"
            })
            Citizen.Wait(1000)
        end
    end)
end)

RegisterNetEvent("Natural:Client:DrugSellConquest:UpdateCounter")
AddEventHandler("Natural:Client:DrugSellConquest:UpdateCounter", function(svCounter)
    counter = svCounter
end)

RegisterNetEvent("Natural:Client:DrugSellConquest:Stop")
AddEventHandler("Natural:Client:DrugSellConquest:Stop", function()
    counter = 0
    started = false
    SendNUIMessage({
        acao = "stop",
        type = "first",
    })
end)

Citizen.CreateThread(function()
    while true do
        if #(GetEntityCoords(PlayerPedId()) - posCoords) < maxDistancePed and not started then
            DrawMarker(27, posCoords.x, posCoords.y, posCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 10.0, 10.0, 255,
                255, 255, 255, false, false, 1, false, false, false, false)
        else
            Citizen.Wait(3000)
        end
        Citizen.Wait(0)
    end
end)

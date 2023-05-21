local started = false
local inCooldown = false
local counter = 0

RegisterServerEvent("Natural:Server:DrugSellConquest:Start", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local job = xPlayer.job.name
    local players = ESX.OneSync.GetPlayersInArea(GetEntityCoords(GetPlayerPed(_source)), maxDistanceTeam)
    local orgMembers = 0
    for k, v in pairs(players) do
        if ESX.GetPlayerFromId(v.id).job.name == job then
            orgMembers = orgMembers + 1
        end
    end
    if orgMembers < 1 then
        TriggerClientEvent("esx:showNotification", _source, "Não tens membros suficientes para vender.", "error")
        return
    end
    if not inCooldown and not started then
        started = true
        counter = 0
        TriggerClientEvent("esx:showNotification", -1, "Foi iniciado o processo de venda de droga.", "success")
        local players = ESX.OneSync.GetPlayersInArea(GetEntityCoords(GetPlayerPed(_source)), maxDistanceTeam)
        for k, v in pairs(players) do
            if ESX.GetPlayerFromId(v.id).job.name == job then
                TriggerClientEvent("Natural:Client:DrugSellConquest:Start", k, counter)
            end
        end
        Citizen.CreateThread(function()
            while not isCooldown do
                Citizen.Wait(6000)
                local players = ESX.OneSync.GetPlayersInArea(GetEntityCoords(GetPlayerPed(_source)), maxDistanceTeam)
                local orgMembers = 0
                for k, v in pairs(players) do
                    if ESX.GetPlayerFromId(v.id).job.name == job then
                        orgMembers = orgMembers + 1
                    end
                end
                if orgMembers < 1 then
                    TriggerClientEvent("esx:showNotification", _source, "Os membros da tua organização afastaram-se.",
                        "error")
                    TriggerClientEvent("Natural:Client:DrugSellConquest:Stop", -1)
                    TriggerEvent("Natural:Server:DrugSellConquest:StartCooldown")
                    return
                end
                if #(GetEntityCoords(GetPlayerPed(_source)) - posCoords) > maxDistancePed then
                    TriggerClientEvent("esx:showNotification", _source, "Afastaste-te da zona da venda.", "error")
                    TriggerClientEvent("Natural:Client:DrugSellConquest:Stop", -1)
                    TriggerEvent("Natural:Server:DrugSellConquest:StartCooldown")
                    return
                end
                counter = counter + 1
                TriggerClientEvent("Natural:Client:DrugSellConquest:UpdateCounter", -1, counter)
                if counter == 100 then
                    TriggerEvent("Natural:Server:DrugSellConquest:StartSelling", _source)
                    TriggerClientEvent("Natural:Client:DrugSellConquest:Stop", -1)
                    TriggerEvent("Natural:Server:DrugSellConquest:StartCooldown")
                    break
                end
            end
        end)
    else
        TriggerClientEvent("esx:showNotification", _source, "Aguenta mais um pouco, a venda está em cooldown.", "error")
        return
    end
end)

AddEventHandler("Natural:Server:DrugSellConquest:StartCooldown", function()
    started = false
    inCooldown = true
    Citizen.Wait(30000)
    inCooldown = false
end)

AddEventHandler("Natural:Server:DrugSellConquest:StartSelling", function(source)
    local _source = source
    if inCooldown then
        return
    end
    local xPlayer = ESX.GetPlayerFromId(_source)
    Citizen.CreateThread(function()
        while true do
            if xPlayer.getInventoryItem("weed_pooch").count >= 20 then
                xPlayer.removeInventoryItem("weed_pooch", 20)
                xPlayer.addMoney(0)
                TriggerClientEvent("esx:showNotification", _source, "Vendeste x20 sacos de erva.", "success")
            elseif xPlayer.getInventoryItem("coke_pooch").count >= 20 then
                xPlayer.removeInventoryItem("coke_pooch", 20)
                xPlayer.addMoney(0)
                TriggerClientEvent("esx:showNotification", _source, "Vendeste x20 sacos de cocaína.", "success")
            elseif xPlayer.getInventoryItem("meth_pooch").count >= 20 then
                xPlayer.removeInventoryItem("meth_pooch", 20)
                xPlayer.addMoney(0)
                TriggerClientEvent("esx:showNotification", _source, "Vendeste x20 sacos de metanfetamina.", "success")
            end
            if not (xPlayer.getInventoryItem("weed_pooch").count < 20) and not (xPlayer.getInventoryItem("coke_pooch").count < 20) and not (xPlayer.getInventoryItem("meth_pooch").count < 20) then
                TriggerClientEvent("esx:showNotification", _source, "Acabou a venda de droga.", "error")
                TriggerClientEvent("Natural:Client:DrugSellConquest:Stop", _source)
                TriggerEvent("Natural:Server:DrugSellConquest:StartCooldown")
                LogToDiscord(_source, "https://discord.com/api/webhooks/1107314072581587056/S6MMUgUeBxvUWKhfkUM-odAPgtZQXY8jxwdzwWgpktv7fVYL0y-fDd9ZwOGoeRl1sufW", "Venda de droga", "O jogador **" .. GetPlayerName(_source) .. "** vendeu 20x " .. item.label .. " por €" .. data[2] * 20 .. " na conquista da favela.")
                break
            end
            Citizen.Wait(20000)
        end
    end)
end)

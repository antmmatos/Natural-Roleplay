local druglist = {
    ["coke_pooch"] = true,
    ["weed_pooch"] = true,
    ["meth_pooch"] = true,
}

RegisterServerEvent('Natural:Server:DrugSell:Sell', function(data)
    if not druglist[data[1]] then
        DropPlayer(source, "Tentativa de acionamento de eventos externamente.")
        TriggerClientEvent("Natural:Client:DrugSell:Stop", source)
        return
    end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        TriggerClientEvent("Natural:Client:DrugSell:Stop", source)
        return
    end
    local item = xPlayer.getInventoryItem(data[1])
    if item.count >= 20 then
        xPlayer.removeInventoryItem(data[1], 20)
        xPlayer.addMoney(data[2] * 20)
        xPlayer.showNotification("Você vendeu 20x " .. item.label .. " por €" .. data[2] * 20, "success")
        local _source = source
        LogToDiscord(_source, "https://discord.com/api/webhooks/1107314072581587056/S6MMUgUeBxvUWKhfkUM-odAPgtZQXY8jxwdzwWgpktv7fVYL0y-fDd9ZwOGoeRl1sufW", "Venda de droga", "O jogador **" .. GetPlayerName(_source) .. "** vendeu 20x " .. item.label .. " por €" .. data[2] * 20 .. " no NPC de venda de droga.")
    else
        xPlayer.showNotification("Você não tem 20x " .. item.label .. " para vender", "error")
        TriggerClientEvent("Natural:Client:DrugSell:Stop", source)
    end
end)
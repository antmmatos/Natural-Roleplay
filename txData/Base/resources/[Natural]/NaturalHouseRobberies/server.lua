local robbableItemsCommon = {
    -- MATERIAIS E COISAS BANAIS DE CRIME QUE VALEM POUCO - ACTUALIZADO 28/05/2020
    [1] = { chance = 1, id = 'bread', quantity = math.random(1, 2) },
    [2] = { chance = 2, id = 'water', quantity = math.random(1, 2) },  
    [3] = { chance = 10, id = 'beer', quantity = math.random(1, 2) },
    [4] = { chance = 1, id = 'sprite', quantity = math.random(1, 2) },
    [5] = { chance = 2, id = 'donut', quantity = math.random(1, 2) },  
    [6] = { chance = 4, id = 'hamburger', quantity = math.random(1, 2) },
    [7] = { chance = 5, id = 'classic_phone', quantity = math.random(1, 2) },
    [8] = { chance = 6, id = 'black_phone', quantity = math.random(1, 2) },
    [9] = { chance = 7, id = 'blue_phone', quantity = math.random(1, 2) },
    [10] = { chance = 8, id = 'gold_phone', quantity = math.random(1, 2) },
    [11] = { chance = 9, id = 'red_phone', quantity = math.random(1, 2) },
    [12] = { chance = 3, id = 'green_phone', quantity = math.random(1, 2) },
    [13] = { chance = 10, id = 'greenlight_phone', quantity = math.random(1, 2) },
    [14] = { chance = 6, id = 'pink_phone', quantity = math.random(1, 2) },
    [15] = { chance = 7, id = 'white_phone', quantity = math.random(1, 2) },
    [16] = { chance = 8, id = 'radio', quantity = math.random(1, 2) },
    [17] = { chance = 9, id = 'repairkit', quantity = math.random(1, 2) },
  
    
}

local robbableItemsRare = {
    [1] = { chance = 1, id = 'glass', quantity = math.random(5, 10) },
    [2] = { chance = 2, id = 'iron_metal', quantity = math.random(5, 10) },
    [3] = { chance = 3, id = 'pooch_bag', quantity = math.random(5, 10) },
    [4] = { chance = 4, id = 'gold_metal', quantity = math.random(5, 10) },
    [5] = { chance = 5, id = 'plastic', quantity = math.random(5, 10) },
}

local robbableItemsSuperRare = {
    -- ARMAS DE CORPO A CORPO, ALGUMAS COISAS DO CRIME
    [1] = { chance = 1, id = 'bandage', quantity = math.random(5, 10) },
    [2] = { chance = 2, id = 'molapeca', quantity = math.random(5, 10) },
    [3] = { chance = 3, id = 'armor', quantity = math.random(1, 2) },
    [4] = { chance = 4, id = 'pistol_ammo', quantity = math.random(5, 10) },
    [5] = { chance = 5, id = 'smg_ammo', quantity = math.random(5, 10) },
    [6] = { chance = 6, id = 'rifle_ammo', quantity = math.random(5, 10) },
}

local robbableItemsUltraRare = {
    -- BLUEPRINTS DE ARMAS; COISAS MUITO RARAS OU QUE VALEM MUITO - RODAR 15 a 15 dias
    [1] = { chance = 5, type = "weapon", id = 'WEAPON_PISTOLSNS', quantity = 1 },
    [2] = { chance = 1, type = "weapon", id = 'WEAPON_PISTOL', quantity = 1 },
}

ESX.RegisterServerCallback('Natural:Server:HouseRobberies:getJobsOnline', function(source, cb)
    local extendedplayers = ESX.GetExtendedPlayers("job", "police")
    cb(#extendedplayers)
end)

ESX.RegisterUsableItem('advancedlockpick', function(source)
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'police' then
        xPlayer.showNotification('A tentar assaltar uma casa sendo da DPLS?', 'error')
    else
        TriggerClientEvent('Natural:Client:HouseRobberies:Attempt', source, xPlayer.getInventoryItem('advancedlockpick').count)
    end
end)

RegisterServerEvent("Natural:Server:HouseRobberies:Log")
AddEventHandler("Natural:Server:HouseRobberies:Log", function(houseId)
    exports["NaturalScripting"]:LogToDiscord(source,
        "https://discord.com/api/webhooks/1107313671505461248/VuhWOwWGaNJNshGzADw914twdYFgUNs34tKO44q3yFZiEkcbC4uwaIxU-cGc_aEgLZDY",
        "Assaltos a Casas", "O jogador " .. GetPlayerName(source) .. " assaltou a casa " .. houseId)
end)

RegisterCommand('arrombar', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'police' then
        TriggerClientEvent('Natural:Client:HouseRobberies:PoliceAttempt', source)
    end
end)


RegisterServerEvent('Natural:Server:HouseRobberies:RemoveLockpick')
AddEventHandler('Natural:Server:HouseRobberies:RemoveLockpick', function()
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('lockpick', 1)
end)

RegisterServerEvent('Natural:Server:HouseRobberies:GiveMoney')
AddEventHandler('Natural:Server:HouseRobberies:GiveMoney', function()
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = math.random(2300, 4000)
    xPlayer.addMoney(cash)
end)

RegisterServerEvent('Natural:Server:HouseRobberies:Search')
AddEventHandler('Natural:Server:HouseRobberies:Search', function(id, table)
    TriggerClientEvent('Natural:Client:HouseRobberies:Search', -1, id, table)
end)

RegisterServerEvent('Natural:Server:HouseRobberies:SearchItem')
AddEventHandler('Natural:Server:HouseRobberies:SearchItem', function(id)
    local source = tonumber(source)
    local item = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local gotID = {}
    local itemchance = math.random(1, 100)
    if itemchance == 10 then
        item = robbableItemsUltraRare[math.random(1, #robbableItemsUltraRare)] --item[32]
        xPlayer.addWeapon(item.id, tonumber(0))
        xPlayer.showNotification('Encontras-te ' .. item.quantity .. 'x ' .. item.id, "success")
    elseif itemchance <= 30 then
        item = robbableItemsSuperRare[math.random(1, #robbableItemsSuperRare)]
        xPlayer.addInventoryItem(item.id, item.quantity)
        xPlayer.showNotification('Encontras-te ' .. item.quantity .. 'x ' .. item.id, "success")
    elseif itemchance <= 60 then
        item = robbableItemsRare[math.random(1, #robbableItemsRare)]
        xPlayer.addInventoryItem(item.id, item.quantity)
        xPlayer.showNotification('Encontras-te ' .. item.quantity .. 'x ' .. item.id, "success")
    else
        item = robbableItemsCommon[math.random(1, #robbableItemsCommon)]
        xPlayer.addInventoryItem(item.id, item.quantity)
        xPlayer.showNotification('Encontras-te ' .. item.quantity .. 'x ' .. item.id, "success")
    end
end)

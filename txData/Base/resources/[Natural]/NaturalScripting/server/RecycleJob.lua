RegisterServerEvent('recycle:server:getItem')
AddEventHandler('recycle:server:getItem', function(table)
    if type(table) ~= 'table' then
        -- LOG
        return
    end
    local ItemTable = { "metalscrap", "hunter_animal_cloth", "iron_metal", "rubber", "glass", "gold_metal", "pooch_bag" }
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)


    local randItem = ItemTable[math.random(#ItemTable)]

    local amount = math.random(3, 6)

    math.randomseed(GetGameTimer())
    if xPlayer.canCarryItem(randItem, amount) then
        xPlayer.addInventoryItem(randItem, amount)
    else
        TriggerClientEvent('esx:showNotification', _source, "", "Não tens espaço no inventário", 2000, "warning")
    end
end)
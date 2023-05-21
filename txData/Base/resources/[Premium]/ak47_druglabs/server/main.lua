local playersProcessingDrugs = {}
local playersCollectCannabis = {}
local canProcess = {}
local canCollect = {}
local ST = ESX.SetTimeout

RegisterServerEvent('ak47_druglabs:sellDrug')
AddEventHandler('ak47_druglabs:sellDrug', function(itemName, amount, price)
    local itemName, amount, price = itemName, amount, price
    if ESX then
        if ESX.GetItemLabel(itemName) then
            local xPlayer = ESX.GetPlayerFromId(source)
            local price = price
            local xItem = xPlayer.getInventoryItem(itemName)
            if not price then
                print(('ak47_druglabs: %s attempted to sell an invalid drug!'):format(xPlayer.identifier))
                return
            end
            if xItem.count < amount then
                TriggerClientEvent('ak47_druglabs:showNotification', xPlayer.source, Locales['dealer_notenough'], 'error',
                    5000)
                return
            end
            price = ESX.Math.Round(price)
            if Config.GiveBlack then
                xPlayer.addAccountMoney('black_money', price)
            else
                xPlayer.addMoney(price)
            end
            xPlayer.removeInventoryItem(xItem.name, amount)
            TriggerClientEvent('ak47_druglabs:showNotification', xPlayer.source,
                string.format(Locales['dealer_sold'], amount, xItem.label, ESX.Math.GroupDigits(price)), 'success', 5000)
        else
            print('Igonred Item: ' .. itemName ..
            '. Make sure you restarted the server after adding the item in database')
        end
    else
        print('Framework Not Found!')
    end
end)

RegisterServerEvent('ak47_druglabs:cancollect')
AddEventHandler('ak47_druglabs:cancollect', function(bool)
    local _source = source
    canCollect[_source] = bool
end)

RegisterServerEvent('ak47_druglabs:canprocess')
AddEventHandler('ak47_druglabs:canprocess', function(bool)
    local _source = source
    canProcess[_source] = bool
end)

if ESX then
    ESX.RegisterServerCallback('ak47_druglabs:cannabis_count', function(source, cb, item, quantity)
        if ESX.GetItemLabel(item) then
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer then
                local xCannabis = xPlayer.getInventoryItem(item).count
                if xCannabis >= quantity then
                    cb(true)
                else
                    cb(false)
                end
            end
        else
            cb(false)
            print('Igonred Item: ' .. item .. '. Make sure you restarted the server after adding the item in database')
        end
    end)
else
    print('Framework Not Found!')
end

if ESX then
    ESX.RegisterServerCallback('ak47_druglabs:checkRequired', function(source, cb, item, quantity)
        if ESX.GetItemLabel(item) then
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer then
                local required = xPlayer.getInventoryItem(item).count
                if required >= quantity then
                    cb(true)
                else
                    cb(false)
                end
            end
        else
            cb(false)
            print('Igonred Item: ' .. item .. '. Make sure you restarted the server after adding the item in database')
        end
    end)
else
    print('Framework Not Found!')
end

RegisterServerEvent('ak47_druglabs:processCannabis')
AddEventHandler('ak47_druglabs:processCannabis',
    function(xItem, xQuantity, yItem, yQuantity, xLabel, yLabel, delay, required, removable)
        local xItem, xQuantity, yItem, yQuantity, xLabel, yLabel, delay, required, removable = xItem, xQuantity, yItem,
            yQuantity, xLabel, yLabel, delay, required, removable
        if ESX then
            if ESX.GetItemLabel(xItem) then
                if ESX.GetItemLabel(yItem) then
                    if not playersProcessingDrugs[source] then
                        local _source = source
                        local xPlayer = ESX.GetPlayerFromId(_source)
                        if xPlayer then
                            local xCannabis = xPlayer.getInventoryItem(xItem)
                            local xRequired = nil
                            if required then
                                xRequired = xPlayer.getInventoryItem(required)
                            end
                            if xCannabis.count >= xQuantity then
                                while canProcess[_source] do
                                    if playersProcessingDrugs[_source] == nil then
                                        playersProcessingDrugs[_source] = ST(delay * 1000, function()
                                            local xCannabis = xPlayer.getInventoryItem(xItem)
                                            if required then
                                                xRequired = xPlayer.getInventoryItem(required)
                                            end
                                            if xCannabis.count >= xQuantity then
                                                if required then
                                                    if xRequired.count >= yQuantity then
                                                        if canSwapItems(xPlayer, xItem, xQuantity, yItem, yQuantity) then
                                                            if canProcess[_source] then
                                                                if removable then
                                                                    xPlayer.removeInventoryItem(required, yQuantity)
                                                                end
                                                                xPlayer.removeInventoryItem(xItem, xQuantity)
                                                                xPlayer.addInventoryItem(yItem, yQuantity)
                                                                exports["NaturalScripting"]:LogToDiscord(_source,
                                                                    "https://discord.com/api/webhooks/1107312299682832505/nMwkLBed0eKDUhDCuJJ9IUQpRaHJUyH62HqMdV0x58_DoN-KTED4NCK3vQhXpnp050ON", "Droga",
                                                                    "Processados x" .. yQuantity .. " " .. yItem)
                                                                TriggerClientEvent('ak47_druglabs:showNotification',
                                                                    xPlayer.source,
                                                                    string.format(Locales['drug_processed'], xQuantity,
                                                                        xLabel, yQuantity, yLabel), 'success', 5000)
                                                            end
                                                        else
                                                            canProcess[_source] = false
                                                            TriggerClientEvent('ak47_druglabs:showNotification',
                                                                xPlayer.source, Locales['drug_processingfull'])
                                                        end
                                                    else
                                                        canProcess[_source] = false
                                                        TriggerClientEvent('ak47_druglabs:showNotification',
                                                            xPlayer.source,
                                                            string.format(Locales['drug_required'], yQuantity,
                                                                xRequired.label), 'inform', 5000)
                                                    end
                                                else
                                                    if canSwapItems(xPlayer, xItem, xQuantity, yItem, yQuantity) then
                                                        if canProcess[_source] then
                                                            xPlayer.removeInventoryItem(xItem, xQuantity)
                                                            xPlayer.addInventoryItem(yItem, yQuantity)
                                                            TriggerClientEvent('ak47_druglabs:showNotification',
                                                                xPlayer.source,
                                                                string.format(Locales['drug_processed'], xQuantity,
                                                                    xLabel, yQuantity, yLabel), 'success', 5000)
                                                        end
                                                    else
                                                        canProcess[_source] = false
                                                        TriggerClientEvent('ak47_druglabs:showNotification',
                                                            xPlayer.source, Locales['drug_processingfull'])
                                                    end
                                                end
                                            else
                                                canProcess[_source] = false
                                                TriggerClientEvent('ak47_druglabs:showNotification', xPlayer.source,
                                                    string.format(Locales['drug_processingenough'], xQuantity, xLabel),
                                                    'error', 5000)
                                            end
                                            playersProcessingDrugs[_source] = nil
                                        end)
                                    else
                                        Wait(delay * 1000)
                                    end
                                end
                                TriggerEvent('ak47_druglabs:cancelProcessing', xPlayer.source)
                            else
                                TriggerClientEvent('ak47_druglabs:showNotification', xPlayer.source,
                                    string.format(Locales['drug_processingenough'], xQuantity, xLabel), 'error', 5000)
                                TriggerEvent('ak47_druglabs:cancelProcessing', xPlayer.source)
                            end
                        end
                    else
                        print(('ak47_druglabs: %s attempted to exploit ak47_druglabs processing!'):format(
                        GetPlayerIdentifiers(source)[1]))
                    end
                else
                    print('Igonred Item: ' ..
                    yItem .. '. Make sure you restarted the server after adding the item in database')
                end
            else
                print('Igonred Item: ' .. xItem ..
                '. Make sure you restarted the server after adding the item in database')
            end
        else
            print('Framework Not Found!')
        end
    end)

RegisterServerEvent('ak47_druglabs:collectDrugs')
AddEventHandler('ak47_druglabs:collectDrugs', function(xItem, xQuantity, xLabel)
    local xItem, xQuantity, xLabel = xItem, xQuantity, xLabel
    if ESX then
        if ESX.GetItemLabel(xItem) then
            if not playersCollectCannabis[source] then
                local _source = source
                local xPlayer = ESX.GetPlayerFromId(_source)
                if xPlayer then
                    local xCannabis = xPlayer.getInventoryItem(xItem)
                    while canCollect[_source] do
                        if playersCollectCannabis[_source] == nil then
                            playersCollectCannabis[_source] = ST(1000, function()
                                if canCarryItems(xPlayer, xItem, xQuantity) then
                                    if canCollect[_source] then
                                        xPlayer.addInventoryItem(xItem, xQuantity)
                                        exports["NaturalScripting"]:LogToDiscord(_source, "https://discord.com/api/webhooks/1107312299682832505/nMwkLBed0eKDUhDCuJJ9IUQpRaHJUyH62HqMdV0x58_DoN-KTED4NCK3vQhXpnp050ON", "Droga",
                                            "Apanhou x" .. xQuantity .. " " .. xItem)
                                    end
                                else
                                    canCollect[_source] = false
                                    TriggerClientEvent('ak47_druglabs:showNotification', xPlayer.source,
                                        Locales['drug_processingfull'])
                                end
                                playersCollectCannabis[_source] = nil
                            end)
                        else
                            Wait(1000)
                        end
                    end
                    TriggerEvent('ak47_druglabs:cancelCollect', xPlayer.source)
                end
            else
                print(('ak47_druglabs: %s attempted to exploit ak47_druglabs collect drugs!'):format(
                GetPlayerIdentifiers(source)[1]))
            end
        else
            print('Igonred Item: ' .. xItem .. '. Make sure you restarted the server after adding the item in database')
        end
    else
        print('Framework Not Found!')
    end
end)

function CancelCollect(playerId)
    if playersCollectCannabis[playerId] then
        ESX.ClearTimeout(playersCollectCannabis[playerId])
        canCollect[playerId] = false
        playersCollectCannabis[playerId] = nil
    end
end

function CancelProcessing(playerId)
    if playersProcessingDrugs[playerId] then
        ESX.ClearTimeout(playersProcessingDrugs[playerId])
        canProcess[playerId] = false
        playersProcessingDrugs[playerId] = nil
    end
end

AddEventHandler('ak47_druglabs:cancelCollect', function(source)
    CancelCollect(source)
    TriggerClientEvent('ak47_druglabs:cancelCollect', source)
end)

AddEventHandler('ak47_druglabs:cancelProcessing', function(source)
    CancelProcessing(source)
    TriggerClientEvent('ak47_druglabs:cancelProcessing', source)
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
    CancelProcessing(playerId)
    CancelCollect(playerId)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
    CancelProcessing(source)
    CancelCollect(source)
    TriggerClientEvent('ak47_druglabs:cancelCollect', source)
    TriggerClientEvent('ak47_druglabs:cancelProcessing', source)
end)

function canCarryItems(xPlayer, item, count)
    if type(xPlayer.canCarryItem) == "table" or type(xPlayer.canCarryItem) == "function" then
        return xPlayer.canCarryItem(item, count)
    elseif xPlayer.getInventoryItem(item) and xPlayer.getInventoryItem(item).limit then
        local xItem = xPlayer.getInventoryItem(item)
        if xItem.limit ~= -1 and (xItem.count + count) > xItem.limit then
            return false
        else
            return true
        end
    else
        return true
    end
end

function canSwapItems(xPlayer, xItem, xCount, yItem, yCount)
    if type(xPlayer.canSwapItem) == "table" or type(xPlayer.canSwapItem) == "function" then
        return xPlayer.canSwapItem(xItem, xCount, yItem, yCount)
    elseif xPlayer.getInventoryItem(yItem) and xPlayer.getInventoryItem(yItem).limit then
        local item = xPlayer.getInventoryItem(yItem)
        if item.limit ~= -1 and (item.count + yCount) > item.limit then
            return false
        else
            return true
        end
    else
        return true
    end
end

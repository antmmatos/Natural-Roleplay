local deadPlayers = {}

RegisterNetEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function(playerId)
    playerId = tonumber(playerId)
    local xPlayer = source and ESX.GetPlayerFromId(source)

    if xPlayer and xPlayer.job.name == 'ambulance' then
        local xTarget = ESX.GetPlayerFromId(playerId)
        if xTarget then
            if deadPlayers[playerId] then
                xPlayer.showNotification("Reviveste o cidadão " .. xTarget.name, "success")
                xTarget.triggerEvent('esx_ambulancejob:revive')
                local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")

                for _, xPlayer in pairs(Ambulance) do
                    if xPlayer.job.name == 'ambulance' then
                        xPlayer.triggerEvent('esx_ambulancejob:PlayerNotDead', playerId)
                    end
                end
                deadPlayers[playerId] = nil
            else
                xPlayer.showNotification("O cidadão não está inconsciente", "warning")
            end
        else
            xPlayer.showNotification("O cidadão não está online", "error")
        end
    end
end)

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
    if GetInvokingResource() ~= "monitor" or type(eventData) ~= "table" or type(eventData.id) ~= "number" then
        return
    end
    if deadPlayers[eventData.id] then
        TriggerClientEvent('esx_ambulancejob:revive', eventData.id)
        local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")

        for _, xPlayer in pairs(Ambulance) do
            if xPlayer.job.name == 'ambulance' then
                xPlayer.triggerEvent('esx_ambulancejob:PlayerNotDead', eventData.id)
            end
        end
        deadPlayers[eventData.id] = nil
    end
end)

RegisterNetEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
    local source = source
    deadPlayers[source] = 'dead'
    local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")

    for _, xPlayer in pairs(Ambulance) do
        xPlayer.triggerEvent('esx_ambulancejob:PlayerDead', source)
    end
end)

RegisterNetEvent('esx_ambulancejob:onPlayerDistress')
AddEventHandler('esx_ambulancejob:onPlayerDistress', function()
    local source = source
    local injuredPed = GetPlayerPed(source)
    local injuredCoords = GetEntityCoords(injuredPed)

    if deadPlayers[source] then
        deadPlayers[source] = 'distress'
        local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")

        for _, xPlayer in pairs(Ambulance) do
            xPlayer.triggerEvent('esx_ambulancejob:PlayerDistressed', source, injuredCoords)
        end
    end
end)

RegisterNetEvent('esx:onPlayerSpawn')
AddEventHandler('esx:onPlayerSpawn', function()
    local source = source
    if deadPlayers[source] then
        deadPlayers[source] = nil
        local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")

        for _, xPlayer in pairs(Ambulance) do
            xPlayer.triggerEvent('esx_ambulancejob:PlayerNotDead', source)
        end
    end
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
    if deadPlayers[playerId] then
        deadPlayers[playerId] = nil
        local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")

        for _, xPlayer in pairs(Ambulance) do
            if xPlayer.job.name == 'ambulance' then
                xPlayer.triggerEvent('esx_ambulancejob:PlayerNotDead', playerId)
            end
        end
    end
end)

ESX.RegisterServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    if AmbulanceConfig.RemoveCashAfterRPDeath then
        if xPlayer.getMoney() > 0 then
            xPlayer.removeMoney(xPlayer.getMoney(), "Death")
        end

        if xPlayer.getAccount('black_money').money > 0 then
            xPlayer.setAccountMoney('black_money', 0, "Death")
        end
    end

    if AmbulanceConfig.RemoveItemsAfterRPDeath then
        for i = 1, #xPlayer.inventory, 1 do
            if xPlayer.inventory[i].count > 0 then
                xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
            end
        end
    end

    local playerLoadout = {}
    if AmbulanceConfig.RemoveWeaponsAfterRPDeath then
        for i = 1, #xPlayer.loadout, 1 do
            xPlayer.removeWeapon(xPlayer.loadout[i].name)
        end
    else -- save weapons & restore em' since spawnmanager removes them
        for i = 1, #xPlayer.loadout, 1 do
            table.insert(playerLoadout, xPlayer.loadout[i])
        end

        -- give back wepaons after a couple of seconds
        CreateThread(function()
            Wait(5000)
            for i = 1, #playerLoadout, 1 do
                if playerLoadout[i].label ~= nil then
                    xPlayer.addWeapon(playerLoadout[i].name, playerLoadout[i].ammo)
                end
            end
        end)
    end

    cb()
end)

ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.scalar('SELECT is_dead FROM users WHERE identifier = ?', { xPlayer.identifier }, function(isDead)
        cb(isDead)
    end)
end)

RegisterNetEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function(isDead)
    local xPlayer = ESX.GetPlayerFromId(source)

    if type(isDead) == 'boolean' then
        MySQL.update('UPDATE users SET is_dead = ? WHERE identifier = ?', { isDead, xPlayer.identifier })

        if not isDead then
            local Ambulance = ESX.GetExtendedPlayers("job", "ambulance")
            for _, xPlayer in pairs(Ambulance) do
                xPlayer.triggerEvent('esx_ambulancejob:PlayerNotDead', source)
            end
        end
    end
end)

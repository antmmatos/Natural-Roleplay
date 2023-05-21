--░█████╗░░█████╗░███╗░░░███╗███╗░░░███╗░█████╗░███╗░░██╗██████╗░░██████╗
--██╔══██╗██╔══██╗████╗░████║████╗░████║██╔══██╗████╗░██║██╔══██╗██╔════╝
--██║░░╚═╝██║░░██║██╔████╔██║██╔████╔██║███████║██╔██╗██║██║░░██║╚█████╗░
--██║░░██╗██║░░██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚████║██║░░██║░╚═══██╗
--╚█████╔╝╚█████╔╝██║░╚═╝░██║██║░╚═╝░██║██║░░██║██║░╚███║██████╔╝██████╔╝
--░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═════╝░╚═════╝░

ESX.RegisterCommand("repairweapon", "admin", function(xPlayer, args)
    if args[1] and tonumber(args[1]) then
        TriggerClientEvent('weapons:client:SetWeaponQuality', xPlayer.source, tonumber(args[1]))
    else
        TriggerClientEvent('weapons:client:SetWeaponQuality', xPlayer.source, 100)
    end
end)

ESX.RegisterCommand("changeserie", "admin", function(xPlayer, args)
    TriggerClientEvent('weapons:client:SetWeaponSerie', xPlayer.source)
end)

ESX.RegisterCommand(Config.Commands["giveweapon"], 'admin', function(xPlayer, args)
    TriggerEvent('giveweapon:command', args)
end, true, {
    help = 'Giveitem',
    validate = false,
    arguments = {
        { name = 'player', help = 'Player ID',           type = 'number' },
        { name = 'weapon', help = 'Weapon Name',         type = 'string' },
        { name = 'ammo',   help = 'Quantity of bullets', type = 'number' }
    }
})

ESX.RegisterCommand(Config.Commands["giveweaponcolor"], 'admin', function(xPlayer, args)
    TriggerEvent('giveweaponcolor:command', args)
end, true, {
    help = 'Giveitem',
    validate = true,
    arguments = {
        { name = 'player', help = 'Player ID',                                                  type = 'number' },
        { name = 'weapon', help = 'Weapon Name',                                                type = 'string' },
        { name = 'ammo',   help = 'Quantity of bullets',                                        type = 'number' },
        { name = 'color',  help = 'Options: green, gold, pink, army, lspd, orange or platinum', type = 'string' },
    }
})

ESX.RegisterCommand(Config.Commands["giveitem"], 'admin', function(xPlayer, args)
    TriggerEvent('giveitem:command', args)
end, true, {
    help = 'Giveitem',
    validate = true,
    arguments = {
        { name = 'player', help = 'Player',    type = 'number' },
        { name = 'item',   help = 'Item name', type = 'string' },
        { name = 'count',  help = 'Quantity',  type = 'number' }
    }
})

ESX.RegisterCommand(Config.Commands["randomitems"], "admin", function(xPlayer, args)
    TriggerEvent('randomitems:command', xPlayer.source)
end)

ESX.RegisterCommand(Config.Commands["clearinventory"], "admin", function(xPlayer, args)
    TriggerEvent('clearinventory:command', xPlayer.source, args)
end)

ESX.RegisterCommand(Config.Commands["openinventorytarget"], "admin", function(xPlayer, args)
    if args[1] then
        local id = tonumber(args[1])
        local Player = ESX.GetPlayerFromId(id)
        if Player then
            sendToDiscordAdminLog(xPlayer.source, id)
            TriggerClientEvent("inventory:client:RobPlayer:Admin", xPlayer.source, id)
        else
            TriggerClientEvent('qs-inventory:sendMessage', xPlayer.source, "Player Is Not Online", "error")
        end
    end
end)

ESX.RegisterCommand(Config.Commands["opentrunk"], "admin", function(xPlayer, args)
    local plate
    if args[1] then
        if args[1] and args[2] then
            plate = args[1] .. ' ' .. args[2]
        else
            plate = args[1]
        end
        local other = {
            maxweight = 100000,
            slots = 41,
        }
        TriggerClientEvent('inventory:server:Trunk:Admin', xPlayer.source, plate, other)
    end
end)

ESX.RegisterCommand(Config.Commands["openglovebox"], "admin", function(xPlayer, args)
    local plate
    if args[1] then
        if args[1] and args[2] then
            plate = args[1] .. ' ' .. args[2]
        else
            plate = args[1]
        end
        TriggerClientEvent('inventory:server:Glovebox:Admin', xPlayer.source, plate)
    end
end)

function Startup(source, xPlayer)
    MySQL.query('SELECT peds FROM pedmanager WHERE identifier = ?', {
        xPlayer.identifier
    }, function(result)
        if result[1] then
            TriggerClientEvent('Natural:Client:PedManager:Setup', source, json.decode(result[1].peds))
        else
            MySQL.query('INSERT INTO pedmanager (identifier, peds) VALUES (?, ?)', { xPlayer.identifier, "{}" })
        end
    end)
end

RegisterServerEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source, xPlayer)
    Startup(source, xPlayer)
end)

RegisterCommand('addped', function(source, args, rawCommand)
    if exports["NaturalScripting"]:isAllowedTo(source, "admin") and args[1] and tonumber(args[1]) and args[2] and args[3] then
        local xPlayer = ESX.GetPlayerFromId(source)
        local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
        MySQL.query('SELECT peds FROM pedmanager WHERE identifier = ?', {
            xTarget.identifier
        }, function(result)
            if result[1] then
                local data = json.decode(result[1].peds)
                for k, v in pairs(data) do
                    if v.model == args[2] then
                        xPlayer.showNotification("Esse membro já tem esse ped", "warning")
                        return
                    end
                end
                table.insert(data, { label = args[3], model = args[2] })
                MySQL.query('UPDATE pedmanager SET peds = ? WHERE identifier = ?',
                    { json.encode(data), xTarget.identifier })
                xPlayer.showNotification("Ped adicionado com sucesso", "success")
                TriggerClientEvent('Natural:Client:PedManager:Setup', xTarget.source, data)
            else
                xPlayer.showNotification("O jogador em questão tem o valor indefinido", "warning")
            end
        end)
    end
end)

RegisterCommand('removeped', function(source, args, rawCommand)
    if exports["NaturalScripting"]:isAllowedTo(source, "admin") then
        local xPlayer = ESX.GetPlayerFromId(source)
        local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
        MySQL.query('SELECT peds FROM pedmanager WHERE identifier = ?', {
            xTarget.identifier
        }, function(result)
            if result[1] then
                local data = json.decode(result[1].peds)
                for k, v in pairs(data) do
                    if v.model == args[2] then
                        table.remove(data, k)
                        MySQL.query('UPDATE pedmanager SET peds = ? WHERE identifier = ?',
                            { json.encode(data), xTarget.identifier })
                        xPlayer.showNotification("Ped removido com sucesso", "success")
                        TriggerClientEvent('Natural:Client:PedManager:Setup', xTarget.source, data)
                        return
                    end
                end
                xPlayer.showNotification("Esse membro não tem esse ped", "warning")
            else
                xPlayer.showNotification("O jogador em questão tem o valor indefinido", "warning")
            end
        end)
    end
end)

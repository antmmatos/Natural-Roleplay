if Config.OpenType == "item" then
    ESX.RegisterUsableItem(Config.Item, function(source, item)
        TriggerClientEvent("zerio-radio:client:open", source)
    end)
end

function fetchSql(query, cb)
    MySQL.Async.fetchAll(query, {}, function(result)
        cb(result)
    end)
end
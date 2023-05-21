RegisterServerEvent('mechanic:sv:removeCash')
AddEventHandler('mechanic:sv:removeCash', function(amount)
	local src = source

    amount = tonumber(amount)
    if (not amount or amount <= 0) then return end
    
    TriggerEvent("esx_society:getSociety", ESX.GetPlayerFromId(source).job.name, function (account)
        print(json.encode(account))
    end)
end)
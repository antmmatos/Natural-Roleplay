ESX.RegisterUsableItem('repairkit', function(source)
	local _source = source
	TriggerClientEvent('Natural:Client:RepairKit:Use', _source)
end)

RegisterNetEvent('Natural:Server:RepairKit:RemoveKit')
AddEventHandler('Natural:Server:RepairKit:RemoveKit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeInventoryItem('repairkit', 1)
end)
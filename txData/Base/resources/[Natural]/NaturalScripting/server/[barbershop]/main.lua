RegisterNetEvent('esx_barbershop:pay', function()
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	if not xPlayer and src then return print(('^3[WARNING]^0 xPlayer for Id %s, couldn`t be found.'):format(src)) end

	xPlayer.removeMoney(BarberConfig.Price, "Haircut")
	TriggerClientEvent('esx:showNotification', src, "Pagaste " .. ESX.Math.GroupDigits(BarberConfig.Price), "success")
end)

ESX.RegisterServerCallback('esx_barbershop:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if not xPlayer and source then return print(('^3[WARNING]^0 xPlayer for Id %s, couldn`t be found.'):format(source)) end

	cb(xPlayer.getMoney() >= BarberConfig.Price)
end)

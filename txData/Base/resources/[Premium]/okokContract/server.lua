local Webhook = 'https://discord.com/api/webhooks/1107313260673368125/tOhS8Pvtiuzz6Ga60Y0GqJePFDfaVVIC7Aua1GdZmJ7vlrKFaPSYe6TfJHPS_SwigQhD'
local sellingVehicles = {}
RegisterServerEvent('okokContract:changeVehicleOwner')
AddEventHandler('okokContract:changeVehicleOwner', function(data)
	_source = data.sourceIDSeller
	target = data.targetIDSeller
	plate = data.plateNumberSeller
	model = data.modelSeller
	source_name = data.sourceNameSeller
	target_name = data.targetNameSeller
	vehicle_price = tonumber(data.vehicle_price)

	if sellingVehicles["veh_".._source] == nil then return end

	local xPlayer = ESX.GetPlayerFromId(_source)
	local tPlayer = ESX.GetPlayerFromId(target)
	local webhookData = {
		model = model,
		plate = plate,
		target_name = target_name,
		source_name = source_name,
		vehicle_price = vehicle_price,
		xPlayerIdentifier = xPlayer.identifier,
		tPlayerIdentifier = tPlayer.identifier,
	}
	local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @identifier AND plate = @plate', {
		['@identifier'] = xPlayer.identifier,
		['@plate'] = plate
	})

	if Config.RemoveMoneyOnSign then
		local bankMoney = tPlayer.getAccount('bank').money

		if result[1] ~= nil  then
			if bankMoney >= vehicle_price then
				MySQL.Async.execute('UPDATE owned_vehicles SET owner = @target WHERE owner = @owner AND plate = @plate', {
					['@owner'] = xPlayer.identifier,
					['@target'] = tPlayer.identifier,
					['@plate'] = plate
				}, function (result2)
					if result2 ~= 0 then	
						tPlayer.removeAccountMoney('bank', vehicle_price)
						xPlayer.addAccountMoney('bank', vehicle_price)
						sellingVehicles["veh_".._source] = nil
						TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", "Você vendeu o veículo com sucesso <b>"..model.."</b> com o número da placa <b>"..plate.."</b>", 10000, 'sucesso')
						TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", "Você comprou o veículo com sucesso <b>"..model.."</b> com o número da placa <b>"..plate.."</b>", 10000, 'sucesso')

						if Webhook ~= '' then
							sellVehicleWebhook(webhookData)
						end
					end
				end)
			else
				TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", target_name.." não tem dinheiro suficiente para comprar seu veículo", 10000, 'error')
				TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", "Você não tem dinheiro suficiente para comprar "..source_name.."o veiculo", 10000, 'error')
			end
		else
			TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", "O veículo com o número da placa <b>"..plate.."</b> não é seu", 10000, 'erro')
			TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", source_name.." tentou vender-lhe um veículo que ele não possui", 10000, 'erro')
		end
	else
		if result[1] ~= nil then
			MySQL.Async.execute('UPDATE owned_vehicles SET owner = @target WHERE owner = @owner AND plate = @plate', {
				['@owner'] = xPlayer.identifier,
				['@target'] = tPlayer.identifier,
				['@plate'] = plate
			}, function (result2)
				if result2 ~= 0 then
					sellingVehicles["veh_".._source] = nil
					TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", "Você vendeu o veículo com sucesso <b>"..model.."</b> com o número da placa <b>"..plate.."</b>", 10000, 'sucesso')
					TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", "Você comprou o veículo com sucesso <b>"..model.."</b> com o número da placa <b>"..plate.."</b>", 10000, 'sucesso')

					if Webhook ~= '' then
						sellVehicleWebhook(webhookData)
					end
				end
			end)
		else
			TriggerClientEvent('okokNotify:Alert', _source, "VEHICLE", "O veículo com o número da placa <b>"..plate.."</b> não é seu", 10000, 'erro')
			TriggerClientEvent('okokNotify:Alert', target, "VEHICLE", source_name.." tentou vender-lhe um veículo que ele não possui", 10000, 'erro')
		end
	end
	TriggerClientEvent("okokContract:RemoveContractFromHand", target)
end)

ESX.RegisterServerCallback('okokContract:GetTargetName', function(source, cb, targetid)
	local target = ESX.GetPlayerFromId(targetid)
	local targetname = getName(target.identifier)

	cb(targetname)
end)

ESX.RegisterServerCallback('okokContract:checkIfOwnsVehicle', function(source, cb, plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @identifier AND plate = @plate', {
		['@identifier'] = xPlayer.identifier,
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

RegisterServerEvent('okokContract:Checker')
AddEventHandler('okokContract:Checker', function(plate)
	local _source = source

	sellingVehicles["veh_".._source] = {
		plate = plate
	}
end)

RegisterServerEvent('okokContract:SendVehicleInfo')
AddEventHandler('okokContract:SendVehicleInfo', function(description, price)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent('okokContract:GetVehicleInfo', _source, getName(xPlayer.identifier), os.date(Config.DateFormat), description, price, _source)
end)

RegisterServerEvent('okokContract:SendContractToBuyer')
AddEventHandler('okokContract:SendContractToBuyer', function(data)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if sellingVehicles["veh_".._source] ~= nil then
		TriggerClientEvent("okokContract:OpenContractOnBuyer", data.targetID, data)
		TriggerClientEvent('okokContract:startContractAnimation', data.targetID)
	end

	if Config.RemoveContractAfterUse then
		xPlayer.removeInventoryItem('contract', 1)
	end
end)

ESX.RegisterUsableItem('contract', function(source)
	local _source = source

	TriggerClientEvent('okokContract:OpenContractInfo', _source)
	TriggerClientEvent('okokContract:startContractAnimation', _source)
end)

function getName(identifier)
	local name = nil
	MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(db_name)
		if db_name[1] ~= nil then
			name = db_name[1].firstname.." "..db_name[1].lastname
		else
			name = ""
		end
	end)
	while name == nil do
		Citizen.Wait(2)
	end
	return name
end

-------------------------- SELL VEHICLE WEBHOOK

function sellVehicleWebhook(data)
	local information = {
		{
			["color"] = Config.sellVehicleWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["title"] = 'VEHICLE SALE',
			["description"] = '**Vehicle: **'..data.model..'**\nPlate: **'..data.plate..'**\nBuyer name: **'..data.target_name..'**\nBuyer Steam ID: **'..data.tPlayerIdentifier..'**\nSeller name: **'..data.source_name..'**\nSeller Steam ID: **'..data.xPlayerIdentifier..'**\nPrice: **'..data.vehicle_price..'€',

			["footer"] = {
				["text"] = os.date(Config.WebhookDateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end
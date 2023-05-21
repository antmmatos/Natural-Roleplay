ESX = exports.es_extended:getSharedObject()

Webhook = 'https://discord.com/api/webhooks/1107313412347801601/2khvENK-Axdllx4TwwA3FLzTmdewFrHzxX_kAIhMu1zrJ1SrrflA7EKxqKovlBvT_cTY' -- PUT YOUR WEBHOOK LINK HERE

function MySQLexecute(query, values, func)
	return MySQL.Async.execute(query, values, func)
end

function MySQLfetchAll(query, values, func)
	return MySQL.Async.fetchAll(query, values, func)
end

function getMoney(account, xPlayer)
	local money = xPlayer.getAccount(account)
	return money.money
end

function removeMoney(account, amount, xPlayer)
	xPlayer.removeAccountMoney(account, amount)
end

function addMoney(account, amount, xPlayer)
	xPlayer.addAccountMoney(account, amount)
end

function giveKeysToPlayer(source, identifier, vehPlate, vehName, isSociety, giveItem) -- Used when first giving keys to a player when they take out their vehicles
	if Config.UseOkokVehicleKeys and not Config.KeyMetaData.oxInventory then
		isSociety = isSociety or false
		local keyTable = {
			plate = tostring(vehPlate),
			vehiclename = vehName,
			isSociety = isSociety
		}
		if activeKeys[identifier] ~= nil then
			table.insert(activeKeys[identifier], keyTable)
		else
			activeKeys[identifier] = {}
			table.insert(activeKeys[identifier], keyTable)
		end
	elseif Config.KeyMetaData.oxInventory then
		if giveItem ~= false then
			exports[Config.KeyMetaData.inventoryResourceName]:AddItem(source, Config.KeyMetaData.keyItemName, 1, {plate = vehPlate, name = vehName})
		end
		isSociety = isSociety or false
		local keyTable = {
			plate = tostring(vehPlate),
			vehiclename = vehName,
			isSociety = isSociety
		}
		if activeKeys[identifier] ~= nil then
			table.insert(activeKeys[identifier], keyTable)
		else
			activeKeys[identifier] = {}
			table.insert(activeKeys[identifier], keyTable)
		end
	elseif Config.KeyMetaData.quasarInventory then
		if giveItem ~= false then
			TriggerEvent('qs-inventory:addItem', source, Config.KeyMetaData.keyItemName, 1, false, {
				Plate = vehPlate,
				Vehiclename = vehName,
				showAllDescriptions = true
			})
		end
		isSociety = isSociety or false
		local keyTable = {
			plate = tostring(vehPlate),
			vehiclename = vehName,
			isSociety = isSociety
		}
		if activeKeys[identifier] ~= nil then
			table.insert(activeKeys[identifier], keyTable)
		else
			activeKeys[identifier] = {}
			table.insert(activeKeys[identifier], keyTable)
		end
	elseif Config.KeyMetaData.coreInventory then
		if giveItem ~= false then
			local xPlayer = ESX.GetPlayerFromId(source)
			local invName = 'content-'..xPlayer.identifier
			invName = invName:gsub('%:', '')
			exports['core_inventory']:addItem(invName, Config.KeyMetaData.keyItemName, 1, {Plate = vehPlate, Vehiclename = vehName,})
		end
		isSociety = isSociety or false
		local keyTable = {
			plate = tostring(vehPlate),
			vehiclename = vehName,
			isSociety = isSociety
		}
		if activeKeys[identifier] ~= nil then
			table.insert(activeKeys[identifier], keyTable)
		else
			activeKeys[identifier] = {}
			table.insert(activeKeys[identifier], keyTable)
		end
	else
		-- Your key system goes here
	end
end

RegisterNetEvent(Config.EventPrefix..':removeKeys', function(id, plate)
    local source = id
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        if activeKeys[xPlayer.identifier] ~= nil then
            for k, v in pairs(activeKeys[xPlayer.identifier]) do
                if v.plate == plate then
                    activeKeys[xPlayer.identifier][k] = nil
                end
            end
        end
		if Config.KeyMetaData.oxInventory then
			local playerItems = exports.ox_inventory:GetInventoryItems(source)
			for k, v in pairs(playerItems) do
				if v.name == Config.KeyMetaData.keyItemName and tostring(v.metadata.plate):match( "^%s*(.-)%s*$" ) == plate:match( "^%s*(.-)%s*$" ) then
					local xPlayer = ESX.GetPlayerFromId(source)
					exports.ox_inventory:RemoveItem(source, Config.KeyMetaData.keyItemName, 1, false, v.slot)
					break
				end
			end
		elseif Config.KeyMetaData.quasarInventory then
			local xPlayer = ESX.GetPlayerFromId(source)
			local playerItems = xPlayer.getInventory()
			for k, v in pairs(playerItems) do
				if v.info ~= nil then
					if v.info.Plate ~= nil then
						if v.name == Config.KeyMetaData.keyItemName and tostring(v.info.Plate):match( "^%s*(.-)%s*$" ) == plate:match( "^%s*(.-)%s*$" ) then
							local qPlayer = QS.GetPlayerFromId(source)
							qPlayer.removeItem(Config.KeyMetaData.keyItemName, 1, v.slot)
							break
						end
					end
				end
			end
		elseif Config.KeyMetaData.coreInventory then
			local xPlayer = ESX.GetPlayerFromId(source)
			local invName = 'content-'..xPlayer.identifier
			invName = invName:gsub('%:', '')
			local playerItems = exports['core_inventory']:getItems(invName, Config.KeyMetaData.keyItemName)
			for k, v in pairs(playerItems) do
				if v.metadata ~= nil then
					if v.metadata.Plate ~= nil then
						if v.name == Config.KeyMetaData.keyItemName and tostring(v.metadata.Plate):match( "^%s*(.-)%s*$" ) == plate:match( "^%s*(.-)%s*$" ) then
							local xPlayer = ESX.GetPlayerFromId(source)
							xPlayer.removeInventoryItem(Config.KeyMetaData.keyItemName, 1, nil, v.slot)
							break
						end
					end
				end
			end
		end
    end
end)

function LockVehicle(vehicle, doorStatus, k, source, vehCoords, vehicles)
	if not tostring(GetConvar('onesync')) == "on" or tostring(GetConvar('onesync')) == "true" then
		if doorStatus <= 1 then -- Unlocked
			TriggerClientEvent(Config.EventPrefix..':LockVehicle', -1, k, 2, vehCoords, "lock")
			TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_locked').title, _L('vehicle_locked').text, _L('vehicle_locked').time, _L('vehicle_locked').type, false)
			TriggerClientEvent(Config.EventPrefix..':BlinkLights', -1, vehicles[k].entity, true)
			TriggerClientEvent(Config.EventPrefix..':PlayAnim', source)
		elseif doorStatus > 1 then -- Locked
			TriggerClientEvent(Config.EventPrefix..':LockVehicle', -1, k, 1, vehCoords, "unlock")
			TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_unlocked').title, _L('vehicle_unlocked').text, _L('vehicle_unlocked').time, _L('vehicle_unlocked').type, false)
			TriggerClientEvent(Config.EventPrefix..':BlinkLights', -1, vehicles[k].entity, false)
			TriggerClientEvent(Config.EventPrefix..':PlayAnim', source)
		end
	else
		if doorStatus <= 1 then -- Unlocked
			SetVehicleDoorsLocked(vehicle, 2) -- Locked here
			TriggerClientEvent(Config.EventPrefix..':PlayLockedAudio', -1, vehCoords, "lock")
			TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_locked').title, _L('vehicle_locked').text, _L('vehicle_locked').time, _L('vehicle_locked').type, false)
			TriggerClientEvent(Config.EventPrefix..':BlinkLights', -1, vehicles[k].entity, true)
			TriggerClientEvent(Config.EventPrefix..':PlayAnim', source)
		elseif doorStatus > 1 then -- Locked
			SetVehicleDoorsLocked(vehicle, 1) -- Unlocked here
			TriggerClientEvent(Config.EventPrefix..':notification', source, _L('vehicle_unlocked').title, _L('vehicle_unlocked').text, _L('vehicle_unlocked').time, _L('vehicle_unlocked').type, false)
			TriggerClientEvent(Config.EventPrefix..':PlayLockedAudio', -1, vehCoords, "unlock")
			TriggerClientEvent(Config.EventPrefix..':BlinkLights', -1, vehicles[k].entity, false)
			TriggerClientEvent(Config.EventPrefix..':PlayAnim', source)
		end
	end
end

function isAdminF(xPlayer)
	local playerGroup = xPlayer.getGroup()
	local isAdmin = false

	for k,v in ipairs(Config.AdminGroups) do
		if v == playerGroup then
			isAdmin = true
			break
		end
	end
	return isAdmin
end

RegisterServerEvent(Config.EventPrefix..":storeVehicle")
AddEventHandler(Config.EventPrefix..":storeVehicle", function(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, netID, vehName, garage_id, garage_type, garageInfo, vehModel)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local stored = false
	local finished = false
	if garage_id == nil then
		garage_id = ""
	end
	MySQLfetchAll('SELECT *, cast(`stored` as signed) as `stored` FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = vehicle_plate:match( "^%s*(.-)%s*$" ),
	}, function(vehicle)
		local db = vehicle[1]
		if db ~= nil then
			local sharedWith = db.sharedwith
			if type(sharedWith) ~= "table" then
				sharedWith = json.decode(sharedWith)
			end
			local mods = db.vehicle
			if type(mods) ~= "table" then
				mods = json.decode(mods)
			end
			
			if vehModel ~= mods.model then
				TriggerClientEvent(Config.EventPrefix..':notification', _source, _L('not_the_owner').title, _L('not_the_owner').text, _L('not_the_owner').time, _L('not_the_owner').type)
				return
			end

			if db.type == garage_type then
				if xPlayer.identifier == db.owner or sharedWith ~= nil and sharedWith[xPlayer.identifier] or xPlayer.job.name:lower() == db.job:lower() then
					storeVehicle(vehicle_plate,vehicle_props, tyreCondition, doorCondition, windowCondition, _source, nil, garage_id, garageInfo)
					stored = true
				else
					MySQLfetchAll('SELECT * FROM okokgarage_sharedgarages WHERE JSON_EXTRACT(sharedwith, @sharedwith) IS NOT NULL', {
						['@sharedwith'] = '$."'..xPlayer.identifier..'"'
					}, function(sharedWith)
						
						if sharedWith[1] ~= nil then
							for k, v in pairs(sharedWith) do
								if type(v.sharedwith) ~= "table" then
									v.sharedwith = json.decode(v.sharedwith)
								end
								for k2, v2 in pairs(v.sharedwith) do
									if v.owner == vehicle[1].owner and k2 == xPlayer.identifier then
										storeVehicle(vehicle_plate,vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
										stored = true
										return
									end
								end
							end
							if activeKeys[xPlayer.identifier] ~= nil then
								for k, v in pairs(activeKeys[xPlayer.identifier]) do
									if v.plate:match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
										activeKeys[xPlayer.identifier][k] = nil
										storeVehicle(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
										stored = true
										return
									end
								end
							end
						else
							if activeKeys[xPlayer.identifier] ~= nil then
								for k, v in pairs(activeKeys[xPlayer.identifier]) do
									if v.plate:match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
										activeKeys[xPlayer.identifier][k] = nil
										storeVehicle(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo, true, db.owner)
										stored = true
										return
									end
								end
							end
						end
					end)
				end
			else
				stored = true
			end
		else
			if Config.SocietyVehiclesList[xPlayer.getJob().name:lower()] ~= nil then
				for k, v in pairs(Config.SocietyVehiclesList[xPlayer.getJob().name:lower()]) do
					if activeKeys[xPlayer.identifier] ~= nil then
						for k2, v2 in pairs(activeKeys[xPlayer.identifier]) do
							if v.vehicleModel:lower() == v2.vehiclename:lower() then
								activeKeys[xPlayer.identifier][k2] = nil
								storeVehicle(vehicle_plate,vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
								stored = true
								break
							end
						end
					else
						storeVehicle(vehicle_plate,vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo)
						stored = true
						break
					end
				end
			end
		end
		finished = true
	end)
	while not finished do
		Wait(100)
	end
	if not stored and finished then
		TriggerClientEvent(Config.EventPrefix..':notification', _source, _L('not_the_owner').title, _L('not_the_owner').text, _L('not_the_owner').time, _L('not_the_owner').type)
	end
end)

function storeVehicle(vehicle_plate, vehicle_props, tyreCondition, doorCondition, windowCondition, _source, netID, garage_id, garageInfo, societyVehicle, society)
	local sqlParking = '@garage_name'
	if societyVehicle then
		if garageInfo.society ~= society then
			sqlParking = '`parking`'
		end
	else
		if garageInfo ~= nil then
			if garageInfo.society ~= "" and garageInfo.society ~= nil then
				sqlParking = '`parking`'
			end
		end
	end
	
	MySQLexecute('UPDATE owned_vehicles SET vehicle = @vehicle, `stored` = @stored, `tyrecondition` = @tyrecondition, `doorcondition` = @doorcondition, `windowcondition` = @windowcondition, `parking` = '..sqlParking..' WHERE plate = @plate', {
		['@stored'] = 1,
		['@vehicle'] = json.encode(vehicle_props),
		['@plate'] = vehicle_plate:match( "^%s*(.-)%s*$" ),
		['@tyrecondition'] = json.encode(tyreCondition),
		['@doorcondition'] = json.encode(doorCondition),
		['@windowcondition'] = json.encode(windowCondition),
		['@garage_name'] = garage_id
	}, function (rowsChanged)
		if vehicles[netID] ~= nil then
			vehicles[netID] = nil
		end
		if Config.KeyMetaData.oxInventory then
			local playerItems = exports.ox_inventory:GetInventoryItems(_source)
			for k, v in pairs(playerItems) do
				if v.name == Config.KeyMetaData.keyItemName and tostring(v.metadata.plate):match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
					local xPlayer = ESX.GetPlayerFromId(_source)
					exports.ox_inventory:RemoveItem(_source, Config.KeyMetaData.keyItemName, 1, false, v.slot)
					break
				end
			end
		elseif Config.KeyMetaData.quasarInventory then
			local xPlayer = ESX.GetPlayerFromId(_source)
			local playerItems = xPlayer.getInventory()
			for k, v in pairs(playerItems) do
				if v.info ~= nil then
					if v.info.Plate ~= nil then
						if v.name == Config.KeyMetaData.keyItemName and tostring(v.info.Plate):match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
							local qPlayer = QS.GetPlayerFromId(_source)
							qPlayer.removeItem(Config.KeyMetaData.keyItemName, 1, v.slot)
							break
						end
					end
				end
			end
		elseif Config.KeyMetaData.coreInventory then
			local xPlayer = ESX.GetPlayerFromId(_source)
			local invName = 'content-'..xPlayer.identifier
			invName = invName:gsub('%:', '')
			local playerItems = exports['core_inventory']:getItems(invName, Config.KeyMetaData.keyItemName)
			for k, v in pairs(playerItems) do
				if v.metadata ~= nil then
					if v.metadata.Plate ~= nil then
						if v.name == Config.KeyMetaData.keyItemName and tostring(v.metadata.Plate):match( "^%s*(.-)%s*$" ) == vehicle_plate:match( "^%s*(.-)%s*$" ) then
							local xPlayer = ESX.GetPlayerFromId(_source)
							xPlayer.removeInventoryItem(Config.KeyMetaData.keyItemName, 1, nil, v.slot)
							break
						end
					end
				end
			end
		end
		
		
		TriggerClientEvent(Config.EventPrefix..":storeVehicle", _source)
		TriggerClientEvent(Config.EventPrefix..':notification', _source, _L('vehicle_stored').title, _L('vehicle_stored').text, _L('vehicle_stored').time, _L('vehicle_stored').type)
		if Webhook ~= "" then
			data = {
				playerid = _source,
				type = "stored-vehicle",
				info = vehicle_plate:match( "^%s*(.-)%s*$" ),
			}

			discordWebhook(data)
		end
	end)
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function getName(identifier)
	local name = nil
	MySQLfetchAll('SELECT * FROM users WHERE identifier = @identifier', {
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

-------------------------- IDENTIFIERS

function ExtractIdentifiers(id)
	local identifiers = {
		steam = "",
		ip = "",
		discord = "",
		license = "",
		xbl = "",
		live = ""
	}

	for i = 0, GetNumPlayerIdentifiers(id) - 1 do
		local playerID = GetPlayerIdentifier(id, i)

		if string.find(playerID, "steam") then
			identifiers.steam = playerID
		elseif string.find(playerID, "ip") then
			identifiers.ip = playerID
		elseif string.find(playerID, "discord") then
			identifiers.discord = playerID
		elseif string.find(playerID, "license") then
			identifiers.license = playerID
		elseif string.find(playerID, "xbl") then
			identifiers.xbl = playerID
		elseif string.find(playerID, "live") then
			identifiers.live = playerID
		end
	end

	return identifiers
end

-------------------------- WEBHOOK

function discordWebhook(data)
	local color = '65352'
	local category = 'default'
	local item = ''
	local type = 'Plate'
	local identifierlist = ExtractIdentifiers(data.playerid)
	local identifier = identifierlist.license:gsub("license2:", "")
	local discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"

	if data.type == 'stored-vehicle' then
		color = Config.StoreVehicleWebhookColor
		category = 'Stored a vehicle'
		item = data.info
	elseif data.type == 'takeout-vehicle' then
		color = Config.TakeOutVehicleWebhookColor
		category = 'Took out a vehicle'
		item = data.info
	elseif data.type == 'share' then
		color = Config.ShareWebhookColor
		category = 'Shared'
		item = data.info
	elseif data.type == 'share-garage' then
		color = Config.ShareWebhookColor
		category = 'Shared'
		item = data.info
		type = 'Type'
	elseif data.type == 'transfer-vehicle' then
		color = Config.TransferWebhookColor
		category = 'Transfered vehicle'
		item = data.info
	elseif data.type == 'transfer-keys' then
		color = Config.TransferWebhookColor
		category = 'Transfered keys'
		item = data.info
	elseif data.type == 'buy-company' then
		color = Config.ShareWebhookColor
		category = 'Bought a company'
		item = data.info
		type = 'Company'
	elseif data.type == 'deposit-company' then
		color = Config.ShareWebhookColor
		category = 'Deposited **'..data.amount..'€**'
		item = data.info
		type = 'Company'
	elseif data.type == 'withdraw-company' then
		color = Config.ShareWebhookColor
		category = 'Withdrawn **'..data.amount..'€**'
		item = data.info
		type = 'Company'
	elseif data.type == 'create-garage' then
		color = Config.CompanyWebhookColor
		category = 'Created a garage'
		item = data.info..'\n**Price:** '..data.amount..'\n**Type:** '..data.garageType..'\n**Max owners:** '..data.maxOwners
		type = 'Name'
	elseif data.type == 'buy-garage' then
		color = Config.CompanyWebhookColor
		category = 'Bought a garage'
		item = data.info..'\n**Type:** '..data.garageType
		type = 'Name'
	elseif data.type == 'hired-company' then
		local identifierlistO = ExtractIdentifiers(data.owner)
		local identifierO = identifierlistO.license:gsub("license2:", "")
		local discordO = "<@"..identifierlistO.discord:gsub("discord:", "")..">"
		color = Config.CompanyWebhookColor
		category = 'Hired'
		item = data.info..'\n\n**Owner ID:** '..data.owner..'\n**Owner Identifier:** '..identifierO..'\n**Owner Discord:** '..discordO
		type = 'Company'
	elseif data.type == 'fired-company' then
		color = Config.CompanyWebhookColor
		category = 'Fired'
		item = data.info..'\n**Fired player identifier:** '..data.fired_identifier
		type = 'Company'
	elseif data.type == 'sell-company' then
		color = Config.CompanyWebhookColor
		category = 'Sold company'
		item = data.info
		type = 'Company'
	elseif data.type == 'leave-company' then
		color = Config.CompanyWebhookColor
		category = 'Left company'
		item = data.info
		type = 'Company'
	elseif data.type == 'gave-vehicle' then
		local identifierlistr = ExtractIdentifiers(data.receiver)
		local identifierr = identifierlistr.license:gsub("license2:", "")
		local discordr = "<@"..identifierlistr.discord:gsub("discord:", "")..">"

		color = Config.CompanyWebhookColor
		category = 'Gave a vehicle (Admin)'
		item = data.model..'\n**Plate:** '..data.plate..'\n**Receiver ID:** '..data.receiver..'\n**Receiver identifier:** '..identifierr..'\n**Receiver Discord:** '..discordr
		type = 'Model'
	elseif data.type == 'gave-vehicle-society' then
		color = Config.CompanyWebhookColor
		category = 'Gave a vehicle (Admin)'
		item = data.model..'\n**Plate:** '..data.plate..'\n**Receiver ID:** '..data.receiver
		type = 'Model'
	end

	local information = {
		{
			["color"] = color,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["title"] = 'GARAGE',
			["description"] = '**Action:** '..category..'\n**'..type..':** '..item..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..identifier..'\n**Discord:** '..discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}

	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end
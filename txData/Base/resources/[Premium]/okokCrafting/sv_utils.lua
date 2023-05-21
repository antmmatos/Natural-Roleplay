ESX = exports.es_extended:getSharedObject()

Webhook = 'https://discord.com/api/webhooks/1107313333159329854/QV4xUPb2qqyPdIOCuTpWWZAq8FT5Y9788DJAywTzGNSBYLib4q2Rv4eem1FdswT9Yla5'

function getMoney(type, xPlayer)
	local moneyCount = 0
	if type == "money" then
		moneyCount = xPlayer.getAccount(type).money
	else
		moneyCount = xPlayer.getAccount(type).money
	end

	return moneyCount
end

function addMoney(type, value, xPlayer)
	xPlayer.addAccountMoney(type, value)
end

function removeMoney(type, value, xPlayer)
	xPlayer.removeAccountMoney(type, value)
end

function canCarryIt(item, amount, xPlayer)
	return xPlayer.canCarryItem(item, amount) -- In case you use ESX 1.1 change 'xPlayer.canCarryItem(item, amount)' to 'true'
end

function addItem(xPlayer, item, amount, data)
	xPlayer.addInventoryItem(item, tonumber(amount))
end

function removeItem(xPlayer, item, amount)
	xPlayer.removeInventoryItem(item, tonumber(amount))
end

function hasWeapon(xPlayer, item)
	xPlayer.hasWeapon(item)
end

function addWeapon(xPlayer, item, amount, data)
	xPlayer.addWeapon(item, tonumber(amount))
end

function hasPermission(source)
	local staff = false
	
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerGroup = xPlayer.getGroup()

	for k,v in ipairs(Config.AdminGroups) do
		if playerGroup == v then 
			staff = true
			break
		end
	end

	return staff
end

function MySQLexecute(query, values, func)
	return MySQL.Async.execute(query, values, func)
end

function MySQLfetchAll(query, values, func)
	return MySQL.Async.fetchAll(query, values, func)
end

function giveXP(xPlayer, xp, workbench)
	if Config.SameLevelForAllTables then
		MySQLexecute('UPDATE users SET '..Config.xpColumnsName..' = xp+@xp WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier,
			['@xp'] = Config.DoubleXP and xp*2 or xp,
		}, function (result)
			TriggerClientEvent(Config.EventPrefix..':updateXP', xPlayer.source)
		end)
	else
		MySQLexecute('UPDATE users SET '..Config.xpColumnsName..' = JSON_SET(xp, @table, JSON_EXTRACT(xp, @table) + @xp) WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier,
			['@xp'] = Config.DoubleXP and xp*2 or xp,
			['@table'] = "$."..workbench,
		}, function (result)
			TriggerClientEvent(Config.EventPrefix..':updateXP', xPlayer.source)
		end)
	end
end

ESX.RegisterServerCallback(Config.EventPrefix..":inv2", function(source, cb, item, isMoney)
	local xPlayer = ESX.GetPlayerFromId(source)
	local itemS = {}
	if isMoney == "false" then
		isMoney = false
	elseif isMoney == "true" then
		isMoney = true
	end
	if isMoney then
		local playerMoney = getMoney(item, xPlayer)
		itemS.name = item
		itemS.count = tonumber(playerMoney)
	else
		itemS = xPlayer.getInventoryItem(item)
		if itemS == nil then
			itemS = {
				name = item,
				count = 0
			}
		end
		if itemS.count == nil then
			itemS.count = 0
			itemS.name = item
		end
	end

	cb(itemS)
end)

ESX.RegisterServerCallback(Config.EventPrefix..":maxCraft", function(source, cb, recipe, maxCraftAmount, isDisassemble, itemC, itmNeeded)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local maxCraft = tonumber(maxCraftAmount)
	local itemAmt = 0 
	if not isDisassemble then
		for k,v in ipairs(recipe) do
			local item = {}
			local itemCount = 0

			if v[4] then
				itemCount = getMoney(v[1], xPlayer)
			else
				item = xPlayer.getInventoryItem(v[1])
				itemCount = tonumber(item.count)

			end

			if itemCount == nil then
				itemCount = 0
			end

			if itemCount > 0 then
				local possibleToCraft = itemCount/tonumber(v[2])
				if possibleToCraft > 0 then
					if maxCraft > possibleToCraft then
						maxCraft = possibleToCraft
					end
				else
					maxCraft = 0
					break
				end
			else
				maxCraft = 0
				break
			end
		end
	else
		local item = xPlayer.getInventoryItem(itemC)
		itemAmt = tonumber(item.count)
		if itemAmt > 0 then
			local possibleToCraft = itemAmt/tonumber(itmNeeded)
			if possibleToCraft > 0 then
				if maxCraft > possibleToCraft then
					maxCraft = possibleToCraft
				end
			else
				maxCraft = 0
			end
		else
			maxCraft = 0
		end
	end
	
	cb(math.floor(maxCraft), itemAmt)
end)

ESX.RegisterServerCallback(Config.EventPrefix..":CanCraftItem", function(source, cb, itemID, recipe, itemName, amount, isItem, workbench, timeCraft, CraftQueues, xp, pc, isDis, itemData)
	local xPlayer = ESX.GetPlayerFromId(source)
	local canCraft = true
	if not isDis then
		for k,v in pairs(recipe) do
			if v[4] == "false" then
				local item = xPlayer.getInventoryItem(v[1])

				if tonumber(item.count) < tonumber(v[2]) then
					canCraft = false
				end
			else
				local playerMoney = getMoney(v[1], xPlayer)
				if playerMoney < tonumber(v[2]) then
					canCraft = false
				end
			end
		end
	else
		local item = xPlayer.getInventoryItem(itemID)

		if tonumber(item.count) < tonumber(amount) then
			canCraft = false
		end
	end

	if canCraft then
		if not isDis then
			for k,v in pairs(recipe) do
				if v[3] == "true" then
					if v[4] == "true" then
						removeMoney(v[1], tonumber(v[2]), xPlayer)
					else
						removeItem(xPlayer, v[1], tonumber(v[2]))
					end
				end
			end
		else
			removeItem(xPlayer, itemID, tonumber(amount))
		end
		local queue = CraftQueues
		if queue ~= nil and queue[workbench] ~= nil then
			queue[workbench][#queue[workbench]+1] = {
				item = itemID,
				recipe = recipe,
				amount = tonumber(amount),
				isItem = isItem,
				time = timeCraft,
				itemName = itemName[itemID],
				isDone = false,
				isPending = true,
				randomID = math.random(100000000, 999999999),
				xp = xp,
				sucPC = pc,
				suc = true,
				isDis = isDis,
				data = itemData
			}
			
			MySQLexecute('UPDATE users SET okokcrafts = @okokcrafts WHERE identifier = @identifier', {
				['@identifier'] = xPlayer.identifier,
				['@okokcrafts'] = json.encode(queue),
			}, function (result)
				TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.source, _L('added_to_queue').title, interp(_L('added_to_queue').text, {s1 = itemName[itemID]}), _L('added_to_queue').time, _L('added_to_queue').type)

				if Webhook ~= "" then
					data = {
						playerid = xPlayer.source,
						type = "start-craft",
						item = itemName[itemID],
						amount = tonumber(amount),
					}

					discordWebhook(data)
				end

				cb(queue)
			end)
		else
			if queue == nil then
				queue = {}
			end
			queue[workbench] = {}
			queue[workbench] = {
				[1] = {
					item = itemID,
					recipe = recipe,
					amount = tonumber(amount),
					isItem = isItem,
					time = timeCraft,
					itemName = itemName[itemID],
					isDone = false,
					isPending = true,
					randomID = math.random(100000000, 999999999),
					xp = xp,
					sucPC = pc,
					suc = true,
					isDis = isDis,
					data = itemData
				}
			}
			
			MySQLexecute('UPDATE users SET okokcrafts = @okokcrafts WHERE identifier = @identifier', {
				['@identifier'] = xPlayer.identifier,
				['@okokcrafts'] = json.encode(queue),
			}, function (result)
				TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.source, _L('added_to_queue').title, interp(_L('added_to_queue').text, {s1 = itemName[itemID]}), _L('added_to_queue').time, _L('added_to_queue').type)
				
				if Webhook ~= "" then
					data = {
						playerid = xPlayer.source,
						type = "start-craft",
						item = itemName[itemID],
						amount = tonumber(amount),
					}
					discordWebhook(data)
				end

				cb(queue)
			end)
		end
	else
		TriggerClientEvent(Config.EventPrefix..':notification', xPlayer.source, _L('cant_craft').title, interp(_L('cant_craft').text, {s1 = itemName[itemID]}), _L('cant_craft').time, _L('cant_craft').type)
		cb(false)
	end
end)

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
	local amount = ''
	local identifierlist = ExtractIdentifiers(data.playerid)
	local identifier = identifierlist.license:gsub("license2:", "")
	local discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"

	if data.type == 'start-craft' then
		color = Config.StartCraftWebhookColor
		category = 'Started a craft'
		item = data.item
		amount = data.amount
	elseif data.type == 'cancel-craft' then
		color = Config.CancelWebhookColor
		category = 'Canceled a craft'
		item = data.item
		amount = data.amount
	elseif data.type == 'claim-craft' then
		color = Config.ClaimCraftWebhookColor
		category = 'Claimed'
		item = data.item
		amount = data.amount
	elseif data.type == 'failed-craft' then
		color = Config.FailedCraftWebhookColor
		category = 'Failed a craft'
		item = data.item
		amount = data.amount
	end

	local information = {
		{
			["color"] = color,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Logs',
			},
			["title"] = 'CRAFTING',
			["description"] = '**Action:** '..category..'\n**Item:** '..item..'\n**Amount:** '..amount..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..identifier..'\n**Discord:** '..discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}

	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end
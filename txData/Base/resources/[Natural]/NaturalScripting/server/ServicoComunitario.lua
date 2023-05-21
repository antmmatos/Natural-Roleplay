ESX = exports['es_extended']:getSharedObject()
function GetPlayer(source)
	return ESX.GetPlayerFromId(source)
end

function GetIdentifier(source)
	local Player = GetPlayer(source)
	return Player.identifier
end

function showNotification(source, msg, type)
	TriggerClientEvent('esx:showNotification', source, "Serviço Comunitário", msg, 2000, type)
end

function getPlayerName(player)
	local name = player.getName()
	return name
end

sendToService = function(target, actions)
	local targetPlayer = GetPlayer(target)

	if targetPlayer then
		if actions == nil then
			showNotification(source, 'Valor inválido', 'error')
		else
			showNotification(source, 'Jogador enviado para o serviço comunitário', 'success')
			showNotification(target, 'Estás no serviço comunitário com ' .. actions .. ' ações!', 'success')
			TriggerClientEvent('JD_CommunityService:beginService', target, actions)
			updateService(target, actions)
			local name = getPlayerName(targetPlayer)
			exports["NaturalScripting"]:LogToDiscord(source, "", "Serviço Comunitário", "**" .. name .. "** foi enviado para o serviço comunitário por **" .. actions .. "** meses!")
		end
	else
		showNotification(source, 'Valor inválido', 'error')
	end
end

updateService = function(target, actions)
	local _source = target -- cannot parse source to client trigger for some weird reason
	local Player = GetPlayer(_source)
	local identifier = Player.identifier

	local currentCount = MySQL.scalar.await('SELECT actions_remaining FROM communityservice WHERE identifier = ?',
		{ identifier })
	if currentCount then
		local updateRows = MySQL.update.await('UPDATE communityservice SET actions_remaining = ? WHERE identifier = ?',
			{ actions, identifier })
	else
		local insert = MySQL.insert.await('INSERT INTO communityservice (identifier, actions_remaining) VALUES (?, ?)',
			{ identifier, actions })
	end
end

lib.callback.register('JD_CommunityService:completeService', function()
	local _source = source -- cannot parse source to client trigger for some weird reason
	local Player = GetPlayer(_source)
	local identifier = Player.identifier
	MySQL.query.await('DELETE FROM communityservice WHERE identifier = ?', { identifier })
end)

lib.callback.register('JD_CommunityService:getCurrentActions', function()
	local _source = source -- cannot parse source to client trigger for some weird reason
	local Player = GetPlayer(_source)
	local identifier = Player.identifier
	local count = MySQL.scalar.await('SELECT actions_remaining FROM communityservice WHERE identifier = ?',
		{ identifier })
	return count
end)

RegisterCommand('comservpolice', function(source)
	local _source = source -- cannot parse source to client trigger for some weird reason
	local Player = GetPlayer(_source)

	if Player.job.name == "police" then
		local input = lib.callback.await('JD_CommunityService:inputCallback', source)
		if input == nil then
		else
			local targetID = tonumber(input[1])
			local actionCount = input[2]
			sendToService(targetID, actionCount)
		end
	else
		showNotification(source, 'Sem permissão', 'error')
	end
end)

RegisterCommand('comserv', function(source)
	local _source = source -- cannot parse source to client trigger for some weird reason
	if not exports["UpStaffManagement"]:isAllowedTo(_source, "estagiario") then
		return
	end
	local Player = GetPlayer(_source)
	local input = lib.callback.await('JD_CommunityService:inputCallback', source)
	if input == nil then
	else
		local targetID = tonumber(input[1])
		local actionCount = input[2]
		sendToService(targetID, actionCount)
	end
end)

RegisterCommand('endcomservpolice', function(source)
	local _source = source -- cannot parse source to client trigger for some weird reason
	local Player = GetPlayer(_source)

	if Player.job.name == "police" then
		local input = lib.callback.await('JD_CommunityService:inputCallbackRelease', source)
		if input == nil then
		else
			local realeased = GetPlayer(input[1])
			local realeaser = GetPlayer(_source)
			local name = getPlayerName(realeased)
			local name2 = getPlayerName(realeaser)
			exports["NaturalScripting"]:LogToDiscord(source, "https://discord.com/api/webhooks/1107321061214802011/1i_BB4tedDQbX0mmDFhnLi6RgvPKix9FbvJ4pFZohOIZx7HuzoNVOO-05bEL_wBdWZSM", "Serviço Comunitário", "**" .. name .. "** foi libertado do serviço comunitário por **" .. name2 .. "**!")
			TriggerClientEvent('JD_CommunityService:releaseService', input[1])
		end
	else
		showNotification(source, 'Sem permissão', 'error')
	end
end)

RegisterCommand('endcomserv', function(source)
	local _source = source -- cannot parse source to client trigger for some weird reason
	if not exports["UpStaffManagement"]:isAllowedTo(_source, "estagiario") then
		return
	end
	local Player = GetPlayer(_source)
	local input = lib.callback.await('JD_CommunityService:inputCallbackRelease', source)
	if input == nil then
	else
		local realeased = GetPlayer(input[1])
		local realeaser = GetPlayer(_source)
		local name = getPlayerName(realeased)
		local name2 = getPlayerName(realeaser)
		exports["NaturalScripting"]:LogToDiscord(source, "https://discord.com/api/webhooks/1107321061214802011/1i_BB4tedDQbX0mmDFhnLi6RgvPKix9FbvJ4pFZohOIZx7HuzoNVOO-05bEL_wBdWZSM", "Serviço Comunitário", "**" .. name .. "** foi libertado do serviço comunitário por **" .. name2 .. "**!")
		TriggerClientEvent('JD_CommunityService:releaseService', input[1])
	end
end, true)

lib.callback.register('JD_CommunityService:communityMenu', function()
	local _source = source -- cannot parse source to client trigger for some weird reason
	local Player = GetPlayer(_source)

	if Player.job.name == "police" then
		local input = lib.callback.await('JD_CommunityService:inputCallback', source)
		if input == nil then
		else
			local targetID = tonumber(input[1])
			local actionCount = input[2]
			sendToService(targetID, actionCount)
		end
	else
		showNotification(source, 'Sem permissão', 'error')
	end
end)
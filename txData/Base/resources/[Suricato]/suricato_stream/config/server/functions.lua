local Tunnel = _G["lib/Tunnel"..".lua"]()
local Proxy = _G["lib/Proxy"..".lua"]()
local vRP = Proxy.getInterface("vRP")
local config = require('config/server/config')

local toClient = {}
Tunnel.bindInterface(GetCurrentResourceName(), toClient)

function toClient.getPlayersOnline() 
	return #GetPlayers() 
end

local function isPlayerOnline(playerSource)
	local getPlayers = GetPlayers()
	for _,source in ipairs(getPlayers) do
		if tonumber(source) == playerSource then
			return true
		end
	end
	return false
end

function toClient.isPlayerReferenceOnline(playerReference)
    local playerSource = getPlayerSourceByServerReference(playerReference)
	return isPlayerOnline(playerSource) 
end

function toClient.getPlayerServerReference()
    local source = source
	local xPlayer = ESX.GetPlayerFromId(source)

    return xPlayer and xPlayer.playerId
end

function getPlayerServerReferenceBySource(playerSource)
	local xPlayer = ESX.GetPlayerFromId(playerSource)

    return xPlayer and xPlayer.playerId
end

function getPlayerSourceByServerReference(playerReference)
    return playerReference
end

function isPlayerAdmin(playerSource)
	local xPlayer = ESX.GetPlayerFromId(playerSource)
    local playerGroup = xPlayer.getGroup()

    return playerGroup == 'admin' or playerGroup == 'owner'
end

local function sendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local WEBHOOK_RECORD_MESSAGE = 
'```ini' .. '\n' ..
'[PASSAPORTE ADMIN]' .. '\n' ..
'%s' .. '\n' ..
'[PASSAPORTE SUSPEITO]' .. '\n' ..
'%s' .. '\n' ..
'```'

function sendWebhookRecordData(streamerSource, watcherSource)
    local watcherReference = getPlayerServerReferenceBySource(watcherSource)
    local streamerReference = getPlayerServerReferenceBySource(streamerSource)
    formattedMessage = WEBHOOK_RECORD_MESSAGE:format(watcherReference, streamerReference)
    sendWebhookMessage(config.discordWebhookLink, formattedMessage)
end
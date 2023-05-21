local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if isOnDuty and job.name ~= 'ambulance' then
		for playerId, v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		isOnDuty = false
	end
end)

RegisterNetEvent('esx_ambulancejob:PlayerDead')
AddEventHandler('esx_ambulancejob:PlayerDead', function(Player)
	deadPlayers[Player] = "dead"
end)

RegisterNetEvent('esx_ambulancejob:PlayerNotDead')
AddEventHandler('esx_ambulancejob:PlayerNotDead', function(Player)
	if deadPlayerBlips[Player] then
		RemoveBlip(deadPlayerBlips[Player])
		deadPlayerBlips[Player] = nil
	end
	deadPlayers[Player] = nil
end)

RegisterNetEvent('esx_ambulancejob:setDeadPlayers')
AddEventHandler('esx_ambulancejob:setDeadPlayers', function(_deadPlayers)
	deadPlayers = _deadPlayers

	if isOnDuty then
		for playerId, v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		for playerId, status in pairs(deadPlayers) do
			if AmbulanceConfig.Debug then
				print("[^2INFO^7] Player Dead | ^5" .. tostring(playerId) .. "^7")
			end
			if status == 'distress' then
				if AmbulanceConfig.Debug then
					print("[^2INFO^7] Creating Distress Blip for Player - ^5" .. tostring(playerId) .. "^7")
				end
				local player = GetPlayerFromServerId(playerId)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, 303)
				SetBlipColour(blip, 1)
				SetBlipFlashes(blip, true)
				SetBlipCategory(blip, 7)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName("Pessoa inconsciente")
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[playerId] = blip
			end
		end
	end
end)


RegisterNetEvent('esx_ambulancejob:PlayerDistressed')
AddEventHandler('esx_ambulancejob:PlayerDistressed', function(playerId, playerCoords)
	deadPlayers[playerId] = 'distress'

	if isOnDuty then
		if AmbulanceConfig.Debug then
			print("[^2INFO^7] Player Distress Recived - ID:^5" .. tostring(playerId) .. "^7")
		end
		ESX.ShowNotification("[DISPATCH]: Pessoa inconsciente reportada", "error")
		deadPlayerBlips[playerId] = nil

		local blip = AddBlipForCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		SetBlipSprite(blip, AmbulanceConfig.DistressBlip.Sprite)
		SetBlipColour(blip, AmbulanceConfig.DistressBlip.Color)
		SetBlipScale(blip, AmbulanceConfig.DistressBlip.Scale)
		SetBlipFlashes(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName("Pessoa inconsciente")
		EndTextCommandSetBlipName(blip)

		deadPlayerBlips[playerId] = blip
	end
end)

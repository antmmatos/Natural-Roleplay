local inService = false
local existingActions
local drawMarker = false
local markerData = nil
local obj
local ServiceLocations = {
	{ type = 'sweep', coords = vector4(158.8423, -1002.271, 28.35584, 37.37579) },
	{ type = 'sweep', coords = vector4(167.5971, -1003.667, 28.34581, 241.3034) },
	{ type = 'sweep', coords = vector4(144.6603, -994.816, 28.35664, 65.06136) },
	{ type = 'sweep', coords = vector4(178.3475, -1006.496, 28.33046, 246.9683) },
	{ type = 'sweep', coords = vector4(189.593, -1010.494, 28.31478, 251.131) },
	{ type = 'sweep', coords = vector4(198.8164, -1015.651, 28.30341, 236.8525) }
}

local Clothes = {
    male = {
        components = { { ["component_id"] = 0,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 1,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 3,["texture"] = 0,["drawable"] = 167 },
            { ["component_id"] = 4,["texture"] = 7,["drawable"] = 5 },
            { ["component_id"] = 5,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 6,["texture"] = 0,["drawable"] = 60 },
            { ["component_id"] = 7,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 8,["texture"] = 0,["drawable"] = 15 },
            { ["component_id"] = 9,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 10,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 11,["texture"] = 0,["drawable"] = 56 }, },
    },
    female = {
        components = { { ["component_id"] = 0,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 1,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 3,["texture"] = 0,["drawable"] = 398 },
            { ["component_id"] = 4,["texture"] = 15,["drawable"] = 3 },
            { ["component_id"] = 5,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 6,["texture"] = 0,["drawable"] = 49 },
            { ["component_id"] = 7,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 8,["texture"] = 0,["drawable"] = 15 },
            { ["component_id"] = 9,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 10,["texture"] = 0,["drawable"] = 0 },
            { ["component_id"] = 11,["texture"] = 0,["drawable"] = 118 }, },
    }
}

ESX = exports.es_extended:getSharedObject()
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
	Citizen.Wait(2000)
	local count = lib.callback.await('JD_CommunityService:getCurrentActions', false)
	if count ~= nil then
		beginService(count)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if drawMarker then
			DrawMarker(20, markerData.x, markerData.y, markerData.z + 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.4, 0.4, 0.4, 235,
				64, 52, 100, true, false, 2, true, false, false, false)
		else
			Wait(500)
		end
	end
end)

function onExit()
	if inService then
		local currentNumber = existingActions
		local extensionCount = 2
		existingActions = currentNumber + extensionCount
		ShowNotification('Tempo extendido para ' .. extensionCount .. ' ações!', 'info')
		tpToZone()
	end
end

lib.zones.poly({
	points = {
		vec3(117.0, -1000.0, 29.0),
		vec3(213.0, -1034.0, 29.0),
		vec3(277.0, -864.0, 29.0),
		vec3(180.0, -831.0, 29.0),
	},
	thickness = 16.0,
	debug = false,
	onExit = onExit
})

RegisterNetEvent('JD_CommunityService:beginService')
AddEventHandler('JD_CommunityService:beginService', function(count)
	beginService(count)
end)

RegisterNetEvent('JD_CommunityService:releaseService')
AddEventHandler('JD_CommunityService:releaseService', function(count)
	inService = false
	releaseZone()
	lib.callback('JD_CommunityService:completeService')
	ShowNotification('Serviço de comunidade concluído!', 'success')
end)

beginService = function(actionCount)
	existingActions = actionCount
	inService = true
	tpToZone()
	startActions()
	changeClothing()
end

startActions = function()
	local indexNumber = math.random(1, #ServiceLocations)

	drawMarker = true
	markerData = ServiceLocations[indexNumber].coords.xyz

	local point = lib.points.new(ServiceLocations[indexNumber].coords.xyz, 2, {})
	function point:onExit()
		lib.hideTextUI()
	end

	function point:nearby()
		lib.showTextUI('[E] - Limpar')
		if IsControlJustReleased(0, 38) then
			startSweep(point)
		end
	end

	local modelHash =
	`v_ind_rc_rubbishppr`

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
		end
	end

	obj = CreateObject(modelHash, ServiceLocations[indexNumber].coords.xyz, true)
end

tpToZone = function()
	SetEntityCoords(PlayerPedId(), vector4(161.7046, -1004.414, 29.36884, 163.6481))
end

releaseZone = function()
	returnClothing()
	lib.hideTextUI()
	SetEntityCoords(PlayerPedId(), vector4(426.8537, -978.7916, 30.71013, 86.49715))
end

removeInteracts = function()
	drawMarker = false
	markerData = nil
end

targetInteract = function(data)
	if data.name == 'sweep' then
		startSweep()
	end
end

startSweep = function(point)
	point:remove()
	lib.hideTextUI()
	lib.progressCircle({
		duration = 5000,
		label = 'Sweeping ground',
		useWhileDead = false,
		allowRagdoll = false,
		allowCuffed = false,
		allowFalling = false,
		canCancel = false,
		anim = { dict = 'amb@world_human_janitor@male@idle_a', clip = 'idle_a' },
		prop = {
			model = `prop_tool_broom`,
			bone = 28422,
			pos = { x = -0.005, y = 0.0, z = 0.0 },
			rot = { x = 360.0, y = 360.0, z = 0.0 }
		},
		disable = { move = true, combat = true }
	})

	existingActions = existingActions - 1
	if existingActions >= 1 then
		ShowNotification('Ações restantes: ' .. existingActions .. '!', 'info')
	end
	updateFunction()
end

updateFunction = function()
	removeInteracts()
	DeleteObject(obj)
	obj = nil
	if existingActions >= 1 then
		startActions()
	else
		inService = false
		releaseZone()
		lib.callback('JD_CommunityService:completeService')
		ShowNotification("Serviço comunidade concluído!", 'success')
	end
end

changeClothing = function()
	local gender = GetEntityModel(PlayerPedId())
	local PlayerPed = PlayerPedId()
	if gender == 'mp_m_freemode_01' then
		for k, v in pairs(Clothes.male.components) do
			SetPedComponentVariation(PlayerPed, v["component_id"], v["drawable"], v["texture"], 0)
		end
	else
		for k, v in pairs(Clothes.female.components) do
			SetPedComponentVariation(PlayerPed, v["component_id"], v["drawable"], v["texture"], 0)
		end
	end
end

returnClothing = function()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end

lib.callback.register('JD_CommunityService:inputCallback', function()
	local input = lib.inputDialog('Serviço Comunitário', { 'ID do jogador', 'Nr de ações' })
	if not input then return end
	return input
end)

lib.callback.register('JD_CommunityService:inputCallbackRelease', function()
	local input = lib.inputDialog('Serviço Comunitário', { 'ID do jogador' })
	if not input then return end
	return input
end)

ShowNotification = function(msg, type)
	ESX.ShowNotification("Serviço Comunitário", type)
end

Citizen.CreateThread(function()
	local sleep = 2000
	while true do
		if inService then
			sleep = 500
			local ped = PlayerPedId()
			if IsPedArmed(ped, 7) then
				SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
			end
		else
			sleep = 2000
		end
		Citizen.Wait(sleep)
	end
end)

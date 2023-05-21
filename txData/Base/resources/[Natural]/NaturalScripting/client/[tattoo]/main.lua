local currentTattoos, cam = {}, -1
local HasAlreadyEnteredMarker, CurrentAction, CurrentActionMsg
-- Correções de bugs
AddEventHandler('skinchanger:modelLoaded', function()
	ESX.TriggerServerCallback('esx_tattooshop:requestPlayerTattoos', function(tattooList)
		if tattooList then
			for k, v in pairs(tattooList) do
				ApplyPedOverlay(PlayerPedId(), GetHashKey(v.collection),
					GetHashKey(ConfigTattoo.TattooList[v.collection][v.texture].nameHash))
			end

			currentTattoos = tattooList
		end
	end)
end)
isMenuOpen = false
function OpenShopMenu()
	isMenuOpen = true
	local elements = {}

	for k, v in pairs(ConfigTattoo.TattooCategories) do
		table.insert(elements, { label = v.name, value = v.value })
	end

	if DoesCamExist(cam) then
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tattoo_shop', {
		title    = "Tatuagens",
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		local currentLabel, currentValue = data.current.label, data.current.value

		if data.current.value then
			elements = { { label = "Voltar ao menu anterior", value = nil } }

			for k, v in ipairs(ConfigTattoo.TattooList[data.current.value]) do
				table.insert(elements, {
					label = "Tatuagem " .. tostring(k) .. " - " .. ESX.Math.GroupDigits(v.price),
					value = k,
					price = v.price
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tattoo_shop_categories', {
				title    = "Tatuagens" .. ' | ' .. currentLabel,
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local price = data2.current.price
				if data2.current.value ~= nil then
					ESX.TriggerServerCallback('esx_tattooshop:purchaseTattoo', function(success)
						if success then
							table.insert(currentTattoos, { collection = currentValue, texture = data2.current.value })
						end
					end, currentTattoos, price, { collection = currentValue, texture = data2.current.value })
				else
					OpenShopMenu()
					RenderScriptCams(false, false, 0, 1, 0)
					DestroyCam(cam, false)
					cleanPlayer()
				end
			end, function(data2, menu2)
				isMenuOpen = false
				menu2.close()
				RenderScriptCams(false, false, 0, 1, 0)
				DestroyCam(cam, false)
				setPedSkin()
			end, function(data2, menu2) -- when highlighted
				if data2.current.value ~= nil then
					drawTattoo(data2.current.value, currentValue)
				end
			end)
		end
	end, function(data, menu)
		isMenuOpen = false
		menu.close()
		setPedSkin()
	end)
end

Citizen.CreateThread(function()
	for k, v in pairs(ConfigTattoo.Zones) do
		local blip = AddBlipForCoord(v)
		SetBlipSprite(blip, 75)
		SetBlipColour(blip, 1)
		SetBlipScale(blip, 0.7)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString("Loja de Tatuagens")
		EndTextCommandSetBlipName(blip)
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords, letSleep = GetEntityCoords(PlayerPedId()), true

		for k, v in pairs(ConfigTattoo.Zones) do
			if (ConfigTattoo.Type ~= -1 and GetDistanceBetweenCoords(coords, v, true) < ConfigTattoo.DrawDistance) then
				DrawMarker(ConfigTattoo.Type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, ConfigTattoo.Size.x, ConfigTattoo.Size.y, ConfigTattoo.Size.z,
				ConfigTattoo.Color.r
					, ConfigTattoo.Color.g, ConfigTattoo.Color.b, 100, false, true, 2, false, false, false, false)
				letSleep = false
			end
		end

		if letSleep then
			Citizen.Wait(1000)
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker = false
		local currentZone, LastZone

		for k, v in pairs(ConfigTattoo.Zones) do
			if GetDistanceBetweenCoords(coords, v, true) < 1.5 then
				isInMarker  = true
				currentZone = 'TattooShop'
				LastZone    = 'TattooShop'
			end
		end

		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_tattooshop:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_tattooshop:hasExitedMarker', LastZone)
		end

		if not isInMarker and not HasAlreadyEnteredMarker then
			Citizen.Wait(1000)
		end
	end
end)

AddEventHandler('esx_tattooshop:hasEnteredMarker', function(zone)
	if zone == 'TattooShop' then
		CurrentAction     = 'tattoo_shop'
		CurrentActionMsg  = "Pressione ~INPUT_CONTEXT~ para abrir a loja de tatuagens"
		CurrentActionData = { zone = zone }
	end
end)

AddEventHandler('esx_tattooshop:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Key Controls
shown = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction and CurrentAction == 'tattoo_shop' then
			if not shown and not isMenuOpen then
				exports["okokTextUI"]:Open("Pressione [E] para abrir a loja de tatuagens", "darkblue", "right")
				shown = true
			end
			if IsControlJustReleased(0, 38) then
				if shown then
					exports["okokTextUI"]:Close()
					shown = false
				end
				OpenShopMenu()
			end
		else
			if shown then
				exports["okokTextUI"]:Close()
				shown = false
			end
			Citizen.Wait(500)
		end
	end
end)

function setPedSkin()
	ClearPedDecorations(PlayerPedId())
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)

	Citizen.Wait(1000)

	for k, v in pairs(currentTattoos) do
		ApplyPedOverlay(PlayerPedId(), GetHashKey(v.collection),
			GetHashKey(ConfigTattoo.TattooList[v.collection][v.texture].nameHash))
	end
end

function drawTattoo(current, collection)
	SetEntityHeading(PlayerPedId(), 297.7296)
	ClearPedDecorations(PlayerPedId())

	for k, v in pairs(currentTattoos) do
		ApplyPedOverlay(PlayerPedId(), GetHashKey(v.collection),
			GetHashKey(ConfigTattoo.TattooList[v.collection][v.texture].nameHash))
	end

	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 0,
				tshirt_1 = 15,
				tshirt_2 = 0,
				arms     = 21,
				torso_1  = 15,
				torso_2  = 0,
				pants_1  = 14,
				pants_2  = 0
			})
		else
			TriggerEvent('skinchanger:loadSkin', {
				sex      = 1,
				tshirt_1 = 34,
				tshirt_2 = 0,
				arms     = 15,
				torso_1  = 101,
				torso_2  = 1,
				pants_1  = 16,
				pants_2  = 0
			})
		end
	end)

	ApplyPedOverlay(PlayerPedId(), GetHashKey(collection), GetHashKey(ConfigTattoo.TattooList[collection][current].nameHash))

	if not DoesCamExist(cam) then
		cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

		SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
		SetCamRot(cam, 0.0, 0.0, 0.0)
		SetCamActive(cam, true)
		RenderScriptCams(true, false, 0, true, true)
		SetCamCoord(cam, GetEntityCoords(PlayerPedId()))
	end

	local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))

	SetCamCoord(cam, x + ConfigTattoo.TattooList[collection][current].addedX, y + ConfigTattoo.TattooList[collection][current]
		.addedY,
		z + ConfigTattoo.TattooList[collection][current].addedZ)
	SetCamRot(cam, 0.0, 0.0, ConfigTattoo.TattooList[collection][current].rotZ)
end

function cleanPlayer()
	ClearPedDecorations(PlayerPedId())

	for k, v in pairs(currentTattoos) do
		ApplyPedOverlay(PlayerPedId(), GetHashKey(v.collection),
			GetHashKey(ConfigTattoo.TattooList[v.collection][v.texture].nameHash))
	end
end

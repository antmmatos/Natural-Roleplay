local isNearPump = false
local isFueling = false
local currentFuel = 0.0
local currentCost = 0.0
local currentCash = 1000
local fuelSynced = false
local inBlacklisted = false

local Classes = {
	[0] = 1.0, -- Compacts
	[1] = 1.0, -- Sedans
	[2] = 1.0, -- SUVs
	[3] = 1.0, -- Coupes
	[4] = 1.0, -- Muscle
	[5] = 1.0, -- Sports Classics
	[6] = 1.0, -- Sports
	[7] = 1.0, -- Super
	[8] = 1.0, -- Motorcycles
	[9] = 1.0, -- Off-road
	[10] = 1.0, -- Industrial
	[11] = 1.0, -- Utility
	[12] = 1.0, -- Vans
	[13] = 0.0, -- Cycles
	[14] = 1.0, -- Boats
	[15] = 1.0, -- Helicopters
	[16] = 1.0, -- Planes
	[17] = 1.0, -- Service
	[18] = 1.0, -- Emergency
	[19] = 1.0, -- Military
	[20] = 1.0, -- Commercial
	[21] = 1.0, -- Trains
}

local FuelUsage = {
	[1.0] = 0.5,
	[0.9] = 0.45,
	[0.8] = 0.4,
	[0.7] = 0.35,
	[0.6] = 0.3,
	[0.5] = 0.2,
	[0.4] = 0.15,
	[0.3] = 0.1,
	[0.2] = 0.05,
	[0.1] = 0.01,
	[0.0] = 0.0,
}

function ManageFuelUsage(vehicle)
	if not DecorExistOn(vehicle, "_FUEL_LEVEL") then
		SetFuel(vehicle, math.random(200, 800) / 10)
	elseif not fuelSynced then
		SetFuel(vehicle, GetFuel(vehicle))

		fuelSynced = true
	end

	if IsVehicleEngineOn(vehicle) then
		SetFuel(vehicle,
			GetVehicleFuelLevel(vehicle) -
			FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] * (Classes[GetVehicleClass(vehicle)] or 1.0) /
			10)
	end
end

Blacklist = {
	--"Adder",
}

Citizen.CreateThread(function()
	DecorRegister("_FUEL_LEVEL", 1)

	for index = 1, #Blacklist do
		if type(Blacklist[index]) == 'string' then
			Blacklist[GetHashKey(Blacklist[index])] = true
		else
			Blacklist[Blacklist[index]] = true
		end
	end

	for index = #Blacklist, 1, -1 do
		table.remove(Blacklist, index)
	end

	while true do
		Citizen.Wait(1000)

		local ped = PlayerPedId()

		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)

			if Blacklist[GetEntityModel(vehicle)] then
				inBlacklisted = true
			else
				inBlacklisted = false
			end

			if not inBlacklisted and GetPedInVehicleSeat(vehicle, -1) == ped then
				ManageFuelUsage(vehicle)
			end
		else
			if fuelSynced then
				fuelSynced = false
			end

			if inBlacklisted then
				inBlacklisted = false
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(250)

		local pumpObject, pumpDistance = FindNearestFuelPump()

		if pumpDistance < 2.5 then
			isNearPump = pumpObject

			local playerData = ESX.GetPlayerData()
			for i = 1, #playerData.accounts, 1 do
				if playerData.accounts[i].name == 'money' then
					currentCash = playerData.accounts[i].money
					break
				end
			end
		else
			isNearPump = false

			Citizen.Wait(math.ceil(pumpDistance * 20))
		end
	end
end)

AddEventHandler('fuel:startFuelUpTick', function(pumpObject, ped, vehicle)
	currentFuel = GetVehicleFuelLevel(vehicle)

	while isFueling do
		Citizen.Wait(500)

		local oldFuel = DecorGetFloat(vehicle, "_FUEL_LEVEL")
		local fuelToAdd = math.random(10, 20) / 10.0
		local extraCost = fuelToAdd / 1.5 * 5.0 -- Price multiplier: 5.0

		if not pumpObject then
			if GetAmmoInPedWeapon(ped, 883325847) - fuelToAdd * 100 >= 0 then
				currentFuel = oldFuel + fuelToAdd

				SetPedAmmo(ped, 883325847, math.floor(GetAmmoInPedWeapon(ped, 883325847) - fuelToAdd * 100))
				TriggerEvent('weapons:LegacyFuel', math.floor(GetAmmoInPedWeapon(ped, 883325847) - fuelToAdd * 100))
			else
				isFueling = false
			end
		else
			currentFuel = oldFuel + fuelToAdd
		end

		if currentFuel > 100.0 then
			currentFuel = 100.0
			isFueling = false
		end

		currentCost = currentCost + extraCost

		if currentCash >= currentCost then
			SetFuel(vehicle, currentFuel)
		else
			isFueling = false
		end
	end

	if pumpObject then
		TriggerServerEvent('fuel:pay', currentCost, currentFuel, vehicle)
	end

	currentCost = 0.0
end)

local DisableKeys = { 0, 22, 23, 24, 29, 30, 31, 37, 44, 56, 82, 140, 166, 167, 168, 170, 288, 289, 311, 323 }

local Strings = {
	ExitVehicle = "Saia do veículo para reabastecer",
	EToRefuel = "Pressione ~g~E ~w~para abastecer",
	JerryCanEmpty = "O galão está vazio",
	FullTank = "Tanque cheio",
	PurchaseJerryCan = "Pressione ~g~E ~w~para comprar um galão por €" .. "100",
	CancelFuelingPump = "Pressione ~g~E ~w~para cancelar o abastecimento",
	CancelFuelingJerryCan = "Pressione ~g~E ~w~para cancelar o abastecimento",
	NotEnoughCash = "Dinheiro insuficiente",
	RefillJerryCan = "Pressione ~g~E ~w~ para reabastecer o galão por ",
	NotEnoughCashJerryCan = "Dinheiro insuficiente para reabastecer o galão",
	JerryCanFull = "Galão cheio",
	TotalCost = "Total",
}

AddEventHandler('fuel:refuelFromPump', function(pumpObject, ped, vehicle)
	TaskTurnPedToFaceEntity(ped, vehicle, 1000)
	Citizen.Wait(1000)
	SetCurrentPedWeapon(ped, -1569615261, true)
	LoadAnimDict("timetable@gardener@filling_can")
	TaskPlayAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)

	TriggerEvent('fuel:startFuelUpTick', pumpObject, ped, vehicle)

	while isFueling do
		for _, controlIndex in pairs(DisableKeys) do
			DisableControlAction(0, controlIndex)
		end

		local vehicleCoords = GetEntityCoords(vehicle)

		if pumpObject then
			local stringCoords = GetEntityCoords(pumpObject)
			local extraString = "\n" .. Strings.TotalCost .. ": ~g~$" .. Round(currentCost, 1)

			DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2,
				Strings.CancelFuelingPump .. extraString)
			DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5, Round(currentFuel, 1) .. "%")
		else
			DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5,
				Strings.CancelFuelingJerryCan ..
				"\nGalão: ~g~" ..
				Round(GetAmmoInPedWeapon(ped, 883325847) / 4500 * 100, 1) ..
				"% | Veículo: " .. Round(currentFuel, 1) .. "%")
		end

		if not IsEntityPlayingAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 3) then
			TaskPlayAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
		end

		if IsControlJustReleased(0, 38) or DoesEntityExist(GetPedInVehicleSeat(vehicle, -1)) or (isNearPump and GetEntityHealth(pumpObject) <= 0) then
			isFueling = false
		end

		Citizen.Wait(0)
	end

	ClearPedTasks(ped)
	RemoveAnimDict("timetable@gardener@filling_can")
end)

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()

		if not isFueling and ((isNearPump and GetEntityHealth(isNearPump) > 0) or (GetSelectedPedWeapon(ped) == 883325847 and not isNearPump)) then
			if IsPedInAnyVehicle(ped) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped), -1) == ped then
				local pumpCoords = GetEntityCoords(isNearPump)

				DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, Strings.ExitVehicle)
			else
				local vehicle = GetPlayersLastVehicle()
				local vehicleCoords = GetEntityCoords(vehicle)

				if DoesEntityExist(vehicle) and GetDistanceBetweenCoords(GetEntityCoords(ped), vehicleCoords) < 2.5 then
					if not DoesEntityExist(GetPedInVehicleSeat(vehicle, -1)) then
						local stringCoords = GetEntityCoords(isNearPump)
						local canFuel = true

						if GetSelectedPedWeapon(ped) == 883325847 then
							stringCoords = vehicleCoords

							if GetAmmoInPedWeapon(ped, 883325847) < 100 then
								canFuel = false
							end
						end

						if GetVehicleFuelLevel(vehicle) < 95 and canFuel then
							if isNearPump then
								if currentCash > 0 then
									DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2,
										Strings.EToRefuel)

									if IsControlJustReleased(0, 38) then
										isFueling = true

										TriggerEvent('fuel:refuelFromPump', isNearPump, ped, vehicle)
										LoadAnimDict("timetable@gardener@filling_can")
									end
								else
									DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2,
										Strings.NotEnoughCash)
								end
							else
								DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2,
									Strings.EToRefuel)

								if IsControlJustReleased(0, 38) then
									isFueling = true

									TriggerEvent('fuel:refuelFromPump', isNearPump, ped, vehicle)
									LoadAnimDict("timetable@gardener@filling_can")
								end
							end
						elseif not canFuel then
							DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2,
								Strings.JerryCanEmpty)
						else
							DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Strings.FullTank)
						end
					end
				elseif isNearPump then
					local stringCoords = GetEntityCoords(isNearPump)

					if currentCash >= 100 then
						if not HasPedGotWeapon(ped, 883325847) then
							DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2,
								Strings.PurchaseJerryCan)

							if IsControlJustReleased(0, 38) then
								--GiveWeaponToPed(ped, 883325847, 4500, false, true)
								TriggerServerEvent('fuel:givecan')

								TriggerServerEvent('fuel:pay', 100)

								currentCash = ESX.GetPlayerData().money
							end
						else -- Refuel price: 50
							local refillCost = Round(50 * (1 - GetAmmoInPedWeapon(ped, 883325847) / 4500))

							if refillCost > 0 then
								if currentCash >= refillCost then
									DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2,
										Strings.RefillJerryCan .. refillCost)

									if IsControlJustReleased(0, 38) then
										TriggerServerEvent('fuel:pay', refillCost, "jerrycanrefill")

										SetPedAmmo(ped, 883325847, 4500)
									end
								else
									DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2,
										Strings.NotEnoughCashJerryCan)
								end
							else
								DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2,
									Strings.JerryCanFull)
							end
						end
					else
						DrawText3Ds(stringCoords.x, stringCoords.y, stringCoords.z + 1.2, Strings.NotEnoughCash)
					end
				else
					Citizen.Wait(250)
				end
			end
		else
			Citizen.Wait(250)
		end

		Citizen.Wait(0)
	end
end)

local GasStations = {
	vector3(49.4187, 2778.793, 58.043),
	vector3(263.894, 2606.463, 44.983),
	vector3(1039.958, 2671.134, 39.550),
	vector3(1207.260, 2660.175, 37.899),
	vector3(2539.685, 2594.192, 37.944),
	vector3(2679.858, 3263.946, 55.240),
	vector3(2005.055, 3773.887, 32.403),
	vector3(1687.156, 4929.392, 42.078),
	vector3(1701.314, 6416.028, 32.763),
	vector3(179.857, 6602.839, 31.868),
	vector3(-94.4619, 6419.594, 31.489),
	vector3(-2554.996, 2334.40, 33.078),
	vector3(-1800.375, 803.661, 138.651),
	vector3(-1437.622, -276.747, 46.207),
	vector3(-2096.243, -320.286, 13.168),
	vector3(-724.619, -935.1631, 19.213),
	vector3(-526.019, -1211.003, 18.184),
	vector3(-70.2148, -1761.792, 29.534),
	vector3(265.648, -1261.309, 29.292),
	vector3(819.653, -1028.846, 26.403),
	vector3(1208.951, -1402.567, 35.224),
	vector3(1181.381, -330.847, 69.316),
	vector3(620.843, 269.100, 103.089),
	vector3(2581.321, 362.039, 108.468),
	vector3(176.631, -1562.025, 29.263),
	vector3(176.631, -1562.025, 29.263),
	vector3(-319.292, -1471.715, 30.549),
	vector3(1784.324, 3330.55, 41.253)
}

Citizen.CreateThread(function()
	for _, gasStationCoords in pairs(GasStations) do
		CreateBlip(gasStationCoords)
	end
end)

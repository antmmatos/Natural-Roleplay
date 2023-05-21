local kmh = 3.6
local driftmode = false -- on/off speed
local speed = kmh -- or mph
local drift_speed_limit = 100.0 

RegisterCommand("drift", function(source, args, rawCommand)
	driftmode = not driftmode
	if driftmode then
		exports["okokNotify"]:Alert("Drift", "Modo de drift ligado", 2000, "success")
	else
		exports["okokNotify"]:Alert("Drift", "Modo de drift desligado", 2000, "error")
	end
end)

Citizen.CreateThread(function()
    while true do
        if driftmode then
            local ped = PlayerPedId()
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                CarSpeed = GetEntitySpeed(vehicle) * speed
                if GetPedInVehicleSeat(vehicle, -1) == ped then
                    if CarSpeed <= drift_speed_limit then  
                        if IsControlPressed(1, 21) then
                            SetVehicleReduceGrip(vehicle, true)
                        else
                            SetVehicleReduceGrip(vehicle, false)
                        end
                    end
                end
            end
        else
            Citizen.Wait(2000)
        end
        Citizen.Wait(0)
    end
end)
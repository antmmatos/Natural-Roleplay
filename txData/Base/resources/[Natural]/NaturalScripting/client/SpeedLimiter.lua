Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle ~= nil then
            setSpeed(350, vehicle)
        else
            Citizen.Wait(2000)
        end
    end
end)

function setSpeed(speed, vehicle)
    local vehicleClass = GetVehicleClass(vehicle)
    speed = speed / 3.6

    if (vehicleClass ~= 16) or (vehicleClass ~= 15) then
        SetVehicleMaxSpeed(vehicle, speed)
    end
end
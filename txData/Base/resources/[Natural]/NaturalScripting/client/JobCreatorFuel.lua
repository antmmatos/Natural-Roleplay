AddEventHandler("jobs_creator:temporary_garage:vehicleSpawned", function(vehicle, vehicleName, vehiclePlate)
    SetVehicleFuelLevel(vehicle, 50.0)
end)
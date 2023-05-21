local neonState = false

RegisterCommand("neon", function ()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if neonState then
        neonState = false
    else
        neonState = true
    end
    SetVehicleNeonLightEnabled(vehicle, 0, neonState)
    SetVehicleNeonLightEnabled(vehicle, 1, neonState)
    SetVehicleNeonLightEnabled(vehicle, 2, neonState)
    SetVehicleNeonLightEnabled(vehicle, 3, neonState)
end)
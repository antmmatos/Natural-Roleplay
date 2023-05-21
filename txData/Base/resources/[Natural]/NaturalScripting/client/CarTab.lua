Citizen.CreateThread(function ()
    while true do
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            DisableControlAction(0, 99, true)
        else
            Citizen.Wait(2000)
        end
        Citizen.Wait(0)
    end
end)
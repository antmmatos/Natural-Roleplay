RegisterNetEvent("Natural:Client:Monster")
AddEventHandler("Natural:Client:Monster", function()
    local notFinished = true
    local pid = PlayerId()
    SetRunSprintMultiplierForPlayer(pid, 1.49)
    Citizen.CreateThread(function()
        while notFinished do
            RestorePlayerStamina(pid, 100.0)
            Wait(0)
        end
    end)
    Wait(32000)
    notFinished = false
    SetRunSprintMultiplierForPlayer(pid, 1.0)
end)

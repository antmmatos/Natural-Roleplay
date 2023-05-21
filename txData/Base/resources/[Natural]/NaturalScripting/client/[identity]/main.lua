local loadingScreenFinished = false

RegisterNetEvent('esx_identity:alreadyRegistered', function()
    while not loadingScreenFinished do Wait(100) end
    TriggerEvent('esx_skin:playerRegistered')
end)

AddEventHandler('esx:loadingScreenOff', function()
    loadingScreenFinished = true
end)

RegisterNUICallback('ready', function(data, cb)
    cb(1)
end)
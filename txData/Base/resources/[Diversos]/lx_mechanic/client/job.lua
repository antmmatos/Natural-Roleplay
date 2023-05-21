jobName = nil

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    jobName = ESX.PlayerData.job.name
    updateUICurrentJob()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function()
    jobName = ESX.PlayerData.job.name
    updateUICurrentJob()
end)

local sharedObject = GetSharedObject()
local PlayerDataESX = {
    job = {
        name = "none",
    },
    identifier = "none",
}

if Config.Framework.Active == FrameworkType.ESX then
    Citizen.CreateThread(function()
        if sharedObject and sharedObject.IsPlayerLoaded() then
            PlayerDataESX = sharedObject.GetPlayerData()
            PlayerDataUpdated()
        end
    end)

    RegisterNetEvent(Config.ESXCallbacks['esx:playerLoaded'])
    AddEventHandler(Config.ESXCallbacks['esx:playerLoaded'], function(xPlayer)
        PlayerDataESX = xPlayer
        PlayerDataUpdated()
    end)

    RegisterNetEvent(Config.ESXCallbacks['esx:setJob'])
    AddEventHandler(Config.ESXCallbacks['esx:setJob'], function(job)
        PlayerDataESX.job = job
        PlayerDataUpdated()
    end)
end

if Config.Framework.Active == FrameworkType.QB_CORE then
    Citizen.CreateThread(function()
        if sharedObject and sharedObject.Functions.GetPlayerData() then
            local pData = sharedObject.Functions.GetPlayerData()
            if pData then
                if pData.job then
                    PlayerDataESX.job.name = pData.job.name
                end
                if pData.citizenid then
                    PlayerDataESX.identifier = pData.citizenid
                end
            end
        end
        PlayerDataUpdated()
    end)

    RegisterNetEvent(Config.QBCoreCallbacks['QBCore:Player:SetPlayerData'])
    AddEventHandler(Config.QBCoreCallbacks['QBCore:Player:SetPlayerData'], function(xPlayer)
        PlayerDataESX.job.name = xPlayer.job.name
        PlayerDataESX.identifier = xPlayer.citizenid

        PlayerDataUpdated()
    end)
end

function IsAtJob(name)
    return PlayerDataESX.job.name == name
end

function GetPlayerIdentifier_(id)
    return PlayerDataESX.identifier == id
end

function PlayerDataUpdated()
    TriggerEvent(triggerName("PlayerDataUpdated"))
end
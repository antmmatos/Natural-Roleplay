CreateThread(function()
    if Config.Framework == 'ESX' then
        local legacyEsx = pcall(function()
            ESX = exports['es_extended']:getSharedObject()
        end)
        Wait(0)
        if legacyEsx then return end
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Wait(0)
        end
    
    elseif Config.Framework == 'QBCore' then
        QBCore = exports['qb-core']:GetCoreObject()
    end    
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

function SendTextMessage(msg, type)
    if type == 'inform' then 
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)
    end
    if type == 'error' then 
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)
    end
    if type == 'success' then 
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)
    end
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z+1, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function CheckPlayerJobName()
	if Config.Framework == 'ESX' then 
		return ESX.PlayerData.job
	elseif Config.Framework == 'QBCore' then 
        while PlayerData == nil do Wait(10) end
		return PlayerData.job
    else
        print('Missing Framework added')
    end
end

function CheckPlayerJobGrade()
	if Config.Framework == 'ESX' then 
		return ESX.PlayerData.job.grade
	elseif Config.Framework == 'QBCore' then 
        while PlayerData == nil do Wait(10) end
		return PlayerData.job.grade.level
    else
        print('Missing Framework added')
    end
end

function ItemsInfo(items)
    for k, v in pairs(items) do
        if v.name == 'backpack' then
            local info = {
                bagid = math.random(111111,999999)
            }
            items[k].info = info
        elseif v.name == 'game_ticket' then
            local info = {
                type = "game_ticket",
                cardnumber = math.random(1111,9999),
            }
            items[k].info = info
            end
        end
    return items
end

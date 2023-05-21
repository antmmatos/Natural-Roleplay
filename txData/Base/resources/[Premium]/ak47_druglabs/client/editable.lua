function isPlayerDead()
    return IsEntityDead(GetPlayerPed(-1))
end

function showNotification(text, eType, time)
	local message = text
	ShowNotificationDefault(message)
end

RegisterNetEvent('ak47_druglabs:showNotification')
AddEventHandler('ak47_druglabs:showNotification', function(text, eType, time)
    showNotification(text, eType, time)
end)

function ShowNotificationDefault(msg)
	ESX.ShowNotification(msg, 'info')
end

function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end
Citizen.CreateThread(function()
    while true do
        SetDiscordAppId(1035266661328093276)
        local id = GetPlayerServerId(PlayerId())
        ESX.TriggerServerCallback('Natural:Server:Discord', function(numPlayers, playerName)
            SetRichPresence(playerName .. " | " .. numPlayers .. "/64 | ID: " .. id)

            SetDiscordRichPresenceAsset("natural")
            SetDiscordRichPresenceAssetText(playerName)
        end)
        Citizen.Wait(60000)
    end
end)

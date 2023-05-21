xSound = exports.NaturalScripting

Citizen.CreateThread(function()
    Citizen.Wait(100)
    ESX.TriggerServerCallback('myDJ:receiveRunningSongs', function(DJPositions)
        if DJPositions ~= nil then
            for _, v in pairs(DJPositions) do
                if v.currentData ~= nil then
                    if v.currentData.titleFromPlaylist then
                        playTitleFromPlaylist(v.name, v.pos, v.range, v.currentData.currentLink,
                            v.currentData.currentPlaylist)
                    else
                        playSong(v.name, v.pos, v.range, v.currentData.currentLink)
                        isMusicPaused = false
                    end

                    if xSound:soundExists(v.name) then
                        xSound:setTimeStamp(v.name, v.currentData.currentTime)
                        if not v.currentData.currentlyPlaying then
                            startStopSong(v.name)
                        end
                    end
                end
            end
        end
    end)
end)

local isNearDJ = false
local isAtDJ = false
local currentDJ = DJPositions[1]
local isSongRunning = true
local isMusicPaused = false

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed, true)

        isAtDJ = false
        isNearDJ = false

        for k, v in pairs(DJPositions) do
            if (v.requiredJob == nil or ESX ~= nil and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == v.requiredJob) then
                local distance = Vdist(playerCoords, v.pos.x, v.pos.y, v.pos.z)

                if distance < 2.0 then
                    currentDJ = v
                    isAtDJ = true
                    isNearDJ = true
                elseif distance < 25.0 then
                    isNearDJ = true
                    currentDJ = v
                end
            end
        end

        if not isNearDJ then
            Citizen.Wait(1000)
        end

        Citizen.Wait(400)
    end
end)

Citizen.CreateThread(function()
    while true do
        if isNearDJ then
            DrawMarker(27, currentDJ.pos.x, currentDJ.pos.y, currentDJ.pos.z - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                0.5, 0.5, 0.5, 255, 255, 255, 255, false, false, 2, false, false, false, false)
        end

        if isAtDJ then
            showInfobar("Pressione [E] para acessar a mesa DJ")
            if IsControlJustReleased(0, 38) then
                SetNuiFocus(true, true)
                isDjOpen = true
                SendNUIMessage({ type = 'open' })
                ESX.TriggerServerCallback('myDJ:requestPlaylistsAndSongs', function(playlists, songs)
                    SendNUIMessage({ type = 'getPlaylists', playlists = playlists, songs = songs })
                end)
            end
        end

        if not isAtDJ and not isNearDJ then
            Citizen.Wait(1000)
        end

        Citizen.Wait(1)
    end
end)

RegisterNetEvent('myDj:open')
AddEventHandler('myDj:open', function()
    SetNuiFocus(true, true)
    isDjOpen = true
    SendNUIMessage({ type = 'open' })
    ESX.TriggerServerCallback('myDJ:requestPlaylistsAndSongs', function(playlists, songs)
        SendNUIMessage({ type = 'getPlaylists', playlists = playlists, songs = songs })
    end)
end)

Citizen.CreateThread(function()
    while true do
        if currentDJ ~= nil then
            if xSound ~= nil and xSound:soundExists(currentDJ.name) then
                if xSound:isPlaying(currentDJ.name) then
                    SendNUIMessage({
                        type = 'updateSeconds',
                        maxDuration = xSound:getMaxDuration(currentDJ.name),
                        secs = xSound:getTimeStamp(currentDJ.name)
                    })
                end
            end
        end

        Citizen.Wait(1000)
    end
end)

function playSong(DJName, DJPos, DJRange, songlink)
    local options =
    {
        onPlayStart = function(event)
        end,
        onPlayEnd = function(event)
        end,
    }

    xSound:PlayUrlPos(DJName, songlink, 1, DJPos, false, options)
    xSound:Distance(DJName, DJRange)
    SendNUIMessage({ type = 'updateSonginfos', link = songlink })
end

function startStopSong(DJName)
    if xSound:soundExists(DJName) and isMusicPaused then
        xSound:Resume(DJName)
        isMusicPaused = false
    elseif xSound:soundExists(DJName) and not isMusicPaused then
        xSound:Pause(DJName)
        isMusicPaused = true
    end
end

function stopSong(DJName)
    xSound:Destroy(DJName)
end

function rewindSong(DJName)
    if currentDJ ~= nil then
        if xSound:soundExists(DJName) then
            if xSound:isPlaying(DJName) then
                local currTimestamp = xSound:getTimeStamp(DJName)
                if currTimestamp - 10 < 0 then
                    xSound:setTimeStamp(0)
                else
                    xSound:setTimeStamp(DJName, currTimestamp - 10)
                end
            end
        end
    end
end

function forwardSong(DJName)
    if currentDJ ~= nil then
        if xSound:soundExists(DJName) then
            if xSound:isPlaying(DJName) then
                local currTimestamp = xSound:getTimeStamp(DJName)
                xSound:setTimeStamp(DJName, currTimestamp + 10)
            end
        end
    end
end

function volumeUp(DJName)
    if xSound:soundExists(DJName) then
        if currentDJ.volume + 0.1 >= 1 then
            currentDJ.volume = 1.0
            xSound:setVolume(DJName, 1.0)
        else
            currentDJ.volume = currentDJ.volume + 0.1
            xSound:setVolume(DJName, currentDJ.volume + 0.1)
        end
    end
end

function volumeDown(DJName)
    if xSound:soundExists(DJName) then
        if currentDJ.volume - 0.1 <= 0 then
            currentDJ.volume = 0.0
            xSound:setVolume(DJName, 0.0)
        else
            currentDJ.volume = currentDJ.volume - 0.1
            xSound:setVolume(DJName, currentDJ.volume - 0.1)
        end
    end
end

function playTitleFromPlaylist(DJName, DJPos, DJRange, link, playlistId)
    ESX.TriggerServerCallback('myDJ:requestPlaylistById', function(playlistSongs)
        if playlistSongs ~= nil then
            for k, v in pairs(playlistSongs) do
                if v.link == link then
                    startSongFromPlaylist(DJName, DJPos, DJRange, k, playlistSongs)
                end
            end
        end
    end, playlistId)
end

function startSongFromPlaylist(DJName, DJPos, DJRange, startIndex, playlist)
    for i = startIndex, #playlist, 1 do
        local options =
        {
            onPlayStart = function(event)
                isSongRunning = true
            end,
            onPlayEnd = function(event)
                isSongRunning = false
            end,
        }

        xSound:PlayUrlPos(DJName, playlist[i].link, 1, DJPos, false, options)
        xSound:Distance(DJName, DJRange)

        while isSongRunning do
            Citizen.Wait(1000)
        end
    end
end

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    isDjOpen = false
end)

RegisterNetEvent('myDj:clientStartStop')
AddEventHandler('myDj:clientStartStop', function(DJName)
    startStopSong(DJName)
end)

RegisterNUICallback('togglePlaystate', function(data, cb)
    TriggerServerEvent('myDj:syncStartStop', currentDJ.name)
end)

RegisterNetEvent('myDj:clientPlaySong')
AddEventHandler('myDj:clientPlaySong', function(DJName, DJPos, DJRange, link)
    playSong(DJName, DJPos, DJRange, link)
    isMusicPaused = false
end)

RegisterNUICallback('playNewSong', function(data, cb)
    TriggerServerEvent('myDj:syncPlaySong', currentDJ.name, currentDJ.pos, currentDJ.range, data.link)
end)

RegisterNetEvent('myDj:clientPlaySongFromPlaylist')
AddEventHandler('myDj:clientPlaySongFromPlaylist', function(DJName, DJPos, DJRange, link, playlistId)
    playTitleFromPlaylist(DJName, DJPos, DJRange, link, playlistId)
end)

RegisterNUICallback('playSongFromPlaylist', function(data, cb)
    TriggerServerEvent('myDj:syncPlaySongFromPlaylist', currentDJ.name, currentDJ.pos, currentDJ.range, data.link,
        data.playlistId)
end)

RegisterNetEvent('myDj:clientRewind')
AddEventHandler('myDj:clientRewind', function(DJName)
    rewindSong(DJName)
end)

RegisterNUICallback('rewind', function(data, cb)
    TriggerServerEvent('myDj:syncRewind', currentDJ.name)
end)

RegisterNetEvent('myDj:clientForward')
AddEventHandler('myDj:clientForward', function(DJName)
    forwardSong(DJName)
end)

RegisterNUICallback('forward', function(data, cb)
    TriggerServerEvent('myDj:syncForward', currentDJ.name)
end)

RegisterNetEvent('myDj:clientVolumeDown')
AddEventHandler('myDj:clientVolumeDown', function(DJName)
    volumeDown(DJName)
end)

RegisterNUICallback('down', function(data, cb)
    TriggerServerEvent('myDj:syncVolumeDown', currentDJ.name)
    if currentDJ.volume <= 0.0 then
        ShowNotification('~g~Minimum volume reached!')
    end
end)

RegisterNetEvent('myDj:clientVolumeUp')
AddEventHandler('myDj:clientVolumeUp', function(DJName)
    volumeUp(DJName)
end)

RegisterNUICallback('up', function(data, cb)
    TriggerServerEvent('myDj:syncVolumeUp', currentDJ.name)
    if currentDJ.volume >= 1.0 then
        ShowNotification('~g~Volume máximo atingido!')
    end
end)

RegisterNUICallback('addPlayList', function(data, cb)
    TriggerServerEvent('myDJ:addPlaylist', data.name)
end)

RegisterNUICallback('addSongToPlaylist', function(data, cb)
    TriggerServerEvent('myDJ:addSongToPlaylist', data.id, tostring(data.link))

    Wait(100)
    ESX.TriggerServerCallback('myDJ:requestPlaylistsAndSongs', function(playlists, songs)
        SendNUIMessage({ type = 'getPlaylists', playlists = playlists, songs = songs })
    end)
end)

RegisterNUICallback('deleteSong', function(data, cb)
    TriggerServerEvent('myDJ:removeSongFromPlaylist', data.id)
end)

RegisterNUICallback('deletePlaylist', function(data, cb)
    TriggerServerEvent('myDJ:removePlaylist', data.id)
end)



RegisterNUICallback('noSongtitle', function(data, cb)
    ShowNotification("~r~Este titulo não existe!")
end)


function ShowNotification(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, true)
end

function showInfobar(msg)
    CurrentActionMsg = msg
    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

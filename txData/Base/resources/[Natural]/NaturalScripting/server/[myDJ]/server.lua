ESX.RegisterServerCallback('myDJ:requestPlaylistsAndSongs', function(source, cb)
    local playlists = {}
    local songs = {}

    MySQL.Async.fetchAll('SELECT * from playlists', {},
        function(result)
            playlists = result

            MySQL.Async.fetchAll('SELECT * from playlist_songs', {},
                function(result)
                    songs = result
                    cb(playlists, songs)
                end
            )
        end
    )
end)

ESX.RegisterServerCallback('myDJ:requestPlaylistById', function(source, cb, playlistId)
    MySQL.Async.fetchAll('SELECT * from playlist_songs WHERE playlist = @playlistId', {
            ['@playlistId'] = playlistId,
        },
        function(result)
            cb(result)
        end
    )
end)

ESX.RegisterServerCallback('myDJ:requestPlaylists', function(source, cb)
    MySQL.Async.fetchAll('SELECT id, label from playlists', {},
        function(result)
            cb(result)
        end
    )
end)

ESX.RegisterServerCallback('myDJ:requestPlaylistSongs', function(source, cb, playlistId)
    MySQL.Async.fetchAll('SELECT * from playlist_songs WHERE playlist = @playlist', {
            ['@playlistId'] = playlistId,
        },
        function(result)
            cb(result)
        end
    )
end)

ESX.RegisterServerCallback('myDJ:receiveRunningSongs', function(source, cb)
    cb(DJPositions)
end)

RegisterServerEvent('myDJ:addPlaylist')
AddEventHandler('myDJ:addPlaylist', function(label)
    MySQL.Async.execute(
        'INSERT INTO playlists (label) VALUES (@label)', {
            ['@label'] = label,
        })
end)

RegisterServerEvent('myDJ:addSongToPlaylist')
AddEventHandler('myDJ:addSongToPlaylist', function(playlistId, videoLink)
    MySQL.Async.execute(
        'INSERT INTO playlist_songs (playlist, link) VALUES (@playlist, @link)', {
            ['@playlist'] = playlistId,
            ['@link'] = videoLink,
        })
end)

RegisterServerEvent('myDJ:removeSongFromPlaylist')
AddEventHandler('myDJ:removeSongFromPlaylist', function(songId, link)
    MySQL.Async.execute(
        'DELETE FROM playlist_songs WHERE id = @id', {
            ['@id'] = songId,
        })
end)


RegisterServerEvent('myDJ:removePlaylist')
AddEventHandler('myDJ:removePlaylist', function(playlistId)
    MySQL.Async.execute(
        'DELETE FROM playlists WHERE id = @id', {
            ['@id'] = playlistId,
        })
end)

-- SYNC

RegisterServerEvent('myDj:syncPlaySong')
AddEventHandler('myDj:syncPlaySong', function(currentDJ, DJPos, DJRange, link)
    TriggerClientEvent('myDj:clientPlaySong', -1, currentDJ, DJPos, DJRange, link)

    for k, v in pairs(DJPositions) do
        if v.name == currentDJ then
            DJPositions[k].currentData = {
                titleFromPlaylist = false,
                currentlyPlaying = true,
                currentLink = link,
                currentTime = 0,
            }

            break
        end
    end
end)

RegisterServerEvent('myDj:syncPlaySongFromPlaylist')
AddEventHandler('myDj:syncPlaySongFromPlaylist', function(currentDJ, DJPos, DJRange, link, playlistId)
    TriggerClientEvent('myDj:clientPlaySongFromPlaylist', -1, currentDJ, DJPos, DJRange, link, playlistId)
    for k, v in pairs(DJPositions) do
        if v.name == currentDJ then
            DJPositions[k].currentData = {
                titleFromPlaylist = true,
                currentPlaylist = playlistId,
                currentlyPlaying = true,
                currentLink = link,
                currentTime = 0,
            }
            break
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k, v in pairs(DJPositions) do
            if v.currentData ~= nil and v.currentData.currentlyPlaying then
                v.currentData.currentTime = v.currentData.currentTime + 1
            end
        end
    end
end)

RegisterServerEvent('myDj:syncStartStop')
AddEventHandler('myDj:syncStartStop', function(currentDJ)
    TriggerClientEvent('myDj:clientStartStop', -1, currentDJ)

    for k, v in pairs(DJPositions) do
        if v.name == currentDJ then
            if v.currentData ~= nil and v.currentData.currentlyPlaying then
                DJPositions[k].currentData.currentlyPlaying = false
            elseif v.currentData ~= nil and not v.currentData.currentlyPlaying then
                DJPositions[k].currentData.currentlyPlaying = true
            end
            break
        end
    end
end)

RegisterServerEvent('myDj:syncForward')
AddEventHandler('myDj:syncForward', function(currentDJ)
    TriggerClientEvent('myDj:clientForward', -1, currentDJ)
end)

RegisterServerEvent('myDj:syncRewind')
AddEventHandler('myDj:syncRewind', function(currentDJ)
    TriggerClientEvent('myDj:clientRewind', -1, currentDJ)
end)

RegisterServerEvent('myDj:syncVolumeUp')
AddEventHandler('myDj:syncVolumeUp', function(currentDJ)
    TriggerClientEvent('myDj:clientVolumeUp', -1, currentDJ)
end)

RegisterServerEvent('myDj:syncVolumeDown')
AddEventHandler('myDj:syncVolumeDown', function(currentDJ)
    TriggerClientEvent('myDj:clientVolumeDown', -1, currentDJ)
end)

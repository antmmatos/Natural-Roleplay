ESX.RegisterServerCallback('Natural:Server:Discord', function(src, cb)
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(src)
    while not xPlayer do
        Citizen.Wait(0)
    end
    if not xPlayer or not xPlayer.get("firstName") or not xPlayer.get("lastName") then
        return
    else
        cb(#xPlayers, xPlayer.get("firstName") .. " " .. xPlayer.get("lastName"))
    end
end)
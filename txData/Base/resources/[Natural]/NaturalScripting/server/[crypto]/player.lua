NaturalCrypto.Players = {}

AddEventHandler("esx:playerLoaded", function(playerId, xPlayer)
--RegisterCommand("loadcrypto", function(source)
--    local playerId = source
--    local xPlayer = ESX.GetPlayerFromId(source)
--    TriggerClientEvent("es:playerLoaded", source)
    local userData = {}
    local result = MySQL.query.await(
        "SELECT COUNT(*) AS 'Exists', identifier, name, accounts FROM NaturalCrypto WHERE identifier = ?",
        { xPlayer.getIdentifier() })
    if result[1].Exists == 1 then
        userData.accounts = json.decode(result[1].accounts)
        userData.identifier = result[1].identifier
        userData.name = result[1].name
        userData.source = playerId
        local nPlayer = CreatePlayer(userData)
        NaturalCrypto.Players[playerId] = nPlayer
    else
        local accounts = {}
        for k, v in pairs(NaturalCrypto.CryptoCurrencies) do
            accounts[NaturalCrypto.CryptoCurrencies[k]["name"]] = 0
        end
        MySQL.Async.fetchAll(
            "INSERT INTO NaturalCrypto (identifier, name, accounts) VALUES (@identifier, @name, @accounts)",
            {
                ["@identifier"] = xPlayer.getIdentifier(),
                ["@name"] = GetPlayerName(playerId),
                ["@accounts"] = json.encode(accounts)
            })
        userData.accounts = accounts
        userData.identifier = xPlayer.getIdentifier()
        userData.name = GetPlayerName(playerId)
        userData.source = playerId
        local nPlayer = CreatePlayer(userData)
        NaturalCrypto.Players[playerId] = nPlayer
    end
end)

AddEventHandler("playerDropped", function()
    local _source = source
    if not NaturalCrypto.Players[_source] then
        return
    end
    MySQL.update.await("UPDATE NaturalCrypto SET accounts = ? WHERE identifier = ?", { json.encode(
        NaturalCrypto.Players[_source].getAccounts()), NaturalCrypto.Players[_source].getIdentifier() })
    NaturalCrypto.Players[_source] = nil
end)

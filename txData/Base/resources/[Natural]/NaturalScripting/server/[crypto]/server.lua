CryptoAPI =
"https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false"
NaturalCrypto.CryptoCurrencies = {}
NaturalCrypto.CryptoDataLoaded = false
NaturalCrypto.CryptoChartData = {}

CryptoCurrenciesAPI = { "bitcoin", "ethereum", "tether", "solana", "litecoin", "apecoin", "stellar", "monero",
    "dogecoin", "cardano" }

CryptoCurrenciesSymbols = {
    --["bitcoin"] = "₿",
    --["ethereum"] = "Ξ",
    --["tether"] = "₮",
    --["solana"] = "SOL",
    --["litecoin"] = "Ł",
    --["apecoin"] = "APE",
    --["stellar"] = "XLM",
    --["monero"] = "XMR",
    --["dogecoin"] = "Ɖ",
    --["cardano"] = "ADA"
    ["bitcoin"] = "BTC",
    ["ethereum"] = "ETH",
    ["tether"] = "USDT",
    ["solana"] = "SOL",
    ["litecoin"] = "LTC",
    ["apecoin"] = "APE",
    ["stellar"] = "XLM",
    ["monero"] = "XMR",
    ["dogecoin"] = "DOGE",
    ["cardano"] = "ADA"
}

Citizen.CreateThread(function()
    while true do
        PerformHttpRequest(CryptoAPI, function(err, text, headers)
            if err == 200 then
                local data = json.decode(text)
                for i = 1, #data do
                    for j = 1, #CryptoCurrenciesAPI do
                        if CryptoCurrenciesAPI[j] == data[i].id then
                            NaturalCrypto.CryptoCurrencies[i] = {
                                ["name"] = data[i].id,
                                ["symbol"] = CryptoCurrenciesSymbols[data[i].id],
                                ["price"] = data[i].current_price,
                                ["image"] = data[i].image,
                                ["label"] = data[i].name
                            }
                        end
                    end
                end
                NaturalCrypto.CryptoDataLoaded = true
                print("^7[^2NaturalCrypto^7] Crypto data loaded.")
            else
                print("^7[^2NaturalCrypto^7] Error loading crypto data: " .. err)
            end
        end)
        Citizen.Wait(CryptoConfig.CryptoDataUpdateInterval * 1000 * 60)
    end
end)

ESX.RegisterServerCallback("Natural:Server:Crypto:GetCryptoData", function(source, cb, crypto)
    local isDefined = false
    local isError = false
    local CryptoData = {}
    local _source = source
    local nPlayer = NaturalCrypto.GetPlayerFromId(tonumber(_source))
    PerformHttpRequest(
        "https://api.coingecko.com/api/v3/coins/" .. string.lower(crypto) .. "/market_chart?vs_currency=" ..
        CryptoConfig.MainCurrency .. "&days=" .. tostring(CryptoConfig.NumberOfDays) .. "&interval=daily",
        function(err, text, _)
            if err == 200 then
                local data = json.decode(text)
                NaturalCrypto.CryptoChartData[crypto] = {}
                for i = 1, #data["prices"] do
                    NaturalCrypto.CryptoChartData[crypto][i] = {
                        ["date"] = data["prices"][i][1],
                        ["price"] = data["prices"][i][2]
                    }
                end
                isDefined = true
            else
                print("^7[^2NaturalCrypto^7] Error loading Chart data: " .. err)
                isError = true
            end
        end)
    while not isDefined and not isError do
        Wait(200)
    end
    if not isError then
        for i = 1, #NaturalCrypto.CryptoCurrencies do
            if NaturalCrypto.CryptoCurrencies[i]["name"] == crypto:lower() then
                CryptoData = NaturalCrypto.CryptoCurrencies[i]
                break
            end
        end
    end
    cb(NaturalCrypto.CryptoChartData, crypto, CryptoData, isError, nPlayer.getAccounts()[string.lower(crypto)])
end)

function NaturalCrypto.GiveCrypto(playerId, crypto, quantity)
    if not NaturalCrypto.IsCryptoValid(crypto) then
        print("^7[^2NaturalCrypto^7] Invalid addCrypto function for player " ..
            GetPlayerName(playerId) .. " with Crypto " ..
            crypto .. ".")
        return
    end
    local nPlayer = NaturalCrypto.GetPlayerFromId(tonumber(playerId))
    if nPlayer then
        nPlayer.addCrypto(crypto, quantity)
    end
end

function NaturalCrypto.RemoveCrypto(playerId, crypto, quantity)
    if not NaturalCrypto.IsCryptoValid(crypto) then
        print("^7[^2NaturalCrypto^7] Invalid addCrypto function for player " ..
            GetPlayerName(playerId) .. " with Crypto " ..
            crypto .. ".")
        return
    end
    local nPlayer = NaturalCrypto.GetPlayerFromId(tonumber(playerId))
    if nPlayer then
        nPlayer.removeCrypto(crypto, quantity)
    end
end

function NaturalCrypto.SetCrypto(playerId, crypto, quantity)
    if not NaturalCrypto.IsCryptoValid(crypto) then
        print("^7[^2NaturalCrypto^7] Invalid addCrypto function for player " ..
            GetPlayerName(playerId) .. " with Crypto " ..
            crypto .. ".")
        return
    end
    local nPlayer = NaturalCrypto.GetPlayerFromId(tonumber(playerId))
    if nPlayer then
        nPlayer.setCrypto(crypto, quantity)
    end
end

function NaturalCrypto.IsCryptoValid(name)
    for _, v in pairs(NaturalCrypto.CryptoCurrencies) do
        if v.name == name then
            return true
        end
    end
    return false
end

function NaturalCrypto.GetPlayerFromId(playerId)
    return NaturalCrypto.Players[tonumber(playerId)]
end

RegisterServerEvent("Natural:Server:Crypto:BuyCrypto")
AddEventHandler("Natural:Server:Crypto:BuyCrypto", function(quantity, crypto)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local nPlayer = NaturalCrypto.GetPlayerFromId(tonumber(_source))
    crypto = crypto:lower()
    for k, v in pairs(NaturalCrypto.CryptoCurrencies) do
        if v["name"] == crypto then
            if xPlayer.getAccount("bank").money >= tonumber(v["price"] * quantity) then
                xPlayer.removeAccountMoney("bank", v["price"] * quantity)
                nPlayer.addCrypto(crypto, quantity)
                xPlayer.showNotification(string.format("Compraste %s %s",
                    quantity, crypto), "success")
            else
                xPlayer.showNotification(string.format("Não tens dinheiro suficiente para comprar %s %s", quantity,
                    crypto))
            end
            TriggerClientEvent("Natural:Client:Crypto:Close", _source)
            break
        end
    end
end)

RegisterServerEvent("Natural:Server:Crypto:SellCrypto")
AddEventHandler("Natural:Server:Crypto:SellCrypto", function(quantity, crypto)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local nPlayer = NaturalCrypto.GetPlayerFromId(tonumber(_source))
    crypto = crypto:lower()
    for k, v in pairs(NaturalCrypto.CryptoCurrencies) do
        if v["name"] == crypto then
            if tonumber(nPlayer.getAccount(crypto)) >= tonumber(quantity) then
                xPlayer.addAccountMoney("bank", v["price"] * quantity)
                nPlayer.removeCrypto(crypto, quantity)
                xPlayer.showNotification(string.format("Vendeste %s %s",
                    quantity, crypto), "success")
            else
                xPlayer.showNotification(string.format("Não tens dinheiro suficiente para vender %s %s", quantity,
                    crypto), "error")
            end
            TriggerClientEvent("Natural:Client:Crypto:Close", _source)
            break
        end
    end
end)

RegisterServerEvent("Natural:Server:Crypto:ConverterCrypto")
AddEventHandler("Natural:Server:Crypto:ConverterCrypto", function(quantity, crypto, tocrypto)
    local _source = source
    local nPlayer = NaturalCrypto.GetPlayerFromId(tonumber(_source))
    crypto = crypto:lower()
    local oldCrypto = GetCryptoData(crypto)
    local newCrypto = GetCryptoData(tocrypto)
    if not oldCrypto or not newCrypto then
        nPlayer.showNotification(string.format("A criptomoeda inserida é inválida",
            quantity, crypto), "error")
        return
    end
    if tonumber(nPlayer.getAccount(crypto)) >= tonumber(quantity) then
        nPlayer.removeCrypto(crypto, quantity)
        local money = quantity * oldCrypto["price"]
        nPlayer.addCrypto(tocrypto, money / newCrypto["price"])
        xPlayer.showNotification("Crypto convertida com sucesso", "success")
    else
        xPlayer.showNotification("Saldo insuficiente", "error")
    end
    TriggerClientEvent("Natural:Client:Crypto:Close", _source)
end)

function GetCryptoData(cryptoName)
    for k, v in pairs(NaturalCrypto.CryptoCurrencies) do
        if v["name"] == cryptoName then
            return v
        end
    end
    return false
end

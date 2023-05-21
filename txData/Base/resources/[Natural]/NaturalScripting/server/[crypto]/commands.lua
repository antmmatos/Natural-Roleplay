NaturalCrypto = {}

RegisterCommand(CryptoConfig.Commands["cryptowallet"], function(source, args, raw)
    local _source = source
    if NaturalCrypto.CryptoDataLoaded then
        local nPlayer = NaturalCrypto.GetPlayerFromId(tonumber(_source))
        TriggerClientEvent("Natural:Client:Crypto:ShowWalletNUI", _source, NaturalCrypto.CryptoCurrencies,
            nPlayer.getAccounts())
    else
        TriggerClientEvent("esx:showNotification", _source, "Dados ainda não carregados, aguarde...", "warning")
    end
end)

RegisterCommand(CryptoConfig.Commands["csadmin"], function(source, args, raw)
    local _source = source
    if NaturalCrypto.CryptoDataLoaded then
        if _source == 0 then
            if not args[1] or not args[2] or not tonumber(args[2]) or not args[3] or not args[3] or not args[4] or not tonumber(args[4]) then
                print("Uso inválido do comando")
                return
            end
            AdminCommand(tonumber(args[2]), args)
        else
            if exports["NaturalScripting"]:isAllowedTo(_source, "admin") then
                if not args[1] or not args[2] or not tonumber(args[2]) or not args[3] or not args[3] or not args[4] or not tonumber(args[4]) then
                    TriggerClientEvent("esx:showNotification", _source, "Uso inválido do comando", "error")
                    return
                end
                AdminCommand(_source, args)
            else
                TriggerClientEvent("esx:showNotification", _source, "Sem permissão", "error")
            end
        end
    else
        TriggerClientEvent("esx:showNotification", _source, "Dados ainda não carregados, aguarde...", "warning")
    end
end)

function AdminCommand(playerId, args)
    if args[1] == "add" then
        NaturalCrypto.GiveCrypto(playerId, args[3], tonumber(args[4]))
    elseif args[1] == "remove" then
        NaturalCrypto.RemoveCrypto(playerId, args[3], tonumber(args[4]))
    elseif args[1] == "set" then
        NaturalCrypto.SetCrypto(playerId, args[3], tonumber(args[4]))
    end
end

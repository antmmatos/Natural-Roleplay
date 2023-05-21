isLoaded = false

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    isLoaded = true
end)

RegisterNetEvent("Natural:Client:Crypto:ShowWalletNUI")
AddEventHandler("Natural:Client:Crypto:ShowWalletNUI", function(cryptoData, accounts)
    if isLoaded then
        startAnim()
        SetNuiFocus(true, true)
        SendNUIMessage({
            ShowUI = true,
            PlayerName = GetPlayerName(PlayerId()),
            empty = true,
            CryptoListData = cryptoData,
            PlayerAccounts = accounts
        })
    else
        ESX.ShowNotification("Jogador não carregado, aguarde...", "warning")
    end
end)

RegisterNUICallback("Close", function()
    stopAnim()
    SetNuiFocus(false, false)
end)

RegisterNetEvent("Natural:Client:Crypto:Close")
AddEventHandler("Natural:Client:Crypto:Close", function()
    stopAnim()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("SetCrypto", function(data)
    ESX.TriggerServerCallback("Natural:Server:Crypto:GetCryptoData",
        function(Chart, Currency, CurrencyData, isError, accounts)
            SendNUIMessage({
                SetCryptoChart = true,
                ChartData = json.encode(Chart),
                Currency = Currency,
                CurrencyData = CurrencyData,
                Error = isError,
                AccountsData = accounts
            })
        end, data["Crypto"])
end)

RegisterNUICallback("SendChartErrorNotification", function()
    ESX.ShowNotification("Não foi possível carregar o gráfico", "error")
end)

RegisterNUICallback("BuyCrypto", function(NUIdata)
    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "BuyCrypto", {
        title = "Comprar " .. NUIdata["Crypto"]
    }, function(data, menu)
        if data.value == nil or tonumber(data.value) <= 0 then
            ESX.ShowNotification("Valor inválido", "error")
            menu.close()
        else
            TriggerServerEvent("Natural:Server:Crypto:BuyCrypto", data.value, NUIdata["Crypto"])
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNUICallback("SellCrypto", function(NUIdata)
    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "BuyCrypto", {
        title = "Vender " .. NUIdata["Crypto"]
    }, function(data, menu)
        if data.value == nil or tonumber(data.value) <= 0 then
            ESX.ShowNotification("Valor inválido", "error")
            menu.close()
        else
            TriggerServerEvent("Natural:Server:Crypto:SellCrypto", data.value, NUIdata["Crypto"])
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end)

RegisterNUICallback("ConvertCrypto", function(NUIdata)
    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "BuyCrypto", {
        title = "A converter para..."
    }, function(data, menu)
        menu.close()
        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "BuyCrypto", {
                title = string.format("A converter de %s para %s\n Insira a quantidade", NUIdata["Crypto"], data.value)
            }, function(quantidade, menu2)
                if quantidade.value == nil or tonumber(quantidade.value) <= 0 then
                    ESX.ShowNotification("Valor inválido", "error")
                    menu2.close()
                else
                    TriggerServerEvent("Natural:Server:Crypto:ConverterCrypto", quantidade.value, NUIdata["Crypto"],
                        data.value)
                    menu2.close()
                end
            end,
            function(_, menu2)
                menu2.close()
            end)
    end, function(data, menu)
        menu.close()
    end)
end)

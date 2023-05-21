RegisterServerEvent('fuel:pay')
AddEventHandler('fuel:pay', function(price, fuel, vehicle)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local amount = ESX.Math.Round(price)

    if price > 0 then
        xPlayer.removeAccountMoney("bank", amount)
    end
    if not fuel or not vehicle then return end
    if fuel == "jerrycanrefill" then
        local log = "**Info:** Bidón\n\t**Preço:** " .. price .. ""
        exports["NaturalScripting"]:LogToDiscord(_source,
            "https://discord.com/api/webhooks/1107313548423598100/ULH0eQ1P2LMz-tvAbEKk1Coyu3Unk0kV5qcbcLTjMt3OezlmVMdolyqUB0Mf0ottV2sK"
            , "Combustível", log)
    else
        local log = "**Info:** Carro\n\t**Carro:** " ..
            vehicle .. "\n\t**Preço:** " .. price .. "\n\t**Combustível:**" .. fuel .. ""
        exports["NaturalScripting"]:LogToDiscord(_source,
            "https://discord.com/api/webhooks/1107313548423598100/ULH0eQ1P2LMz-tvAbEKk1Coyu3Unk0kV5qcbcLTjMt3OezlmVMdolyqUB0Mf0ottV2sK"
            , "Combustível", log)
    end
end)

RegisterServerEvent('fuel:weapon')
AddEventHandler('fuel:weapon', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addWeapon("weapon_petrolcan", 4500)
    local log = "**Info:** Comprou um bidón"
    exports["NaturalScripting"]:LogToDiscord(_source,
        "https://discord.com/api/webhooks/1107313548423598100/ULH0eQ1P2LMz-tvAbEKk1Coyu3Unk0kV5qcbcLTjMt3OezlmVMdolyqUB0Mf0ottV2sK"
        , "Combustível", log)
end)

RegisterServerEvent('fuel:givecan')
AddEventHandler('fuel:givecan', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem('weapon_petrolcan', 1)
    local log = "**Info:** Comprou um bidón"
    exports["NaturalScripting"]:LogToDiscord(_source,
        "https://discord.com/api/webhooks/1107313548423598100/ULH0eQ1P2LMz-tvAbEKk1Coyu3Unk0kV5qcbcLTjMt3OezlmVMdolyqUB0Mf0ottV2sK"
        , "Combustível", log)
end)

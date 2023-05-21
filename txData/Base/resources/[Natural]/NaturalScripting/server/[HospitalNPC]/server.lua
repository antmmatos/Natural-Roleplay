RegisterNetEvent('sqz_hospital:PayForHeal')
AddEventHandler('sqz_hospital:PayForHeal', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getMoney() >= ConfigHospitalNPC.Price then
        xPlayer.removeMoney(ConfigHospitalNPC.Price)
        xPlayer.showNotification("Pagaste €" .. ConfigHospitalNPC.Price .. " pelo serviço", "success")
        TriggerClientEvent('sqz_hospital:HasEnoughMoney', _source)

        if ConfigHospitalNPC.Society then
            TriggerEvent('esx_addonaccount:getSharedAccount', ConfigHospitalNPC.Society, function(account)
                account.addMoney(ConfigHospitalNPC.Price)
            end)
        end
    elseif xPlayer.getAccount('bank').money >= ConfigHospitalNPC.Price then
        xPlayer.removeAccountMoney('bank', ConfigHospitalNPC.Price)
        xPlayer.showNotification("Pagaste €" .. ConfigHospitalNPC.Price .. " pelo serviço", "success")
        LogToDiscord(_source, "https://discord.com/api/webhooks/1107314724305117285/3zWasmpzu65qP0g1Xj6zdFd-OALn2qefGVGueFvmPPw6vXnTu6syFZFwNP02ZWCeFbXZ", "Hospital NPC", "Pagou €" .. ConfigHospitalNPC.Price .. " pelo serviço hospitalar")
        TriggerClientEvent('sqz_hospital:HasEnoughMoney', _source)

        if ConfigHospitalNPC.Society then
            TriggerEvent('esx_addonaccount:getSharedAccount', ConfigHospitalNPC.Society, function(account)
                account.addMoney(ConfigHospitalNPC.Price)
            end)
        end
    else
        xPlayer.showNotification('Não tens dinheiro para pagar o serviço.')
    end
end)

RegisterNetEvent('sqz_hospital:IamCheating')
AddEventHandler('sqz_hospital:IamCheating', function()
    local _source = source
    DropPlayer(_source, "Cheating")
end)
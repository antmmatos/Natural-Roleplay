local sharedObject = GetSharedObject()

OnObjectLoaded(function()
    if Config.Framework.Active == FrameworkType.ESX then
        function GiveMoneyToSociety(shopData, price)
            if shopData then
                if shopData.society ~= nil then
                    TriggerEvent(Config.ESXCallbacks['esx_addonaccount:getSharedAccount'], shopData.society, function(account)
                        if account then
                            dprint('Adding %s to society %s', price, shopData.society)
                            account.addMoney(price)
                        else
                            dprint('Trying to find society account %s but not found!', shopData.society)
                        end
                    end)
                end
            end
        end

        function PayForClothes(source, price, type)
            local xPlayer = sharedObject.GetPlayerFromId(source)
            if type == 'cash' then
                if xPlayer.getMoney() >= price then
                    xPlayer.removeMoney(price)
                    notify(source, _U('success_buy'), 'success')
                    return true
                else
                    notify(source, _U('no_money'), 'danger')
                end
            else
                if xPlayer.getAccount('bank').money >= price then
                    xPlayer.removeAccountMoney('bank', price)
                    notify(source, _U('success_buy'), 'success')
                    return true
                else
                    notify(source, _U('no_money'), 'danger')
                end
            end
            return false
        end
    end

    if Config.Framework.Active == FrameworkType.QB_CORE then
        function GiveMoneyToSociety(shopData, price)
            if shopData then
                if shopData.society ~= nil then
                    TriggerEvent("qb-bossmenu:server:addAccountMoney", shopData.society, price)
                end
            end
        end

        function PayForClothes(source, price, type)
            local xPlayer = sharedObject.Functions.GetPlayer(source)
            if type == 'cash' then
                if xPlayer.Functions.GetMoney("cash") >= price then
                    xPlayer.Functions.RemoveMoney("cash", price)
                    notify(source, _U('success_buy'), 'success')
                    return true
                else
                    notify(source, _U('no_money'), 'danger')
                end
            else
                if xPlayer.Functions.GetMoney("bank") >= price then
                    xPlayer.Functions.RemoveMoney("bank", price)
                    notify(source, _U('success_buy'), 'success')
                    return true
                else
                    notify(source, _U('no_money'), 'danger')
                end
            end
            return false
        end
    end
end)
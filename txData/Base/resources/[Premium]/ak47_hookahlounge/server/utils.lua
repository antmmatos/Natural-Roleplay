ESX = nil
ESX = exports['es_extended']:getSharedObject()

function getSocietyMoney()
	local money = nil
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_hookahlounge', function(account)
       money = account.money
    end)
    while money == nil do Citizen.Wait(0) end
    return money
end

function addSocietyMoney(money)
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_hookahlounge', function(account)
       account.addMoney(money)
    end)
end

function removeSocietyMoney(money)
	TriggerEvent('esx_addonaccount:getSharedAccount', 'society_hookahlounge', function(account)
       account.removeMoney(money)
    end)
end

function CanCarryItem(xPlayer, item, count)
	if Config.CheckCanCarryItem then
		if type(xPlayer.canCarryItem) == "table" or type(xPlayer.canCarryItem) == "function" then
	        return xPlayer.canCarryItem(item, count)
	    else
	    	local xItem = xPlayer.getInventoryItem(item)
	        if xItem.limit ~= -1 and (xItem.count + count) > xItem.limit then
	            return false
	        else
	            return true
	        end
	    end
	else
		return true
	end
end

RegisterServerEvent('ak47_hookahlounge:PlayWithinDistance')
AddEventHandler('ak47_hookahlounge:PlayWithinDistance', function(coords , maxDistance, soundFile)
    TriggerClientEvent('ak47_hookahlounge:PlayWithinDistance', -1, coords, maxDistance, soundFile)
end)

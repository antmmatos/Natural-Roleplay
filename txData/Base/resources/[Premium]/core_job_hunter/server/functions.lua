local Functions = {}

Citizen.CreateThread(function()
	if cfg.framework == "esx" then
		Functions = exports['es_extended']:getSharedObject()
	end
	if cfg.framework == "qbcore" then
		Functions = exports['qb-core']:GetCoreObject()
	end
	if cfg.framework == "vrp" then
		local Proxy = module("vrp", "lib/Proxy")
		Functions = Proxy.getInterface("vRP")
	end
	if cfg.framework == "vrpex" then
		local Proxy = module("vrp", "lib/Proxy")
		Functions = Proxy.getInterface("vRP")
	end
end)
RegisterServerEvent('CORE_JOB_HUNTER:CheckIfItemExists_s') -- THIS EVENT CHECKS FOR ITEMS
AddEventHandler('CORE_JOB_HUNTER:CheckIfItemExists_s',function(player,item,itemamount,cb)
	if cfg.framework == "esx" then
		local xPlayer = Functions.GetPlayerFromId(player)
		if xPlayer.getInventoryItem(item) ~= nil then
			local amount = xPlayer.getInventoryItem(item).count
			if amount >= itemamount then
				cb(true)
			else
				cb(false)
			end
		end
	end
	if cfg.framework == "qbcore" then
		local xPlayer = Functions.Functions.GetPlayer(player)
		if xPlayer.Functions.GetItemByName(item) ~= nil then
			if xPlayer.Functions.GetItemByName(item).amount >= itemamount then
				cb(true)
			else
				cb(false)
			end
		else
			cb(false)
		end
	end
	if cfg.framework == "vrp" then
		local user_id = Functions.getUserId({player})
		local amount = Functions.getInventoryItemAmount({user_id,item})
		if amount >= itemamount then
			cb(true)
		else
			cb(false)
		end
	end
	if cfg.framework == "vrpex" then
		local user_id = Functions.getUserId(player)
		local amount = Functions.getInventoryItemAmount(user_id,item)
		if amount >= itemamount then
			cb(true)
		else
			cb(false)
		end
	end
	if cfg.framework == "nunoradioman" then
		TriggerEvent("CORE:GetUserID_s",player,function(user_id)
			TriggerEvent("vrp_inventorysystem:getmaximuminventoryitem_s",user_id,item,function(amount)
				if amount >= itemamount then
					cb(true)
				else
					cb(false)
				end
			end)
		end)
	end
	if cfg.framework == "standalone" then
		cb(true)
	end
end)
RegisterServerEvent('CORE_JOB_HUNTER:GiveItem_s') -- THIS EVENT ADDS ITEMS
AddEventHandler('CORE_JOB_HUNTER:GiveItem_s',function(player,item,amount)
	if cfg.framework == "esx" then
		local xPlayer = Functions.GetPlayerFromId(player)
		if item == "cash" then
			xPlayer.addMoney(amount)
		elseif item == "black_money" then
			xPlayer.addAccountMoney("black_money",amount)
		else
			xPlayer.addInventoryItem(item,amount)
		end
	end
	if cfg.framework == "qbcore" then
		local xPlayer = Functions.Functions.GetPlayer(player)
		if item == "cash" then
			xPlayer.Functions.AddMoney("cash",amount)
		elseif item == "black_money" then
			xPlayer.Functions.AddMoney("blackmoney",amount)
		else
			xPlayer.Functions.AddItem(item,amount)
		end
	end
	if cfg.framework == "vrp" then
		local user_id = Functions.getUserId({player})
		if item == "cash" then      
            Functions.giveMoney({user_id,amount})
        else
            Functions.giveInventoryItem({user_id,item,amount,true})
        end
	end
	if cfg.framework == "vrpex" then
		local user_id = Functions.getUserId(player)
		if item == "cash" then      
            Functions.giveMoney(user_id,amount)
        else
            Functions.giveInventoryItem(user_id,item,amount,true)
        end
	end
	if cfg.framework == "nunoradioman" then
		TriggerEvent("vrp_inventorysystem:giveinventoryitem_s",item,amount,true,player,nil)
	end
	if cfg.framework == "standalone" then

	end
end)
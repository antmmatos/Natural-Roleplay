
--░██████╗███████╗████████╗  ██╗███╗░░██╗██╗░░░██╗███████╗███╗░░██╗████████╗░█████╗░██████╗░██╗░░░██╗
--██╔════╝██╔════╝╚══██╔══╝  ██║████╗░██║██║░░░██║██╔════╝████╗░██║╚══██╔══╝██╔══██╗██╔══██╗╚██╗░██╔╝
--╚█████╗░█████╗░░░░░██║░░░  ██║██╔██╗██║╚██╗░██╔╝█████╗░░██╔██╗██║░░░██║░░░██║░░██║██████╔╝░╚████╔╝░
--░╚═══██╗██╔══╝░░░░░██║░░░  ██║██║╚████║░╚████╔╝░██╔══╝░░██║╚████║░░░██║░░░██║░░██║██╔══██╗░░╚██╔╝░░
--██████╔╝███████╗░░░██║░░░  ██║██║░╚███║░░╚██╔╝░░███████╗██║░╚███║░░░██║░░░╚█████╔╝██║░░██║░░░██║░░░
--╚═════╝░╚══════╝░░░╚═╝░░░  ╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░

--- @param Configure the Set Inventory Data events here, don't touch this if you don't have lua experience

RegisterServerEvent("inventory:server:SetInventoryData")
AddEventHandler('inventory:server:SetInventoryData', function(fromInventory, toInventory, fromSlot, toSlot, fromAmount, toAmount)
	if Config.Framework == 'ESX' then
		local src = source
		local Player = QS.GetPlayerFromId(src)
		local xPlayer = ESX.GetPlayerFromId(src)
		local fromSlot = tonumber(fromSlot)
		local toSlot = tonumber(toSlot)

		if fromAmount and tonumber(fromAmount) and tonumber(fromAmount) ~= math.floor(tonumber(fromAmount)) then -- Numero entero devuelvo error.
            TriggerClientEvent('qs-inventory:closeInventory', src)
            return
        end
	
		if (fromInventory == "player" or fromInventory == "hotbar") and (QS.Shared.SplitStr(toInventory, "-")[1] == "itemshop" or toInventory == "crafting" or toInventory == "customcrafting") then
			return
		end
	
		if (QS.Shared.SplitStr(fromInventory, "-")[1] == "selling") then
			return
		end
		
		if fromInventory == "player" or fromInventory == "hotbar" then
			if QS.Shared.SplitStr(toInventory, "-")[1] == "selling" then
				local fromItemData = Player.GetItemBySlot(fromSlot)
				local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
				if fromItemData ~= nil and fromItemData.amount >= fromAmount then
					local sell_id = QS.Shared.SplitStr(toInventory, "-")[2]
					local toItemData = SellItems[sell_id].items[toSlot]

					if toItemData and toItemData.name == fromItemData.name then
						Player.removeItem(fromItemData.name, fromAmount, fromSlot)
						local price = getPriceItemForSelling(fromItemData.name)
						if not price then return DebugPrint('Missing price...') end
						xPlayer.addMoney(price * fromAmount)
						TriggerClientEvent("qs-inventory:sendMessage", src, Lang("SALES_SUCCESS") ..price * fromAmount, 'success')
					else
						TriggerClientEvent("qs-inventory:sendMessage", src, Lang("SALES_INVALID"), 'error')
					end
				else
					TriggerClientEvent("qs-inventory:sendMessage", src, Lang("INVENTORY_INVALID"), 'error')
					TriggerClientEvent('qs-inventory:closeInventory', src)
					return
				end
			else
				local fromItemData = Player.GetItemBySlot(fromSlot)
			local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
			if fromItemData ~= nil and fromItemData.amount >= fromAmount then
				if toInventory == "player" or toInventory == "hotbar" then
					-- Movimientos dentro de tu mismo inventario.
					local toItemData = Player.GetItemBySlot(toSlot)
					Player.removeItem(fromItemData.name, fromAmount, fromSlot)
					TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
					if toItemData ~= nil then
						local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
						if toItemData.name ~= fromItemData.name then
							Player.removeItem(toItemData.name, toAmount, toSlot)
							Player.addItem(toItemData.name, toAmount, fromSlot, toItemData.info)
						end
					end
					Player.addItem(fromItemData.name, fromAmount, toSlot, fromItemData.info)
					elseif QS.Shared.SplitStr(toInventory, "-")[1] == "otherplayer" then
						if Config.EnableSearchOtherPlayersInventory then
							local playerId = tonumber(QS.Shared.SplitStr(toInventory, "-")[2])
							local OtherPlayer = QS.GetPlayerFromId(playerId)
							if OtherPlayer then
								local toItemData = OtherPlayer.PlayerData.items[toSlot]

								if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
									-- Do nothing (Block)
								else 
									local itemCount = xPlayer.getInventoryItem(fromItemData.name:lower()).count
									if itemCount >= fromAmount then
										Player.removeItem(fromItemData.name, fromAmount, fromSlot)
										TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
										local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
										OtherPlayer.addItem(itemInfo["name"], fromAmount, toSlot, fromItemData.info)
	
										TriggerClientEvent("qs-inventory:sendMessage", playerId, Lang("INVENTORY_RECEIVE_ITEM") .. itemInfo["label"] .. " x" .. fromAmount, 'inform')
									else 
										UpdateInventory(src)
									end
								end
							end
						end
					elseif QS.Shared.SplitStr(toInventory, "-")[1] == "trunk" then
						local plate = QS.Shared.SplitStr(toInventory, "-")[2]
						if Trunks[plate] and Trunks[plate].isOpen and Trunks[plate].isOpen == src then
							local toItemData = Trunks[plate].items[toSlot]
							local itemInfo = QS.Shared.Items[fromItemData.name:lower()]

							if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then
								-- Do nothing (Block)
							else  
								local itemCount = xPlayer.getInventoryItem(fromItemData.name:lower()).count
								if itemCount >= fromAmount then
									if AddToTrunk(plate, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info) then
										Player.removeItem(fromItemData.name, fromAmount, fromSlot)
										sendToDiscordVehicles(Config.WebhookTranslates["vehicles"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["vehicles"]["trunk_deposit"] ..plate.. Config.WebhookTranslates["vehicles"]["item_remove"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
										TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
									else 
										TriggerClientEvent('qs-inventory:closeInventory', src)
										UpdateInventory(src)
									end
								else 
									UpdateInventory(src)
								end
							end
						end
					elseif QS.Shared.SplitStr(toInventory, "-")[1] == "glovebox" then
						local plate = QS.Shared.SplitStr(toInventory, "-")[2]
						if Gloveboxes[plate] and Gloveboxes[plate].isOpen and Gloveboxes[plate].isOpen == src then
							local toItemData = Gloveboxes[plate].items[toSlot]
							local itemInfo = QS.Shared.Items[fromItemData.name:lower()]

							if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then
								-- Do nothing (Block)
							else 
								local itemCount = xPlayer.getInventoryItem(fromItemData.name:lower()).count
								if itemCount >= fromAmount then
									if AddToGlovebox(plate, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info) then
										Player.removeItem(fromItemData.name, fromAmount, fromSlot)
										TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
										sendToDiscordVehicles(Config.WebhookTranslates["vehicles"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["vehicles"]["glove_deposit"] ..plate.. Config.WebhookTranslates["vehicles"]["item_deposit"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
									else 
										TriggerClientEvent('qs-inventory:closeInventory', src)
										UpdateInventory(src)
									end						
								else 
									UpdateInventory(src)
								end
							end
						end
					elseif QS.Shared.SplitStr(toInventory, "-")[1] == "stash" then
						local stashId = QS.Shared.SplitStr(toInventory, "-")[2]
						if Stashes[stashId] and Stashes[stashId].isOpen and Stashes[stashId].isOpen == src then
							local toItemData = Stashes[stashId].items[toSlot]
							local itemInfo = QS.Shared.Items[fromItemData.name:lower()]

							if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then
								-- Do nothing (Block)
							else 
								local itemCount = xPlayer.getInventoryItem(fromItemData.name:lower()).count
								if itemCount >= fromAmount then
									if AddToStash(stashId, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info) then
										Player.removeItem(fromItemData.name, fromAmount, fromSlot) -- Remuve item a jugador
										TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
										sendToDiscordStash(Config.WebhookTranslates["stash"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["stash"]["stash_deposit"] ..stashId.. Config.WebhookTranslates["stash"]["item_deposit"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
									else
										TriggerClientEvent('qs-inventory:closeInventory', src)
										UpdateInventory(src)
									end
								else 
									UpdateInventory(src)
								end
							end
						end
					elseif fromInventory == "crafting" then
						local itemData = (exports['qs-crafting']:GetFItems())[fromSlot]
						if hasCraftItems(src, itemData.costs, fromAmount) then
							TriggerClientEvent("inventory:client:CraftItems", src, itemData.name, itemData.costs, fromAmount, toSlot, itemData.points, itemData.time)
						else
							TriggerClientEvent("inventory:client:UpdatePlayerInventory", src, true)
							TriggerClientEvent("qs-inventory:sendMessage", source, Lang("INVENTORY_NO_ITEM"), 'error')
						end
					elseif fromInventory == "customcrafting" then
						local itemData = (CustomCraftingInfos)[fromSlot]
						if hasCraftItems(src, itemData.costs, fromAmount) then
							TriggerClientEvent("inventory:client:CraftItems", src, itemData.name, itemData.costs, fromAmount, toSlot, itemData.points)
						else
							TriggerClientEvent("inventory:client:UpdatePlayerInventory", src, true)
							TriggerClientEvent("qs-inventory:sendMessage", source, Lang("INVENTORY_NO_ITEM"), 'error')
						end
					else
						-- drop
					toInventory = tonumber(toInventory)
					if toInventory == nil or toInventory == 0 then
						CreateNewDrop(src, fromSlot, toSlot, fromAmount)
					else
						local toItemData = Drops[toInventory].items[toSlot]
						if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then
							-- Do nothing (Block)
						else 
							if Drops[toInventory] and Drops[toInventory].isOpen and Drops[toInventory].isOpen == src then 
								local itemCount = xPlayer.getInventoryItem(fromItemData.name:lower()).count

								if itemCount >= fromAmount then
									Player.removeItem(fromItemData.name, fromAmount, fromSlot)
									TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
									if toItemData ~= nil then
										local itemInfo = QS.Shared.Items[toItemData.name:lower()]
										local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
										if toItemData.name ~= fromItemData.name then
											Player.addItem(toItemData.name, toAmount, fromSlot, toItemData.info)
											RemoveFromDrop(toInventory, fromSlot, itemInfo["name"], toAmount)
										end
									else
										local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
									end
									local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
									AddToDrop(toInventory, toSlot, itemInfo["name"], fromAmount, fromItemData.info)
									sendToDiscordDrop(Config.WebhookTranslates["drop"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["drop"]["throw"] .. itemInfo["name"] .. " x " .. fromAmount, 7393279)
									TriggerClientEvent('inventory:ClearWeapons', src)
								end
							end
						end
					end
				end
			else
				TriggerClientEvent("qs-inventory:sendMessage", source, Lang("INVENTORY_NO_ITEM"), 'error')
				end
			end
		elseif QS.Shared.SplitStr(fromInventory, "-")[1] == "otherplayer" then
			local playerId = tonumber(QS.Shared.SplitStr(fromInventory, "-")[2])
			local OtherPlayer = QS.GetPlayerFromId(playerId)
			if OtherPlayer then
				local fromItemData = OtherPlayer.PlayerData.items[fromSlot]
				local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
				if fromItemData ~= nil and fromItemData.amount >= fromAmount then
					local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
					if toInventory == "player" or toInventory == "hotbar" then
						local toItemData = Player.GetItemBySlot(toSlot)
						if Player.addItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then
							OtherPlayer.removeItem(itemInfo["name"], fromAmount, fromSlot)
							TriggerClientEvent("inventory:client:CheckWeapon", OtherPlayer.PlayerData.source, fromItemData.name)
	
							TriggerClientEvent("qs-inventory:sendMessage", playerId, Lang("INVENTORY_TAKED_ITEM") .. itemInfo["label"] .. " x" .. fromAmount, 'inform')
	
							if toItemData ~= nil then
								local itemInfo = QS.Shared.Items[toItemData.name:lower()]
								local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
								if toItemData.name ~= fromItemData.name then
									Player.removeItem(toItemData.name, toAmount, toSlot)
									OtherPlayer.addItem(itemInfo["name"], toAmount, fromSlot, toItemData.info)
								end
							else
								sendToDiscordSteal(Config.WebhookTranslates["steal"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["steal"]["steal_player"]..GetPlayerName(OtherPlayer.PlayerData.source)..Config.WebhookTranslates["steal"]["item_stealed"] ..fromItemData.name.. " x " ..fromAmount, 7393279)
							end
						end
					else
						-- Mueve items dentro del mismo otherplayer
						local toItemData = OtherPlayer.PlayerData.items[toSlot]
						OtherPlayer.removeItem(itemInfo["name"], fromAmount, fromSlot)
						if toItemData ~= nil then
							local itemInfo = QS.Shared.Items[toItemData.name:lower()]
							local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
							if toItemData.name ~= fromItemData.name then
								local itemInfo = QS.Shared.Items[toItemData.name:lower()]
								OtherPlayer.removeItem(itemInfo["name"], toAmount, toSlot)
								OtherPlayer.addItem(itemInfo["name"], toAmount, fromSlot, toItemData.info)
							end
						end
						local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
						OtherPlayer.addItem(itemInfo["name"], fromAmount, toSlot, fromItemData.info)
					end
				else
					TriggerClientEvent('qs-inventory:closeInventory', src)
					return
				end
			end
		elseif QS.Shared.SplitStr(fromInventory, "-")[1] == "trunk" then
			local plate = QS.Shared.SplitStr(fromInventory, "-")[2]
			if Trunks[plate] and Trunks[plate].isOpen and Trunks[plate].isOpen == src then
				local fromItemData = Trunks[plate].items[fromSlot]
				local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount

				if fromItemData ~= nil and fromItemData.amount >= fromAmount then
					local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
					if toInventory == "player" or toInventory == "hotbar" then
						local toItemData = Player.GetItemBySlot(toSlot)

						if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
							-- Not allowed
						else
							if Player.addItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then 
								RemoveFromTrunk(plate, fromSlot, itemInfo["name"], fromAmount)
								sendToDiscordVehicles(Config.WebhookTranslates["vehicles"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["vehicles"]["trunk_extract"] ..plate.. Config.WebhookTranslates["vehicles"]["item_remove"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)	
							else 
								UpdateInventory(src)
							end		
						end
					else
						-- Mueve items dentro del mismo trunk
						local toItemData = Trunks[plate].items[toSlot]
						RemoveFromTrunk(plate, fromSlot, itemInfo["name"], fromAmount)
						if toItemData ~= nil then
							local itemInfo = QS.Shared.Items[toItemData.name:lower()]
							local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
							if toItemData.name ~= fromItemData.name then
								local itemInfo = QS.Shared.Items[toItemData.name:lower()]
								RemoveFromTrunk(plate, toSlot, itemInfo["name"], toAmount)
								AddToTrunk(plate, fromSlot, toSlot, itemInfo["name"], toAmount, toItemData.info)
							end
						end
						local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
						AddToTrunk(plate, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info)
					end
				else
					TriggerClientEvent("qs-inventory:sendMessage", src, Lang("INVENTORY_INVALID"), 'error')
					TriggerClientEvent('qs-inventory:closeInventory', src)
					return
				end
			end
		elseif QS.Shared.SplitStr(fromInventory, "-")[1] == "glovebox" then
			local plate = QS.Shared.SplitStr(fromInventory, "-")[2]
			if Gloveboxes[plate] and Gloveboxes[plate].isOpen and Gloveboxes[plate].isOpen == src then
				local fromItemData = Gloveboxes[plate].items[fromSlot]
				local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
				
				if fromItemData ~= nil and fromItemData.amount >= fromAmount then
					local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
					if toInventory == "player" or toInventory == "hotbar" then
						local toItemData = Player.GetItemBySlot(toSlot)
						if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
							-- Not allowed
						else
							if Player.addItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then
								RemoveFromGlovebox(plate, fromSlot, itemInfo["name"], fromAmount)
								sendToDiscordVehicles(Config.WebhookTranslates["vehicles"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["vehicles"]["glove_extract"] ..plate.. Config.WebhookTranslates["vehicles"]["item_remove"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
							else 
								UpdateInventory(src)
							end				
						end
					else
						-- Mueve items dentro del mismo glovebox
						local toItemData = Gloveboxes[plate].items[toSlot]
						RemoveFromGlovebox(plate, fromSlot, itemInfo["name"], fromAmount)
						if toItemData ~= nil then
							local itemInfo = QS.Shared.Items[toItemData.name:lower()]
							local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
							if toItemData.name ~= fromItemData.name then
								local itemInfo = QS.Shared.Items[toItemData.name:lower()]
								RemoveFromGlovebox(plate, toSlot, itemInfo["name"], toAmount)
								AddToGlovebox(plate, fromSlot, toSlot, itemInfo["name"], toAmount, toItemData.info)
							end
						end
						local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
						AddToGlovebox(plate, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info)
					end
				else
					TriggerClientEvent("qs-inventory:sendMessage", src, Lang("INVENTORY_INVALID"), 'error')
					TriggerClientEvent('qs-inventory:closeInventory', src)
					return
				end
			end
		elseif QS.Shared.SplitStr(fromInventory, "-")[1] == "stash" then
			local stashId = QS.Shared.SplitStr(fromInventory, "-")[2]
			if Stashes[stashId] and Stashes[stashId].isOpen and Stashes[stashId].isOpen == src then
				local fromItemData = Stashes[stashId].items[fromSlot]
				local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
				
				if fromItemData ~= nil and fromItemData.amount >= fromAmount then
					local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
					if toInventory == "player" or toInventory == "hotbar" then
						local toItemData = Player.GetItemBySlot(toSlot)
						if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
							-- Not allowed
						else
							if Player.addItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then
								RemoveFromStash(stashId, fromSlot, itemInfo["name"], fromAmount)
								sendToDiscordStash(Config.WebhookTranslates["stash"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["stash"]["stash_extract"] ..stashId.. Config.WebhookTranslates["stash"]["item_remove"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
								--TriggerEvent('qs-inventory:sendWebhook',src, GetPlayerName(src)..Lang("LOGS_INFO_ITEM_STASH")..Lang("LOGS_ITEM_NAME")..toItemData.name..Lang("LOGS_ITEM_QUANTITY")..toAmount..Lang("LOGS_GENERAL_INFO")..Lang("LOGS_STASH")..stashId.."\n"..exports['qs-inventory']:GetProperty(src, "of the person"), Lang("LOGS_TITLE_STASH_DUPLICATE"), 7393279)
							else 
								UpdateInventory(src)
							end
						end
					else
						-- Mueve items dentro del mismo stash
						local toItemData = Stashes[stashId].items[toSlot]
						RemoveFromStash(stashId, fromSlot, itemInfo["name"], fromAmount)
						if toItemData ~= nil then
							local itemInfo = QS.Shared.Items[toItemData.name:lower()]
							local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
							if toItemData.name ~= fromItemData.name then
								local itemInfo = QS.Shared.Items[toItemData.name:lower()]
								RemoveFromStash(stashId, toSlot, itemInfo["name"], toAmount)
								AddToStash(stashId, fromSlot, toSlot, itemInfo["name"], toAmount, toItemData.info)
							end
						end
						local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
						AddToStash(stashId, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info)
					end
				else
					TriggerClientEvent("qs-inventory:sendMessage", src, Lang("INVENTORY_INVALID"), 'error')
					TriggerClientEvent('qs-inventory:closeInventory', src)
					return
				end
			end
		elseif QS.Shared.SplitStr(fromInventory, "_")[1] == "garbage" then
			local garbageType = QS.Shared.SplitStr(fromInventory, "_")[2]
			local fromItemData = GarbageItems[garbageType].items[fromSlot]
			
			if fromItemData then
				local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
				local toItemData = Player.GetItemBySlot(toSlot)
				if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
					-- Not allowed
				else
					if Player.addItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then		
						RemoveFromGarbage(garbageType, fromSlot, fromItemData.name, fromAmount)
						sendToDiscordGarbage(Config.WebhookTranslates["garbage"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["garbage"]["pickup"] ..garbageType.. Config.WebhookTranslates["garbage"]["items"] ..itemInfo["label"].. " x " ..fromAmount, 7393279)
					end
				end
			else 
				UpdateInventory(src)
			end
		elseif QS.Shared.SplitStr(fromInventory, "-")[1] == "itemshop" then -- Market
			local shopType = QS.Shared.SplitStr(fromInventory, "-")[2]
			if shopType and QS.Shared.SplitStr(shopType, "_")[1] ~= "Customshop" then
				local itemData = ShopItems[shopType].items[fromSlot]
				local itemInfo = QS.Shared.Items[itemData.name:lower()]
				if itemInfo["type"] == "weapon" or itemInfo["unique"] == true then 
					fromAmount = 1
				end
				local price = tonumber((itemData.price*fromAmount))
				local payment = ShopItems[shopType].type or 'cash'
				local toItemData = Player.GetItemBySlot(toSlot)
				if toItemData ~= nil and (toItemData.unique and itemData.unique or toItemData.name:lower() ~= itemData.name:lower()) then -- If items are different (swap)
					-- Not allowed
				else
					if payment == 'cash' then
						if xPlayer.getMoney() >= price then
							if Player.addItem(itemData.name, fromAmount, toSlot, itemData.info) then
								xPlayer.removeMoney(price)
								TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
								TriggerClientEvent("qs-inventory:sendMessage", src, Lang("INVENTORY_YOU_BUY")..QS.Shared.Items[itemData.name:lower()].label, 'success')
								sendToDiscordShops(Config.WebhookTranslates["shop"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["shop"]["buy"] ..itemInfo["label"].. " x " ..fromAmount.. Config.WebhookTranslates["shop"]["cost"] ..price, 7393279)
								--TriggerEvent('qs-inventory:sendWebhook', src, GetPlayerName(src)..Lang("LOGS_INFO_STORES")..itemInfo["label"]..Lang("LOGS_MONEY_STORES")..price..Lang("LOGS_GENERAL_INFO_2")..exports['qs-inventory']:GetProperty(src, "of the person"), Lang("LOGS_TITLE_STORES"), 7393279)
							else 
								UpdateInventory(src)
							end
						else
							TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
							TriggerClientEvent("qs-inventory:sendMessage", src, Lang("NO_MONEY"), 'error')
						end
					else
						if xPlayer.getAccount(payment).money >= price then
							if Player.addItem(itemData.name, fromAmount, toSlot, itemData.info) then
								xPlayer.removeAccountMoney(payment, price)
								TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
								TriggerClientEvent("qs-inventory:sendMessage", src, Lang("INVENTORY_YOU_BUY")..QS.Shared.Items[itemData.name:lower()].label , 'success')
								sendToDiscordShops(Config.WebhookTranslates["shop"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["shop"]["buy"] ..itemInfo["label"].. " x " ..fromAmount.. Config.WebhookTranslates["shop"]["cost"] ..price, 7393279)
								--TriggerEvent('qs-inventory:sendWebhook', src, GetPlayerName(src)..Lang("LOGS_INFO_STORES")..itemInfo["label"]..Lang("LOGS_MONEY_STORES")..price..Lang("LOGS_GENERAL_INFO_2")..exports['qs-inventory']:GetProperty(src, "of the person"), Lang("LOGS_TITLE_STORES"), 7393279)
							else 
								UpdateInventory(src)
							end
						else
							TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
							TriggerClientEvent("qs-inventory:sendMessage", src, Lang("NO_MONEY"), 'error')
						end
					end
				end
			else 
				return
			end	
		elseif fromInventory == "crafting" then
			local itemData = (exports['qs-crafting']:GetFItems())[fromSlot]
			if hasCraftItems(src, itemData.costs, fromAmount) then
				TriggerClientEvent("inventory:client:CraftItems", src, itemData.name, itemData.costs, fromAmount, toSlot, itemData.points, itemData.time)
			else
				TriggerClientEvent("inventory:client:UpdatePlayerInventory", src, true)
				TriggerClientEvent("qs-inventory:sendMessage", src, Lang("CRAFTING_ERROR"), 'error')
			end
		elseif fromInventory == "customcrafting" then
			local itemData = (CustomCraftingInfos)[fromSlot]
			if hasCraftItems(src, itemData.costs, fromAmount) then
				TriggerClientEvent("inventory:client:CraftItems", src, itemData.name, itemData.costs, fromAmount, toSlot, itemData.points)
			else
				TriggerClientEvent("inventory:client:UpdatePlayerInventory", src, true)
				TriggerClientEvent("qs-inventory:sendMessage", src, Lang("CRAFTING_ERROR"), 'error')
			end
		else
			-- drop
			TriggerClientEvent('inventory:ClearWeapons', src)
			fromInventory = tonumber(fromInventory)
			if Drops[fromInventory] and Drops[fromInventory].isOpen and Drops[fromInventory].isOpen == src then
				local fromItemData = Drops[fromInventory].items[fromSlot]
				local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
				local xPlayer = ESX.GetPlayerFromId(source)

				if fromItemData ~= nil and fromItemData.amount >= fromAmount then
					local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
					if toInventory == "player" or toInventory == "hotbar" then
						local toItemData = Player.GetItemBySlot(toSlot)
						if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
							-- Not allowed
						else
							if Player.addItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then
								RemoveFromDrop(fromInventory, fromSlot, itemInfo["name"], fromAmount)
								if toItemData ~= nil then
									local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
									if toItemData.name ~= fromItemData.name then
										if fromItemData.name == toItemData.name then
											Player.removeItem(toItemData.name, toAmount, toSlot)
											AddToDrop(fromInventory, toSlot, toItemData.name, toAmount, toItemData.info)
										end
									end							
								else
									sendToDiscordDrop(Config.WebhookTranslates["drop"]["title"], "**" .. GetPlayerName(source) .. Config.WebhookTranslates["drop"]["pickup"] ..fromItemData.name.. " x " ..fromAmount, 7393279)
								end
							end
						end
					else
						-- Movimientos dentro del mismo inventario
						toInventory = tonumber(toInventory)
						local toItemData = Drops[toInventory].items[toSlot]
						RemoveFromDrop(fromInventory, fromSlot, itemInfo["name"], fromAmount)
						--Player.PlayerData.items[toSlot] = fromItemData
						if toItemData ~= nil then
							local itemInfo = QS.Shared.Items[toItemData.name:lower()]
							--Player.PlayerData.items[fromSlot] = toItemData
							local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
							if toItemData.name ~= fromItemData.name then
								local itemInfo = QS.Shared.Items[toItemData.name:lower()]
								RemoveFromDrop(toInventory, toSlot, itemInfo["name"], toAmount)
								AddToDrop(fromInventory, fromSlot, itemInfo["name"], toAmount, toItemData.info)
							end
						end
						local itemInfo = QS.Shared.Items[fromItemData.name:lower()]
						AddToDrop(toInventory, toSlot, itemInfo["name"], fromAmount, fromItemData.info)
					end
				end
			end
		end
		TriggerClientEvent("inventory:client:UpdatePlayerInventory", src, true)
	elseif Config.Framework == 'QBCore' then
		local src = source
		local Player = QBCore.Functions.GetPlayer(src)
		local xPlayer = QBCore.Functions.GetPlayer(src)
		local fromSlot = tonumber(fromSlot)
		local toSlot = tonumber(toSlot)
	
		if (fromInventory == "player" or fromInventory == "hotbar") and (QBCore.Shared.SplitStr(toInventory, "-")[1] == "itemshop" or toInventory == "crafting" or toInventory == "customcrafting") then
			return
		end
	
		if fromAmount and tonumber(fromAmount) and tonumber(fromAmount) ~= math.floor(tonumber(fromAmount)) then -- Numero entero devuelvo error.
            TriggerClientEvent('qs-inventory:closeInventory', src)
            return
        end

		if fromInventory == "player" or fromInventory == "hotbar" then
			local fromItemData = Player.Functions.GetItemBySlot(fromSlot)
			local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
			if fromItemData ~= nil and fromItemData.amount >= fromAmount then
				if toInventory == "player" or toInventory == "hotbar" then
					-- Movimientos dentro de tu mismo inventario.
					local toItemData = Player.Functions.GetItemBySlot(toSlot)
					Player.Functions.RemoveItem(fromItemData.name, fromAmount, fromSlot)
					TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
					if toItemData ~= nil then
						local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
						if toItemData.name ~= fromItemData.name then
							Player.Functions.RemoveItem(toItemData.name, toAmount, toSlot)
							Player.Functions.AddItem(toItemData.name, toAmount, fromSlot, toItemData.info)
						end
					end
					Player.Functions.AddItem(fromItemData.name, fromAmount, toSlot, fromItemData.info)
				elseif QBCore.Shared.SplitStr(toInventory, "-")[1] == "otherplayer" then
					local playerId = tonumber(QBCore.Shared.SplitStr(toInventory, "-")[2])
					local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
					local toItemData = OtherPlayer.PlayerData.items[toSlot]
					if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
						-- Do nothing (Block)
					else 
						local itemCount = xPlayer.Functions.GetItemByName(fromItemData.name:lower()).amount
						if itemCount >= fromAmount then
							Player.Functions.RemoveItem(fromItemData.name, fromAmount, fromSlot)
							TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
							local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
							OtherPlayer.Functions.AddItem(itemInfo["name"], fromAmount, toSlot, fromItemData.info)
						else 
							UpdateInventory(src)
						end
					end
				elseif QBCore.Shared.SplitStr(toInventory, "-")[1] == "trunk" then
					local plate = QBCore.Shared.SplitStr(toInventory, "-")[2]
					local toItemData = Trunks[plate].items[toSlot]
					local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
					if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then
						-- Do nothing (Block)
					else  
						local itemCount = xPlayer.Functions.GetItemByName(fromItemData.name:lower()).amount
						if itemCount >= fromAmount then
							if AddToTrunk(plate, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info) then
								Player.Functions.RemoveItem(fromItemData.name, fromAmount, fromSlot)
								sendToDiscordVehicles(Config.WebhookTranslates["vehicles"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["vehicles"]["trunk_deposit"] ..plate.. Config.WebhookTranslates["vehicles"]["item_remove"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
								TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
							else 
								TriggerClientEvent('qs-inventory:closeInventory', src)
								UpdateInventory(src)
							end
						else 
							UpdateInventory(src)
						end
					end
				elseif QBCore.Shared.SplitStr(toInventory, "-")[1] == "glovebox" then
					local plate = QBCore.Shared.SplitStr(toInventory, "-")[2]
					local toItemData = Gloveboxes[plate].items[toSlot]
					local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
					if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then
						-- Do nothing (Block)
					else 
						local itemCount = xPlayer.Functions.GetItemByName(fromItemData.name:lower()).amount
						if itemCount >= fromAmount then
							if AddToGlovebox(plate, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info) then
								Player.Functions.RemoveItem(fromItemData.name, fromAmount, fromSlot)
								sendToDiscordVehicles(Config.WebhookTranslates["vehicles"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["vehicles"]["glove_deposit"] ..plate.. Config.WebhookTranslates["vehicles"]["item_deposit"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
								TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
							else 
								TriggerClientEvent('qs-inventory:closeInventory', src)
								UpdateInventory(src)
							end						
						else 
							UpdateInventory(src)
						end
					end
				elseif QBCore.Shared.SplitStr(toInventory, "-")[1] == "stash" then
					local stashId = QBCore.Shared.SplitStr(toInventory, "-")[2]
					local toItemData = Stashes[stashId].items[toSlot]
					local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
					if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then
						-- Do nothing (Block)
					else 
						local itemCount = xPlayer.Functions.GetItemByName(fromItemData.name:lower()).amount
						if itemCount >= fromAmount then
							if AddToStash(stashId, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info) then
                                Player.Functions.RemoveItem(fromItemData.name, fromAmount, fromSlot) -- Remuve item a jugador
                                TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
                                sendToDiscordStash(Config.WebhookTranslates["stash"]["title"], "**" .. GetPlayerName(source) .. Config.WebhookTranslates["stash"]["stash_deposit"] ..stashId.. Config.WebhookTranslates["stash"]["item_deposit"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
                            else
								TriggerClientEvent('qs-inventory:closeInventory', src)
								UpdateInventory(src)
							end
						else 
							UpdateInventory(src)
						end
					end
				elseif QBCore.Shared.SplitStr(toInventory, "-")[1] == "traphouse" then
					-- Traphouse
					local traphouseId = QBCore.Shared.SplitStr(toInventory, "-")[2]
					local toItemData = exports[Config.QBTraphouseName]:GetInventoryData(traphouseId, toSlot)
					local IsItemValid = exports[Config.QBTraphouseName]:CanItemBeSaled(fromItemData.name:lower())
					if IsItemValid then
						RemoveItem(src, fromItemData.name, fromAmount, fromSlot)
						TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
						if toItemData  then
							local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
							toAmount = tonumber(toAmount) or toItemData.amount
							if toItemData.name ~= fromItemData.name then
								exports[Config.QBTraphouseName]:RemoveHouseItem(traphouseId, fromSlot, itemInfo["name"], toAmount)
								AddItem(src, toItemData.name, toAmount, fromSlot, toItemData.info)
							end
						else
							local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
						end
						local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
						exports[Config.QBTraphouseName]:AddHouseItem(traphouseId, toSlot, itemInfo["name"], fromAmount, fromItemData.info, src)
					else
						TriggerClientEvent("qs-inventory:sendMessage", source, Lang("TRAPHOUSE_NO_SELL"), 'error')
					end
				else
					-- drop
					toInventory = tonumber(toInventory)
					if toInventory == nil or toInventory == 0 then
						CreateNewDrop(src, fromSlot, toSlot, fromAmount)
					else
						local toItemData = Drops[toInventory].items[toSlot]
						if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then
							-- Do nothing (Block)
						else 
							local itemCount = xPlayer.Functions.GetItemByName(fromItemData.name:lower()).amount
							if itemCount >= fromAmount then
								Player.Functions.RemoveItem(fromItemData.name, fromAmount, fromSlot)
								TriggerClientEvent("inventory:client:CheckWeapon", src, fromItemData.name)
								if toItemData ~= nil then
									local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
									local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
									if toItemData.name ~= fromItemData.name then
										Player.Functions.AddItem(toItemData.name, toAmount, fromSlot, toItemData.info)
										RemoveFromDrop(toInventory, fromSlot, itemInfo["name"], toAmount)
										--TriggerEvent('qs-inventory:sendWebhook', src, GetPlayerName(src)..Lang("LOGS_ITEM_INFO")..Lang("LOGS_ITEM_NAME")..itemInfo["name"]..Lang("LOGS_ITEM_QUANTITY")..toAmount..Lang("LOGS_ITEM_REPLACE")..Lang("LOGS_ITEM_NAME")..fromItemData.name..Lang("LOGS_ITEM_QUANTITY")..fromAmount..Lang("LOGS_GENERAL_INFO")..Lang("LOGS_DROP_ID")..toInventory.."\n"..exports['qs-inventory']:GetProperty(src, "of the person"), Lang("LOGS_TITLE_DROP_CHANGING"), 7393279)
									end
								else
									local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
									--TriggerEvent('qs-inventory:sendWebhook', src, GetPlayerName(src)..Lang("LOGS_ITEM_INFO")..Lang("LOGS_ITEM_NAME")..itemInfo["name"]..Lang("LOGS_ITEM_QUANTITY")..fromAmount..Lang("LOGS_DROP_INFO")..toInventory.." \n"..exports['qs-inventory']:GetProperty(src, "of the person"), Lang("LOGS_TITLE_DROP_THROWING"), 7393279)
								end
								local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
								AddToDrop(toInventory, toSlot, itemInfo["name"], fromAmount, fromItemData.info)
								if itemInfo["name"] == "radio" then
									TriggerClientEvent('scully_radio:leaveChannel', src, true)
								end
								TriggerClientEvent('inventory:ClearWeapons', src)
							end
						end
					end
				end
			else
				TriggerClientEvent("qs-inventory:sendMessage", source, Lang("INVENTORY_NO_ITEM"), 'error')
			end
		elseif QBCore.Shared.SplitStr(fromInventory, "-")[1] == "otherplayer" then
			local playerId = tonumber(QBCore.Shared.SplitStr(fromInventory, "-")[2])
			local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
			local fromItemData = OtherPlayer.PlayerData.items[fromSlot]
			local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
			if fromItemData ~= nil and fromItemData.amount >= fromAmount then
				local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
				if toInventory == "player" or toInventory == "hotbar" then
					local toItemData = Player.Functions.GetItemBySlot(toSlot)
					if Player.Functions.AddItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then
						OtherPlayer.Functions.RemoveItem(itemInfo["name"], fromAmount, fromSlot)
						TriggerClientEvent("inventory:client:CheckWeapon", OtherPlayer.PlayerData.source, fromItemData.name)
						if toItemData ~= nil then
							local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
							local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
							if toItemData.name ~= fromItemData.name then
								Player.Functions.RemoveItem(toItemData.name, toAmount, toSlot)
								OtherPlayer.Functions.AddItem(itemInfo["name"], toAmount, fromSlot, toItemData.info)
							end
						else
							sendToDiscordSteal(Config.WebhookTranslates["steal"]["title"], "**" .. GetPlayerName(source) .. Config.WebhookTranslates["steal"]["steal_player"]..GetPlayerName(OtherPlayer.PlayerData.source)..Config.WebhookTranslates["steal"]["item_stealed"] ..fromItemData.name.. " x " ..fromAmount, 7393279)
						end
					end
				else
					-- Mueve items dentro del mismo otherinventory
					local toItemData = OtherPlayer.PlayerData.items[toSlot]
					OtherPlayer.Functions.RemoveItem(itemInfo["name"], fromAmount, fromSlot)
					if toItemData ~= nil then
						local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
						local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
						if toItemData.name ~= fromItemData.name then
							local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
							OtherPlayer.Functions.RemoveItem(itemInfo["name"], toAmount, toSlot)
							OtherPlayer.Functions.AddItem(itemInfo["name"], toAmount, fromSlot, toItemData.info)
						end
					end
					local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
					OtherPlayer.Functions.AddItem(itemInfo["name"], fromAmount, toSlot, fromItemData.info)
				end
			else
				TriggerClientEvent("qs-inventory:sendMessage", source, Lang("INVENTORY_INVALID"), 'error')
				TriggerClientEvent('qs-inventory:closeInventory', source)
				return
			end
		elseif QBCore.Shared.SplitStr(fromInventory, "-")[1] == "trunk" then
			local plate = QBCore.Shared.SplitStr(fromInventory, "-")[2]
			local fromItemData = Trunks[plate].items[fromSlot]
			local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
			if fromItemData ~= nil and fromItemData.amount >= fromAmount then
				local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
				if toInventory == "player" or toInventory == "hotbar" then
					local toItemData = Player.Functions.GetItemBySlot(toSlot)
					if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
						-- Not allowed
					else
						if Player.Functions.AddItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then 
							RemoveFromTrunk(plate, fromSlot, itemInfo["name"], fromAmount)	
							sendToDiscordVehicles(Config.WebhookTranslates["vehicles"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["vehicles"]["trunk_extract"] ..plate.. Config.WebhookTranslates["vehicles"]["item_remove"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)	
						else 
							UpdateInventory(src)
						end		
					end
				else
					-- Mueve items dentro del mismo trunk
					local toItemData = Trunks[plate].items[toSlot]
					RemoveFromTrunk(plate, fromSlot, itemInfo["name"], fromAmount)
					if toItemData ~= nil then
						local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
						local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
						if toItemData.name ~= fromItemData.name then
							local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
							RemoveFromTrunk(plate, toSlot, itemInfo["name"], toAmount)
							AddToTrunk(plate, fromSlot, toSlot, itemInfo["name"], toAmount, toItemData.info)
						end
					end
					local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
					AddToTrunk(plate, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info)
				end
			else
				TriggerClientEvent("qs-inventory:sendMessage", source, Lang("INVENTORY_INVALID"), 'error')
				TriggerClientEvent('qs-inventory:closeInventory', source)
				return
			end
		elseif QBCore.Shared.SplitStr(fromInventory, "-")[1] == "glovebox" then
			local plate = QBCore.Shared.SplitStr(fromInventory, "-")[2]
			local fromItemData = Gloveboxes[plate].items[fromSlot]
			local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
			if fromItemData ~= nil and fromItemData.amount >= fromAmount then
				local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
				if toInventory == "player" or toInventory == "hotbar" then
					local toItemData = Player.Functions.GetItemBySlot(toSlot)
					if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
						-- Not allowed
					else
						if Player.Functions.AddItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then
							RemoveFromGlovebox(plate, fromSlot, itemInfo["name"], fromAmount)
							sendToDiscordVehicles(Config.WebhookTranslates["vehicles"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["vehicles"]["glove_extract"] ..plate.. Config.WebhookTranslates["vehicles"]["item_remove"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
						else 
							UpdateInventory(src)
						end				
					end
				else
					-- Mueve items dentro del mismo glovebox
					local toItemData = Gloveboxes[plate].items[toSlot]
					RemoveFromGlovebox(plate, fromSlot, itemInfo["name"], fromAmount)
					if toItemData ~= nil then
						local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
						local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
						if toItemData.name ~= fromItemData.name then
							local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
							RemoveFromGlovebox(plate, toSlot, itemInfo["name"], toAmount)
							AddToGlovebox(plate, fromSlot, toSlot, itemInfo["name"], toAmount, toItemData.info)
						end
					end
					local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
					AddToGlovebox(plate, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info)
				end
			else
				TriggerClientEvent("qs-inventory:sendMessage", source, Lang("INVENTORY_INVALID"), 'error')
				TriggerClientEvent('qs-inventory:closeInventory', source)
				return
			end
		elseif QBCore.Shared.SplitStr(fromInventory, "-")[1] == "stash" then
			local stashId = QBCore.Shared.SplitStr(fromInventory, "-")[2]
			local fromItemData = Stashes[stashId].items[fromSlot]
			local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
			
			if fromItemData ~= nil and fromItemData.amount >= fromAmount then
				local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
				if toInventory == "player" or toInventory == "hotbar" then
					local toItemData = Player.Functions.GetItemBySlot(toSlot)
					if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
						-- Not allowed
					else
						if Player.Functions.AddItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then
                            RemoveFromStash(stashId, fromSlot, itemInfo["name"], fromAmount)
                            sendToDiscordStash(Config.WebhookTranslates["stash"]["title"], "**" .. GetPlayerName(source) .. Config.WebhookTranslates["stash"]["stash_extract"] ..stashId.. Config.WebhookTranslates["stash"]["item_remove"] ..itemInfo["name"].. " x " ..fromAmount, 7393279)
						else 
							UpdateInventory(src)
						end
					end
				else
					-- Mueve items dentro del mismo stash
					local toItemData = Stashes[stashId].items[toSlot]
					RemoveFromStash(stashId, fromSlot, itemInfo["name"], fromAmount)
					if toItemData ~= nil then
						local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
						local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
						if toItemData.name ~= fromItemData.name then
							local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
							RemoveFromStash(stashId, toSlot, itemInfo["name"], toAmount)
							AddToStash(stashId, fromSlot, toSlot, itemInfo["name"], toAmount, toItemData.info)
						end
					end
					local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
					AddToStash(stashId, toSlot, fromSlot, itemInfo["name"], fromAmount, fromItemData.info)
				end
			else
				TriggerClientEvent("qs-inventory:sendMessage", source, Lang("INVENTORY_INVALID"), 'error')
				TriggerClientEvent('qs-inventory:closeInventory', source)
				return
			end
		elseif QBCore.Shared.SplitStr(fromInventory, "-")[1] == "traphouse" then
			local traphouseId = QBCore.Shared.SplitStr(fromInventory, "-")[2]
			local fromItemData = exports[Config.QBTraphouseName]:GetInventoryData(traphouseId, fromSlot)
			fromAmount = tonumber(fromAmount) or fromItemData.amount
			if fromItemData and fromItemData.amount >= fromAmount then
				local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
				if toInventory == "player" or toInventory == "hotbar" then
					local toItemData = GetItemBySlot(src, toSlot)
					exports[Config.QBTraphouseName]:RemoveHouseItem(traphouseId, fromSlot, itemInfo["name"], fromAmount)
					if toItemData then
						itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
						toAmount = tonumber(toAmount) or toItemData.amount
						if toItemData.name ~= fromItemData.name then
							RemoveItem(src, toItemData.name, toAmount, toSlot)
							exports[Config.QBTraphouseName]:AddHouseItem(traphouseId, fromSlot, itemInfo["name"], toAmount, toItemData.info, src)
						end
					end
					AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info)
				else
					local toItemData = exports[Config.QBTraphouseName]:GetInventoryData(traphouseId, toSlot)
					exports[Config.QBTraphouseName]:RemoveHouseItem(traphouseId, fromSlot, itemInfo["name"], fromAmount)
					if toItemData then
						toAmount = tonumber(toAmount) or toItemData.amount
						if toItemData.name ~= fromItemData.name then
							itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
							exports[Config.QBTraphouseName]:RemoveHouseItem(traphouseId, toSlot, itemInfo["name"], toAmount)
							exports[Config.QBTraphouseName]:AddHouseItem(traphouseId, fromSlot, itemInfo["name"], toAmount, toItemData.info, src)
						end
					end
					itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
					exports[Config.QBTraphouseName]:AddHouseItem(traphouseId, toSlot, itemInfo["name"], fromAmount, fromItemData.info, src)
				end
			else
				TriggerClientEvent("qs-inventory:sendMessage", src, Lang("TRAPHOUSE_NO_ITEM"), 'error')
			end
		elseif QBCore.Shared.SplitStr(fromInventory, "_")[1] == "garbage" then
			local garbageType = QBCore.Shared.SplitStr(fromInventory, "_")[2]
			local fromItemData = GarbageItems[garbageType].items[fromSlot]
			if fromItemData then
				local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
				local toItemData = Player.Functions.GetItemBySlot(toSlot)
				if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
					-- Not allowed
				else
					if Player.Functions.AddItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then		
						RemoveFromGarbage(garbageType, fromSlot, fromItemData.name, fromAmount)
						sendToDiscordGarbage(Config.WebhookTranslates["garbage"]["title"], "**" .. GetPlayerName(source) .. Config.WebhookTranslates["garbage"]["pickup"] ..garbageType.. Config.WebhookTranslates["garbage"]["items"] ..itemInfo["label"].. " x " ..fromAmount, 7393279)
					end
				end
			else 
				UpdateInventory(src)
			end
		elseif QBCore.Shared.SplitStr(fromInventory, "-")[1] == "itemshop" then -- Market
			local refresh = false
			local shopType = QBCore.Shared.SplitStr(fromInventory, "-")[2]
			if shopType and QBCore.Shared.SplitStr(shopType, "_")[1] ~= "Customshop" then
				local itemData = ShopItems[shopType].items[fromSlot]
				local itemInfo = QBCore.Shared.Items[itemData.name:lower()]
				if itemInfo["type"] == "weapon" or itemInfo["unique"] == true then 
					if fromAmount and tonumber(fromAmount) > 1 then 
						fromAmount = 1
						refresh = true
					end
					if itemInfo["type"] == "weapon" then 
						itemData.info.serie = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
						refresh = true
					end
				end
				local price = tonumber((itemData.price*fromAmount))
				local payment = ShopItems[shopType].type or 'cash'
				if payment == 'money' then 
					payment = 'cash'
				end
				local cash = xPlayer.PlayerData.money[payment] 
				local toItemData = Player.Functions.GetItemBySlot(toSlot)
				if toItemData ~= nil and (toItemData.unique and itemData.unique or toItemData.name:lower() ~= itemData.name:lower()) then -- If items are different (swap)
					-- Not allowed
				else
					if payment == 'cash' then
						if cash >= price then
							if Player.Functions.AddItem(itemData.name, fromAmount, toSlot, itemData.info) then
								xPlayer.Functions.RemoveMoney('cash', price)
								if refresh then 
									TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
								end
								TriggerClientEvent('qs-shops:client:UpdateShop', src, QBCore.Shared.SplitStr(shopType, "_")[2], itemData, fromAmount)
								TriggerClientEvent("qs-inventory:sendMessage", src, Lang("INVENTORY_YOU_BUY")..itemInfo.label, 'success')
								sendToDiscordShops(Config.WebhookTranslates["shop"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["shop"]["buy"] ..itemInfo["label"].. " x " ..fromAmount.. Config.WebhookTranslates["shop"]["cost"] ..price, 7393279)
								--TriggerEvent('qs-inventory:sendWebhook', src, GetPlayerName(src)..Lang("LOGS_INFO_STORES")..itemInfo["label"]..Lang("LOGS_MONEY_STORES")..price..Lang("LOGS_GENERAL_INFO_2")..exports['qs-inventory']:GetProperty(src, "of the person"), Lang("LOGS_TITLE_STORES"), 7393279)
							else 
								UpdateInventory(src)
							end
						else
							TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
							TriggerClientEvent("qs-inventory:sendMessage", src, Lang("NO_MONEY"), 'error')
						end
					else
						if cash >= price then
							if Player.Functions.AddItem(itemData.name, fromAmount, toSlot, itemData.info) then
								xPlayer.Functions.RemoveMoney('bank', price)
								if refresh then 
									TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
								end
								TriggerClientEvent('qs-shops:client:UpdateShop', src, QBCore.Shared.SplitStr(shopType, "_")[2], itemData, fromAmount)
								TriggerClientEvent("qs-inventory:sendMessage", src, Lang("INVENTORY_YOU_BUY")..itemInfo.label, 'success')
								sendToDiscordShops(Config.WebhookTranslates["shop"]["title"], "**" .. GetPlayerName(src) .. Config.WebhookTranslates["shop"]["buy"] ..itemInfo["label"].. " x " ..fromAmount.. Config.WebhookTranslates["shop"]["cost"] ..price, 7393279)
								--TriggerEvent('qs-inventory:sendWebhook', src, GetPlayerName(src)..Lang("LOGS_INFO_STORES")..itemInfo["label"]..Lang("LOGS_MONEY_STORES")..price..Lang("LOGS_GENERAL_INFO_2")..exports['qs-inventory']:GetProperty(src, "of the person"), Lang("LOGS_TITLE_STORES"), 7393279)
							else 
								UpdateInventory(src)
							end
						else
							TriggerClientEvent('inventory:client:UpdatePlayerInventory', src)
							TriggerClientEvent("qs-inventory:sendMessage", src, Lang("NO_MONEY"), 'error')
						end
					end
				end
			else 
				return
			end
		elseif fromInventory == "crafting" then
			local itemData = (exports['qs-crafting']:GetFItems())[fromSlot]
			if hasCraftItems(src, itemData.costs, fromAmount) then
				TriggerClientEvent("inventory:client:CraftItems", src, itemData.name, itemData.costs, fromAmount, toSlot, itemData.points, itemData.time)
			else
				TriggerClientEvent("inventory:client:UpdatePlayerInventory", src, true)
				TriggerClientEvent("qs-inventory:sendMessage", src, Lang("CRAFTING_ERROR"), 'error')
			end
		elseif fromInventory == "customcrafting" then
			local itemData = (CustomCraftingInfos)[fromSlot]
			if hasCraftItems(src, itemData.costs, fromAmount) then
				print(itemData.name)
				TriggerClientEvent("inventory:client:CraftItems", src, itemData.name, itemData.costs, fromAmount, toSlot, itemData.points)
			else
				TriggerClientEvent("inventory:client:UpdatePlayerInventory", src, true)
				TriggerClientEvent("qs-inventory:sendMessage", src, Lang("CRAFTING_ERROR"), 'error')
			end
		else
			-- drop
			TriggerClientEvent('inventory:ClearWeapons', src)
			fromInventory = tonumber(fromInventory)
			local fromItemData = Drops[fromInventory].items[fromSlot]
			local fromAmount = tonumber(fromAmount) ~= nil and tonumber(fromAmount) or fromItemData.amount
			local xPlayer = QBCore.Functions.GetPlayer(source)
			if fromItemData ~= nil and fromItemData.amount >= fromAmount then
				local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
				if toInventory == "player" or toInventory == "hotbar" then
					local toItemData = Player.Functions.GetItemBySlot(toSlot)
					if toItemData ~= nil and (toItemData.unique and fromItemData.unique or toItemData.name:lower() ~= fromItemData.name:lower()) then -- If items are different (swap)
						-- Not allowed
					else
						if Player.Functions.AddItem(fromItemData.name, fromAmount, toSlot, fromItemData.info) then
							RemoveFromDrop(fromInventory, fromSlot, itemInfo["name"], fromAmount)
							if toItemData ~= nil then
								local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
								if toItemData.name ~= fromItemData.name then
									if fromItemData.name == toItemData.name then
										Player.Functions.RemoveItem(toItemData.name, toAmount, toSlot)
										AddToDrop(fromInventory, toSlot, toItemData.name, toAmount, toItemData.info)
									end
								end							
							else
								sendToDiscordDrop(Config.WebhookTranslates["drop"]["title"], "**" .. GetPlayerName(source) .. Config.WebhookTranslates["drop"]["pickup"] ..fromItemData.name.. " x " ..fromAmount, 7393279)
							end
						end
					end
				else
					-- Movimientos dentro del mismo inventario
					toInventory = tonumber(toInventory)
					local toItemData = Drops[toInventory].items[toSlot]
					RemoveFromDrop(fromInventory, fromSlot, itemInfo["name"], fromAmount)
					--Player.PlayerData.items[toSlot] = fromItemData
					if toItemData ~= nil then
						local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
						--Player.PlayerData.items[fromSlot] = toItemData
						local toAmount = tonumber(toAmount) ~= nil and tonumber(toAmount) or toItemData.amount
						if toItemData.name ~= fromItemData.name then
							local itemInfo = QBCore.Shared.Items[toItemData.name:lower()]
							RemoveFromDrop(toInventory, toSlot, itemInfo["name"], toAmount)
							AddToDrop(fromInventory, fromSlot, itemInfo["name"], toAmount, toItemData.info)
						end
					end
					local itemInfo = QBCore.Shared.Items[fromItemData.name:lower()]
					AddToDrop(toInventory, toSlot, itemInfo["name"], fromAmount, fromItemData.info)
				end
			end
		end
		TriggerClientEvent("inventory:client:UpdatePlayerInventory", src, true)
	end
end)
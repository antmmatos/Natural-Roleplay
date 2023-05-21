if Config.Framework == 'QBCore' and Config.QBCoreLastFunctions then
    QBCore = exports['qb-core']:GetCoreObject()
    UsableItems = {}
    
    ---Loads the inventory for the player with the citizenid that is provided
    function LoadInventory(source, citizenid)
        local inventory = MySQL.prepare.await('SELECT inventory FROM '..QSInventory.users..' WHERE '..QSInventory.identifier..' = ?', { citizenid })
        local loadedInventory = {}
        local missingItems = {}
    
        if not inventory then return loadedInventory end
    
        inventory = json.decode(inventory)
        if table.type(inventory) == "empty" then return loadedInventory end
    
        for _, item in pairs(inventory) do
            if item then
                local itemInfo = QBCore.Shared.Items[item.name:lower()]
                if itemInfo then
                    loadedInventory[item.slot] = {
                        name = itemInfo['name'],
                        amount = item.amount,
                        info = item.info or '',
                        label = itemInfo['label'],
                        description = itemInfo['description'] or '',
                        weight = itemInfo['weight'],
                        type = itemInfo['type'],
                        unique = itemInfo['unique'],
                        useable = itemInfo['useable'],
                        image = itemInfo['image'],
                        shouldClose = itemInfo['shouldClose'],
                        slot = item.slot,
                        combinable = itemInfo['combinable']
                    }
                else
                    missingItems[#missingItems + 1] = item.name:lower()
                end
            end
        end
    
        if #missingItems > 0 then
            DebugPrint("The following items were removed for player %s as they no longer exis")
            QBCore.Debug(missingItems)
        end
    
        return loadedInventory
    end
    
    exports("LoadInventory", LoadInventory)
    
    ---Saves the inventory for the player with the provided source or PlayerData is they're offline
    function SaveInventory(source, offline)
        local PlayerData
        if not offline then
            local Player = QBCore.Functions.GetPlayer(source)
    
            if not Player then return end
    
            PlayerData = Player.PlayerData
        else
            PlayerData = source -- for offline users, the playerdata gets sent over the source variable
        end
    
        local items = PlayerData.items
        local ItemsJson = {}
        if items and table.type(items) ~= "empty" then
            for slot, item in pairs(items) do
                if items[slot] then
                    ItemsJson[#ItemsJson+1] = {
                        name = item.name,
                        amount = item.amount,
                        info = item.info,
                        type = item.type,
                        slot = slot,
                    }
                end
            end
            MySQL.prepare('UPDATE '..QSInventory.users..' SET inventory = ? WHERE '..QSInventory.identifier..' = ?', { json.encode(ItemsJson), PlayerData.citizenid })
        else
            MySQL.prepare('UPDATE '..QSInventory.users..' SET inventory = ? WHERE '..QSInventory.identifier..' = ?', { '[]', PlayerData.citizenid })
        end
    end
    
    exports("SaveInventory", SaveInventory)
    
    ---Gets the totalweight of the items provided
    function GetTotalWeight(items)
        local weight = 0
        if not items then return 0 end
        for _, item in pairs(items) do
            weight += item.weight * item.amount
        end
        return tonumber(weight)
    end
    
    exports("GetTotalWeight", GetTotalWeight)
    
    ---Gets the slots that the provided item is in
    function GetSlotsByItem(items, itemName)
        local slotsFound = {}
        if not items then return slotsFound end
        for slot, item in pairs(items) do
            if item.name:lower() == itemName:lower() then
                slotsFound[#slotsFound+1] = slot
            end
        end
        return slotsFound
    end
    
    exports("GetSlotsByItem", GetSlotsByItem)
    
    ---Get the first slot where the item is located
     function GetFirstSlotByItem(items, itemName)
        if not items then return nil end
        for slot, item in pairs(items) do
            if item.name:lower() == itemName:lower() then
                return tonumber(slot)
            end
        end
        return nil
    end
    
    exports("GetFirstSlotByItem", GetFirstSlotByItem)
    
    ---Add an item to the inventory of the player
    function AddItem(source, item, amount, slot, info)
        local Player = QBCore.Functions.GetPlayer(source)
    
        if not Player then return false end
    
        local totalWeight = GetTotalWeight(Player.PlayerData.items)
        local itemInfo = QBCore.Shared.Items[item:lower()]
        if not itemInfo and not Player.Offline then
            QBCore.Functions.Notify(source, "Item does not exist", 'error')
            return false
        end
    
        amount = tonumber(amount) or 1
        slot = tonumber(slot) or GetFirstSlotByItem(Player.PlayerData.items, item)
        info = info or {}
    
        if itemInfo['type'] == 'weapon' then
            info.serie = info.serie or tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
            info.quality = info.quality or 100
        end
        if (totalWeight + (itemInfo['weight'] * amount)) <= Config.MaxWeight then
            if (slot and Player.PlayerData.items[slot]) and (Player.PlayerData.items[slot].name:lower() == item:lower()) and (itemInfo['type'] == 'item' and not itemInfo['unique']) then
                Player.PlayerData.items[slot].amount = Player.PlayerData.items[slot].amount + amount
                Player.Functions.SetPlayerData("items", Player.PlayerData.items)
    
                if Player.Offline then return true end
    
                TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'AddItem', 'green', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** got item: [slot:' .. slot .. '], itemname: ' .. Player.PlayerData.items[slot].name .. ', added amount: ' .. amount .. ', new total amount: ' .. Player.PlayerData.items[slot].amount)
    
                return true
            elseif not itemInfo['unique'] and slot or slot and Player.PlayerData.items[slot] == nil then
                Player.PlayerData.items[slot] = { name = itemInfo['name'], amount = amount, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = slot, combinable = itemInfo['combinable'] }
                Player.Functions.SetPlayerData("items", Player.PlayerData.items)
    
                if Player.Offline then return true end
    
                TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'AddItem', 'green', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** got item: [slot:' .. slot .. '], itemname: ' .. Player.PlayerData.items[slot].name .. ', added amount: ' .. amount .. ', new total amount: ' .. Player.PlayerData.items[slot].amount)
    
                return true
            elseif itemInfo['unique'] or (not slot or slot == nil) or itemInfo['type'] == 'weapon' then
                for i = 1, Config.MaxInventorySlots, 1 do
                    if Player.PlayerData.items[i] == nil then
                        Player.PlayerData.items[i] = { name = itemInfo['name'], amount = amount, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = i, combinable = itemInfo['combinable'] }
                        Player.Functions.SetPlayerData("items", Player.PlayerData.items)
    
                        if Player.Offline then return true end
    
                        TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'AddItem', 'green', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** got item: [slot:' .. i .. '], itemname: ' .. Player.PlayerData.items[i].name .. ', added amount: ' .. amount .. ', new total amount: ' .. Player.PlayerData.items[i].amount)
    
                        return true
                    end
                end
            end
        elseif not Player.Offline then
            QBCore.Functions.Notify(source, "Inventory too full", 'error')
        end
        return false
    end
    
    exports("AddItem", AddItem)
    
    ---Remove an item from the inventory of the player
    function RemoveItem(source, item, amount, slot)
        local Player = QBCore.Functions.GetPlayer(source)
    
        if not Player then return false end
    
        amount = tonumber(amount) or 1
        slot = tonumber(slot)
    
        if slot then
            if Player.PlayerData.items[slot].amount > amount then
                Player.PlayerData.items[slot].amount = Player.PlayerData.items[slot].amount - amount
                Player.Functions.SetPlayerData("items", Player.PlayerData.items)
    
                if not Player.Offline then
                    TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'RemoveItem', 'red', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** lost item: [slot:' .. slot .. '], itemname: ' .. Player.PlayerData.items[slot].name .. ', removed amount: ' .. amount .. ', new total amount: ' .. Player.PlayerData.items[slot].amount)
                end
    
                return true
            elseif Player.PlayerData.items[slot].amount == amount then
                Player.PlayerData.items[slot] = nil
                Player.Functions.SetPlayerData("items", Player.PlayerData.items)
    
                if Player.Offline then return true end
    
                TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'RemoveItem', 'red', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** lost item: [slot:' .. slot .. '], itemname: ' .. item .. ', removed amount: ' .. amount .. ', item removed')
    
                return true
            end
        else
            local slots = GetSlotsByItem(Player.PlayerData.items, item)
            local amountToRemove = amount
    
            if not slots then return false end
    
            for _, _slot in pairs(slots) do
                if Player.PlayerData.items[_slot].amount > amountToRemove then
                    Player.PlayerData.items[_slot].amount = Player.PlayerData.items[_slot].amount - amountToRemove
                    Player.Functions.SetPlayerData("items", Player.PlayerData.items)
    
                    if not Player.Offline then
                        TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'RemoveItem', 'red', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** lost item: [slot:' .. _slot .. '], itemname: ' .. Player.PlayerData.items[_slot].name .. ', removed amount: ' .. amount .. ', new total amount: ' .. Player.PlayerData.items[_slot].amount)
                    end
    
                    return true
                elseif Player.PlayerData.items[_slot].amount == amountToRemove then
                    Player.PlayerData.items[_slot] = nil
                    Player.Functions.SetPlayerData("items", Player.PlayerData.items)
    
                    if Player.Offline then return true end
    
                    TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'RemoveItem', 'red', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** lost item: [slot:' .. _slot .. '], itemname: ' .. item .. ', removed amount: ' .. amount .. ', item removed')
    
                    return true
                end
            end
        end
        return false
    end
    
    exports("RemoveItem", RemoveItem)
    
    ---Get the item with the slot
    function GetItemBySlot(source, slot)
        local Player = QBCore.Functions.GetPlayer(source)
        slot = tonumber(slot)
        return Player.PlayerData.items[slot]
    end
    
    exports("GetItemBySlot", GetItemBySlot)
    
    ---Get the item from the inventory of the player with the provided source by the name of the item
    function GetItemByName(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        item = tostring(item):lower()
        local slot = GetFirstSlotByItem(Player.PlayerData.items, item)
        return Player.PlayerData.items[slot]
    end
    
    exports("GetItemByName", GetItemByName)
    
    ---Get the item from the inventory of the player with the provided source by the name of the item in an array for all slots that the item is in
    function GetItemsByName(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        item = tostring(item):lower()
        local items = {}
        local slots = GetSlotsByItem(Player.PlayerData.items, item)
        for _, slot in pairs(slots) do
            if slot then
                items[#items+1] = Player.PlayerData.items[slot]
            end
        end
        return items
    end
    
    exports("GetItemsByName", GetItemsByName)
    
    ---Clear the inventory of the player with the provided source and filter any items out of the clearing of the inventory to keep (optional)
    function ClearInventory(source, filterItems)
        local Player = QBCore.Functions.GetPlayer(source)
        local savedItemData = {}
    
        if filterItems then
            local filterItemsType = type(filterItems)
            if filterItemsType == "string" then
                local item = GetItemByName(source, filterItems)
    
                if item then
                    savedItemData[item.slot] = item
                end
            elseif filterItemsType == "table" and table.type(filterItems) == "array" then
                for i = 1, #filterItems do
                    local item = GetItemByName(source, filterItems[i])
    
                    if item then
                        savedItemData[item.slot] = item
                    end
                end
            end
        end
    
        Player.Functions.SetPlayerData("items", savedItemData)
    
        if Player.Offline then return end
    
        TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'ClearInventory', 'red', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** inventory cleared')
    end
    
    exports("ClearInventory", ClearInventory)
    
    ---Sets the items playerdata to the provided items param
    function SetInventory(source, items)
        local Player = QBCore.Functions.GetPlayer(source)
    
        Player.Functions.SetPlayerData("items", items)
    
        if Player.Offline then return end
    
        TriggerEvent('qb-log:server:CreateLog', 'playerinventory', 'SetInventory', 'blue', '**' .. GetPlayerName(source) .. ' (citizenid: ' .. Player.PlayerData.citizenid .. ' | id: ' .. source .. ')** items set: ' .. json.encode(items))
    end
    
    exports("SetInventory", SetInventory)
    
    ---Set the data of a specific item
    function SetItemData(source, itemName, key, val)
        if not itemName or not key then return false end
    
        local Player = QBCore.Functions.GetPlayer(source)
    
        if not Player then return end
    
        local item = GetItemByName(source, itemName)
    
        if not item then return false end
    
        item[key] = val
        Player.PlayerData.items[item.slot] = item
        Player.Functions.SetPlayerData("items", Player.PlayerData.items)
    
        return true
    end
    
    exports("SetItemData", SetItemData)
    
    ---Checks if you have an item or not
    function HasItem(source, items, amount)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player then return false end
        local isTable = type(items) == 'table'
        local isArray = isTable and table.type(items) == 'array' or false
        local totalItems = #items
        local count = 0
        local kvIndex = 2
        if isTable and not isArray then
            totalItems = 0
            for _ in pairs(items) do totalItems += 1 end
            kvIndex = 1
        end
        if isTable then
            for k, v in pairs(items) do
                local itemKV = {k, v}
                local item = GetItemByName(source, itemKV[kvIndex])
                if item and ((amount and item.amount >= amount) or (not isArray and item.amount >= v) or (not amount and isArray)) then
                    count += 1
                end
            end
            if count == totalItems then
                return true
            end
        else -- Single item as string
            local item = GetItemByName(source, items)
            if item and (not amount or (item and amount and item.amount >= amount)) then
                return true
            end
        end
        return false
    end
    
    exports("HasItem", HasItem)
    
    ---Create a usable item with a callback on use
    function CreateUsableItem(itemName, data)
        QBCore.Functions.CreateUseableItem(itemName, data)
    end
    
    exports("CreateUsableItem", CreateUsableItem)
    
    ---Get the usable item data for the specified item
    function GetUsableItem(itemName)
        return QBCore.Functions.CanUseItem(itemName)
    end
    
    exports("GetUsableItem", GetUsableItem)
    
    ---Use an item from the QBCore.UsableItems table if a callback is present
    function UseItem(itemName, ...)
        local itemData = GetUsableItem(itemName)
        local callback = type(itemData) == 'table' and (rawget(itemData, '__cfx_functionReference') and itemData or itemData.cb or itemData.callback) or type(itemData) == 'function' and itemData
        if not callback then return end
        callback(...)
    end
    
    exports("UseItem", UseItem)
    
    ---Check if a recipe contains the item
    function recipeContains(recipe, fromItem)
        for _, v in pairs(recipe.accept) do
            if v == fromItem.name then
                return true
            end
        end
    
        return false
    end
    
    ---Checks if the provided source has the items to craft
    function hasCraftItems(source, CostItems, amount)
        for k, v in pairs(CostItems) do
            local item = GetItemByName(source, k)
    
            if not item then return false end
    
            if item.amount < (v * amount) then return false end
        end
        return true
    end
    
    ---Checks if the vehicle with the provided plate is owned by any player
    function IsVehicleOwned(plate)
        local result = MySQL.scalar.await('SELECT 1 from player_vehicles WHERE plate = ?', {plate})
        return result
    end
    
    ---Setup the shop items
    function SetupShopItems(shopItems)
        local items = {}
        if shopItems and next(shopItems) then
            for _, item in pairs(shopItems) do
                local itemInfo = QBCore.Shared.Items[item.name:lower()]
                if itemInfo then
                    items[item.slot] = {
                        name = itemInfo["name"],
                        amount = tonumber(item.amount),
                        info = item.info or "",
                        label = itemInfo["label"],
                        description = itemInfo["description"] or "",
                        weight = itemInfo["weight"],
                        type = itemInfo["type"],
                        unique = itemInfo["unique"],
                        useable = itemInfo["useable"],
                        price = item.price,
                        image = itemInfo["image"],
                        slot = item.slot,
                    }
                end
            end
        end
        return items
    end
    
    ---Get items in a stash
    function GetStashItems(stashId)
        local items = {}
        local result = MySQL.scalar.await('SELECT items FROM stashitems WHERE stash = ?', {stashId})
        if not result then return items end
    
        local stashItems = json.decode(result)
        if not stashItems then return items end
    
        for _, item in pairs(stashItems) do
            local itemInfo = QBCore.Shared.Items[item.name:lower()]
            if itemInfo then
                items[item.slot] = {
                    name = itemInfo["name"],
                    amount = tonumber(item.amount),
                    info = item.info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = item.slot,
                }
            end
        end
        return items
    end
    
    ---Save the items in a stash
    function SaveStashItems(stashId, items)
        if Stashes[stashId].label == "Stash-None" or not items then return end
    
        for _, item in pairs(items) do
            item.description = nil
        end
    
        MySQL.insert('INSERT INTO stashitems (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', {
            ['stash'] = stashId,
            ['items'] = json.encode(items)
        })
    
        Stashes[stashId].isOpen = false
    end
    
    ---Add items to a stash
    function AddToStash(stashId, slot, otherslot, itemName, amount, info)
        amount = tonumber(amount) or 1
        local ItemData = QBCore.Shared.Items[itemName]
        if not ItemData.unique then
            if Stashes[stashId].items[slot] and Stashes[stashId].items[slot].name == itemName then
                Stashes[stashId].items[slot].amount = Stashes[stashId].items[slot].amount + amount
            else
                local itemInfo = QBCore.Shared.Items[itemName:lower()]
                Stashes[stashId].items[slot] = {
                    name = itemInfo["name"],
                    amount = amount,
                    info = info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = slot,
                }
            end
        else
            if Stashes[stashId].items[slot] and Stashes[stashId].items[slot].name == itemName then
                local itemInfo = QBCore.Shared.Items[itemName:lower()]
                Stashes[stashId].items[otherslot] = {
                    name = itemInfo["name"],
                    amount = amount,
                    info = info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = otherslot,
                }
            else
                local itemInfo = QBCore.Shared.Items[itemName:lower()]
                Stashes[stashId].items[slot] = {
                    name = itemInfo["name"],
                    amount = amount,
                    info = info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = slot,
                }
            end
        end
    end
    
    ---Remove the item from the stash
    function RemoveFromStash(stashId, slot, itemName, amount)
        amount = tonumber(amount) or 1
        if Stashes[stashId].items[slot] and Stashes[stashId].items[slot].name == itemName then
            if Stashes[stashId].items[slot].amount > amount then
                Stashes[stashId].items[slot].amount = Stashes[stashId].items[slot].amount - amount
            else
                Stashes[stashId].items[slot] = nil
            end
        else
            Stashes[stashId].items[slot] = nil
            if Stashes[stashId].items == nil then
                Stashes[stashId].items[slot] = nil
            end
        end
    end
    
    ---Get the items in the trunk of a vehicle
    function GetOwnedVehicleItems(plate)
        local items = {}
        local result = MySQL.scalar.await('SELECT items FROM trunkitems WHERE plate = ?', {plate})
        if not result then return items end
    
        local trunkItems = json.decode(result)
        if not trunkItems then return items end
    
        for _, item in pairs(trunkItems) do
            local itemInfo = QBCore.Shared.Items[item.name:lower()]
            if itemInfo then
                items[item.slot] = {
                    name = itemInfo["name"],
                    amount = tonumber(item.amount),
                    info = item.info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = item.slot,
                }
            end
        end
        return items
    end
    
    ---Save the items in a trunk
    function SaveOwnedVehicleItems(plate, items)
        if Trunks[plate].label == "Trunk-None" or not items then return end
    
        for _, item in pairs(items) do
            item.description = nil
        end
    
        MySQL.insert('INSERT INTO trunkitems (plate, items) VALUES (:plate, :items) ON DUPLICATE KEY UPDATE items = :items', {
            ['plate'] = plate,
            ['items'] = json.encode(items)
        })
    
        Trunks[plate].isOpen = false
    end
    
    ---Add items to a trunk
    function AddToTrunk(plate, slot, otherslot, itemName, amount, info)
        amount = tonumber(amount) or 1
        local ItemData = QBCore.Shared.Items[itemName]
    
        if not ItemData.unique then
            if Trunks[plate].items[slot] and Trunks[plate].items[slot].name == itemName then
                Trunks[plate].items[slot].amount = Trunks[plate].items[slot].amount + amount
            else
                local itemInfo = QBCore.Shared.Items[itemName:lower()]
                Trunks[plate].items[slot] = {
                    name = itemInfo["name"],
                    amount = amount,
                    info = info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = slot,
                }
            end
        else
            if Trunks[plate].items[slot] and Trunks[plate].items[slot].name == itemName then
                local itemInfo = QBCore.Shared.Items[itemName:lower()]
                Trunks[plate].items[otherslot] = {
                    name = itemInfo["name"],
                    amount = amount,
                    info = info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = otherslot,
                }
            else
                local itemInfo = QBCore.Shared.Items[itemName:lower()]
                Trunks[plate].items[slot] = {
                    name = itemInfo["name"],
                    amount = amount,
                    info = info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = slot,
                }
            end
        end
    end
    
    ---Remove the item from the trunk
    function RemoveFromTrunk(plate, slot, itemName, amount)
        amount = tonumber(amount) or 1
        if Trunks[plate].items[slot] and Trunks[plate].items[slot].name == itemName then
            if Trunks[plate].items[slot].amount > amount then
                Trunks[plate].items[slot].amount = Trunks[plate].items[slot].amount - amount
            else
                Trunks[plate].items[slot] = nil
            end
        else
            Trunks[plate].items[slot] = nil
            if Trunks[plate].items == nil then
                Trunks[plate].items[slot] = nil
            end
        end
    end
    
    ---Get the items in the glovebox of a vehicle
    function GetOwnedVehicleGloveboxItems(plate)
        local items = {}
        local result = MySQL.scalar.await('SELECT items FROM gloveboxitems WHERE plate = ?', {plate})
        if not result then return items end
    
        local gloveboxItems = json.decode(result)
        if not gloveboxItems then return items end
    
        for _, item in pairs(gloveboxItems) do
            local itemInfo = QBCore.Shared.Items[item.name:lower()]
            if itemInfo then
                items[item.slot] = {
                    name = itemInfo["name"],
                    amount = tonumber(item.amount),
                    info = item.info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = item.slot,
                }
            end
        end
        return items
    end
    
    ---Save the items in a glovebox
    function SaveOwnedGloveboxItems(plate, items)
        if Gloveboxes[plate].label == "Glovebox-None" or not items then return end
    
        for _, item in pairs(items) do
            item.description = nil
        end
    
        MySQL.insert('INSERT INTO gloveboxitems (plate, items) VALUES (:plate, :items) ON DUPLICATE KEY UPDATE items = :items', {
            ['plate'] = plate,
            ['items'] = json.encode(items)
        })
    
        Gloveboxes[plate].isOpen = false
    end
    
    ---Add items to a glovebox
    function AddToGlovebox(plate, slot, otherslot, itemName, amount, info)
        amount = tonumber(amount) or 1
        local ItemData = QBCore.Shared.Items[itemName]
    
        if not ItemData.unique then
            if Gloveboxes[plate].items[slot] and Gloveboxes[plate].items[slot].name == itemName then
                Gloveboxes[plate].items[slot].amount = Gloveboxes[plate].items[slot].amount + amount
            else
                local itemInfo = QBCore.Shared.Items[itemName:lower()]
                Gloveboxes[plate].items[slot] = {
                    name = itemInfo["name"],
                    amount = amount,
                    info = info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = slot,
                }
            end
        else
            if Gloveboxes[plate].items[slot] and Gloveboxes[plate].items[slot].name == itemName then
                local itemInfo = QBCore.Shared.Items[itemName:lower()]
                Gloveboxes[plate].items[otherslot] = {
                    name = itemInfo["name"],
                    amount = amount,
                    info = info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = otherslot,
                }
            else
                local itemInfo = QBCore.Shared.Items[itemName:lower()]
                Gloveboxes[plate].items[slot] = {
                    name = itemInfo["name"],
                    amount = amount,
                    info = info or "",
                    label = itemInfo["label"],
                    description = itemInfo["description"] or "",
                    weight = itemInfo["weight"],
                    type = itemInfo["type"],
                    unique = itemInfo["unique"],
                    useable = itemInfo["useable"],
                    image = itemInfo["image"],
                    slot = slot,
                }
            end
        end
    end
    
    ---Remove the item from the glovebox
    function RemoveFromGlovebox(plate, slot, itemName, amount)
        amount = tonumber(amount) or 1
        if Gloveboxes[plate].items[slot] and Gloveboxes[plate].items[slot].name == itemName then
            if Gloveboxes[plate].items[slot].amount > amount then
                Gloveboxes[plate].items[slot].amount = Gloveboxes[plate].items[slot].amount - amount
            else
                Gloveboxes[plate].items[slot] = nil
            end
        else
            Gloveboxes[plate].items[slot] = nil
            if Gloveboxes[plate].items == nil then
                Gloveboxes[plate].items[slot] = nil
            end
        end
    end
    
    ---Add an item to a drop
    function AddToDrop(dropId, slot, itemName, amount, info)
        amount = tonumber(amount) or 1
        Drops[dropId].createdTime = os.time()
        if Drops[dropId].items[slot] and Drops[dropId].items[slot].name == itemName then
            Drops[dropId].items[slot].amount = Drops[dropId].items[slot].amount + amount
        else
            local itemInfo = QBCore.Shared.Items[itemName:lower()]
            Drops[dropId].items[slot] = {
                name = itemInfo["name"],
                amount = amount,
                info = info or "",
                label = itemInfo["label"],
                description = itemInfo["description"] or "",
                weight = itemInfo["weight"],
                type = itemInfo["type"],
                unique = itemInfo["unique"],
                useable = itemInfo["useable"],
                image = itemInfo["image"],
                slot = slot,
                id = dropId,
            }
        end
    end
    
    ---Remove an item from a drop
    function RemoveFromDrop(dropId, slot, itemName, amount)
        amount = tonumber(amount) or 1
        Drops[dropId].createdTime = os.time()
        if Drops[dropId].items[slot] and Drops[dropId].items[slot].name == itemName then
            if Drops[dropId].items[slot].amount > amount then
                Drops[dropId].items[slot].amount = Drops[dropId].items[slot].amount - amount
            else
                Drops[dropId].items[slot] = nil
            end
        else
            Drops[dropId].items[slot] = nil
            if Drops[dropId].items == nil then
                Drops[dropId].items[slot] = nil
            end
        end
    end
    
    ---Creates a new id for a drop
    ---@return integer
    function CreateDropId()
        if Drops then
            local id = math.random(10000, 99999)
            local dropid = id
            while Drops[dropid] do
                id = math.random(10000, 99999)
                dropid = id
            end
            return dropid
        else
            local id = math.random(10000, 99999)
            local dropid = id
            return dropid
        end
    end
    
    ---Creates a new drop
    function CreateNewDrop(source, fromSlot, toSlot, itemAmount)
        itemAmount = tonumber(itemAmount) or 1
        local Player = QBCore.Functions.GetPlayer(source)
        local itemData = GetItemBySlot(source, fromSlot)
    
        if not itemData then return end
    
        local coords = GetEntityCoords(GetPlayerPed(source))
        if RemoveItem(source, itemData.name, itemAmount, itemData.slot) then
            TriggerClientEvent("inventory:client:CheckWeapon", source, itemData.name)
            local itemInfo = QBCore.Shared.Items[itemData.name:lower()]
            local dropId = CreateDropId()
            Drops[dropId] = {}
            Drops[dropId].coords = coords
            Drops[dropId].createdTime = os.time()
            Drops[dropId].items = {}
    
            Drops[dropId].items[toSlot] = {
                name = itemInfo["name"],
                amount = itemAmount,
                info = itemData.info or "",
                label = itemInfo["label"],
                description = itemInfo["description"] or "",
                weight = itemInfo["weight"],
                type = itemInfo["type"],
                unique = itemInfo["unique"],
                useable = itemInfo["useable"],
                image = itemInfo["image"],
                slot = toSlot,
                id = dropId,
            }
            TriggerEvent("qb-log:server:CreateLog", "drop", "New Item Drop", "red", "**".. GetPlayerName(source) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..source.."*) dropped new item; name: **"..itemData.name.."**, amount: **" .. itemAmount .. "**")
            TriggerClientEvent("inventory:client:DropItemAnim", source)
            TriggerClientEvent("inventory:client:AddDropItem", -1, dropId, source, coords)
            if itemData.name:lower() == "radio" then
                TriggerClientEvent('Radio.Set', source, false)
            end
        else
            QBCore.Functions.Notify(source, Lang:t("notify.missitem"), "error")
        end
    end
    
    AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
        QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, "AddItem", function(item, amount, slot, info)
            return AddItem(Player.PlayerData.source, item, amount, slot, info)
        end)
    
        QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, "RemoveItem", function(item, amount, slot)
            return RemoveItem(Player.PlayerData.source, item, amount, slot)
        end)
    
        QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, "GetItemBySlot", function(slot)
            return GetItemBySlot(Player.PlayerData.source, slot)
        end)
    
        QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, "GetItemByName", function(item)
            return GetItemByName(Player.PlayerData.source, item)
        end)
    
        QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, "GetItemsByName", function(item)
            return GetItemsByName(Player.PlayerData.source, item)
        end)
    
        QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, "ClearInventory", function(filterItems)
            ClearInventory(Player.PlayerData.source, filterItems)
        end)
    
        QBCore.Functions.AddPlayerMethod(Player.PlayerData.source, "SetInventory", function(items)
            SetInventory(Player.PlayerData.source, items)
        end)
    end)
    
    AddEventHandler('onResourceStart', function(resourceName)
        if resourceName ~= GetCurrentResourceName() then return end
        local Players = QBCore.Functions.GetQBPlayers()
        for k in pairs(Players) do
            QBCore.Functions.AddPlayerMethod(k, "AddItem", function(item, amount, slot, info)
                return AddItem(k, item, amount, slot, info)
            end)
    
            QBCore.Functions.AddPlayerMethod(k, "RemoveItem", function(item, amount, slot)
                return RemoveItem(k, item, amount, slot)
            end)
    
            QBCore.Functions.AddPlayerMethod(k, "GetItemBySlot", function(slot)
                return GetItemBySlot(k, slot)
            end)
    
            QBCore.Functions.AddPlayerMethod(k, "GetItemByName", function(item)
                return GetItemByName(k, item)
            end)
    
            QBCore.Functions.AddPlayerMethod(k, "GetItemsByName", function(item)
                return GetItemsByName(k, item)
            end)
    
            QBCore.Functions.AddPlayerMethod(k, "ClearInventory", function(filterItems)
                ClearInventory(k, filterItems)
            end)
    
            QBCore.Functions.AddPlayerMethod(k, "SetInventory", function(items)
                SetInventory(k, items)
            end)
        end
    end)
    
    RegisterNetEvent('QBCore:Server:UpdateObject', function()
        if source ~= '' then return end -- Safety check if the event was not called from the server.
        QBCore = exports['qb-core']:GetCoreObject()
    end)

    QBCore.Functions.CreateCallback('qb-inventory:server:GetStashItems', function(_, cb, stashId)
        cb(GetStashItems(stashId))
    end)

    QBCore.Functions.CreateCallback('inventory:server:GetCurrentDrops', function(_, cb)
        cb(Drops)
    end)
end
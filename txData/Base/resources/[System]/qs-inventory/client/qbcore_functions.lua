if Config.Framework == 'QBCore' and Config.QBCoreLastFunctions then
    ---Checks if you have an item or not
    function HasItem(items, amount)
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
        if not PlayerData.items then
            local test = QBCore.Functions.GetPlayerData()
            PlayerData.items = test.items
        end

        for _ , itemData in pairs(PlayerData.items) do
            if isTable then
                for k, v in pairs(items) do
                    local itemKV = {k, v}
                    if itemData and itemData.name == itemKV[kvIndex] and ((amount and itemData.amount >= amount) or (not isArray and itemData.amount >= v) or (not amount and isArray)) then
                        count += 1
                    end
                end
                if count == totalItems then
                    return true
                end
            else -- Single item as string
                if itemData and itemData.name == items and (not amount or (itemData and amount and itemData.amount >= amount)) then
                    return true
                end
            end
        end
        return false
    end
    
    RegisterNetEvent('QBCore:Client:UpdateObject', function()
        QBCore = exports['qb-core']:GetCoreObject()
    end)
    
    RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
        PlayerData = val
    end)

    exports("HasItem", HasItem)
    
    ---Gets the closest vending machine object to the client
    function GetClosestVending()
        local ped = PlayerPed
        local pos = GetEntityCoords(ped)
        local object = nil
        for _, machine in pairs(Config.VendingObjects) do
            local ClosestObject = GetClosestObjectOfType(pos.x, pos.y, pos.z, 0.75, joaat(machine), false, false, false)
            if ClosestObject ~= 0 then
                if object == nil then
                    object = ClosestObject
                end
            end
        end
        return object
    end
    
    ---Returns a formatted attachments table from item data
    function FormatWeaponAttachments(itemdata)
        local attachments = {}
        itemdata.name = itemdata.name:upper()
        if itemdata.info.attachments ~= nil and next(itemdata.info.attachments) ~= nil then
            for _, v in pairs(itemdata.info.attachments) do
                if WeaponAttachments[itemdata.name] ~= nil then
                    for key, value in pairs(WeaponAttachments[itemdata.name]) do
                        if value.component == v.component then
                            local item = value.item
                            attachments[#attachments+1] = {
                                attachment = key,
                                label = QBCore.Shared.Items[item].label
                                --label = value.label
                            }
                        end
                    end
                end
            end
        end
        return attachments
    end
    
    ---Checks if the vehicle's engine is at the back or not
    function IsBackEngine(vehModel)
        return BackEngineVehicles[vehModel]
    end
    
    ---Opens the trunk of the closest vehicle
    function OpenTrunk()
        local vehicle = QBCore.Functions.GetClosestVehicle()
        LoadAnimDict("amb@prop_human_bum_bin@idle_b")
        TaskPlayAnim(PlayerPed, "amb@prop_human_bum_bin@idle_b", "idle_d", 4.0, 4.0, -1, 50, 0, false, false, false)
        if IsBackEngine(GetEntityModel(vehicle)) then
            SetVehicleDoorOpen(vehicle, 4, false, false)
        else
            SetVehicleDoorOpen(vehicle, 5, false, false)
        end
    end
    
    ---Closes the trunk of the closest vehicle
    function CloseTrunk()
        local vehicle = QBCore.Functions.GetClosestVehicle()
        LoadAnimDict("amb@prop_human_bum_bin@idle_b")
        TaskPlayAnim(PlayerPed, "amb@prop_human_bum_bin@idle_b", "exit", 4.0, 4.0, -1, 50, 0, false, false, false)
        if IsBackEngine(GetEntityModel(vehicle)) then
            SetVehicleDoorShut(vehicle, 4, false)
        else
            SetVehicleDoorShut(vehicle, 5, false)
        end
    end
    
    ---Closes the inventory NUI
    function closeInventory()
        SendNUIMessage({
            action = "close",
        })
    end
    
    ---Toggles the hotbar of the inventory
    function ToggleHotbar(toggle)
        local HotbarItems = {
            [1] = PlayerData.items[1],
            [2] = PlayerData.items[2],
            [3] = PlayerData.items[3],
            [4] = PlayerData.items[4],
            [5] = PlayerData.items[5],
            [41] = PlayerData.items[41],
        }
    
        SendNUIMessage({
            action = "toggleHotbar",
            open = toggle,
            items = HotbarItems
        })
    end
    
    ---Plays the opening animation of the inventory
    function openAnim()
        LoadAnimDict('pickup_object')
        TaskPlayAnim(PlayerPed,'pickup_object', 'putdown_low', 5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    end
    
    ---Setup item info for items from Config.CraftingItems
    function ItemsToItemInfo()
        local itemInfos = {
            [1] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 22x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 32x."},
            [2] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 30x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 42x."},
            [3] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 30x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 45x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 28x."},
            [4] = {costs = QBCore.Shared.Items["electronickit"]["label"] .. ": 2x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 52x, "..QBCore.Shared.Items["steel"]["label"] .. ": 40x."},
            [5] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 10x, " ..QBCore.Shared.Items["plastic"]["label"] .. ": 50x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 30x, "..QBCore.Shared.Items["iron"]["label"] .. ": 17x, "..QBCore.Shared.Items["electronickit"]["label"] .. ": 1x."},
            [6] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 36x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 24x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 28x."},
            [7] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 32x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 43x, "..QBCore.Shared.Items["plastic"]["label"] .. ": 61x."},
            [8] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 50x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 37x, "..QBCore.Shared.Items["copper"]["label"] .. ": 26x."},
            [9] = {costs = QBCore.Shared.Items["iron"]["label"] .. ": 60x, " ..QBCore.Shared.Items["glass"]["label"] .. ": 30x."},
            [10] = {costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 60x, " ..QBCore.Shared.Items["glass"]["label"] .. ": 30x."},
            [11] = {costs = QBCore.Shared.Items["iron"]["label"] .. ": 33x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 44x, "..QBCore.Shared.Items["plastic"]["label"] .. ": 55x, "..QBCore.Shared.Items["aluminum"]["label"] .. ": 22x."},
            [12] = {costs = QBCore.Shared.Items["iron"]["label"] .. ": 50x, " ..QBCore.Shared.Items["steel"]["label"] .. ": 50x, "..QBCore.Shared.Items["screwdriverset"]["label"] .. ": 3x, "..QBCore.Shared.Items["advancedlockpick"]["label"] .. ": 2x."},
        }
    
        local items = {}
        for _, item in pairs(Config.CraftingItems) do
            local itemInfo = QBCore.Shared.Items[item.name:lower()]
            items[item.slot] = {
                name = itemInfo["name"],
                amount = tonumber(item.amount),
                info = itemInfos[item.slot],
                label = itemInfo["label"],
                description = itemInfo["description"] or "",
                weight = itemInfo["weight"],
                type = itemInfo["type"],
                unique = itemInfo["unique"],
                useable = itemInfo["useable"],
                image = itemInfo["image"],
                slot = item.slot,
                costs = item.costs,
                threshold = item.threshold,
                points = item.points,
            }
        end
        Config.CraftingItems = items
    end
    
    ---Setup item info for items from Config.AttachmentCrafting["items"]
    function SetupAttachmentItemsInfo()
        local itemInfos = {
            [1] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 140x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 250x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 60x"},
            [2] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 165x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 285x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 75x"},
            [3] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 190x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 305x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 85x, " .. QBCore.Shared.Items["smg_extendedclip"]["label"] .. ": 1x"},
            [4] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 205x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 340x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 110x, " .. QBCore.Shared.Items["smg_extendedclip"]["label"] .. ": 2x"},
            [5] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 230x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 365x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 130x"},
            [6] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 255x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 390x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 145x"},
            [7] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 270x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 435x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 155x"},
            [8] = {costs = QBCore.Shared.Items["metalscrap"]["label"] .. ": 300x, " .. QBCore.Shared.Items["steel"]["label"] .. ": 469x, " .. QBCore.Shared.Items["rubber"]["label"] .. ": 170x"},
        }
    
        local items = {}
        for _, item in pairs(Config.AttachmentCrafting["items"]) do
            local itemInfo = QBCore.Shared.Items[item.name:lower()]
            items[item.slot] = {
                name = itemInfo["name"],
                amount = tonumber(item.amount),
                info = itemInfos[item.slot],
                label = itemInfo["label"],
                description = itemInfo["description"] or "",
                weight = itemInfo["weight"],
                unique = itemInfo["unique"],
                useable = itemInfo["useable"],
                image = itemInfo["image"],
                slot = item.slot,
                costs = item.costs,
                threshold = item.threshold,
                points = item.points,
            }
        end
        Config.AttachmentCrafting["items"] = items
    end
    
    ---Runs ItemsToItemInfo() and checks if the client has enough reputation to support the threshold, otherwise the items is not available to craft for the client
    function GetThresholdItems()
        ItemsToItemInfo()
        local items = {}
        for k in pairs(Config.CraftingItems) do
            if PlayerData.metadata["craftingrep"] >= Config.CraftingItems[k].threshold then
                items[k] = Config.CraftingItems[k]
            end
        end
        return items
    end
    
    ---Runs SetupAttachmentItemsInfo() and checks if the client has enough reputation to support the threshold, otherwise the items is not available to craft for the client
    function GetAttachmentThresholdItems()
        SetupAttachmentItemsInfo()
        local items = {}
        for k in pairs(Config.AttachmentCrafting["items"]) do
            if PlayerData.metadata["attachmentcraftingrep"] >= Config.AttachmentCrafting["items"][k].threshold then
                items[k] = Config.AttachmentCrafting["items"][k]
            end
        end
        return items
    end
    
    ---Removes drops in the area of the client
    function RemoveNearbyDrop(index) 
        if DropsNear[index] then
            local dropItem = DropsNear[index].object
            if DoesEntityExist(dropItem) then
                DeleteEntity(dropItem)
            end
    
            DropsNear[index] = nil
            if Drops[index] then
                Drops[index].object = nil
                Drops[index].isDropShowing = nil
            end
        end
    end
    
    ---Removes all drops in the area of the client
    function RemoveAllNearbyDrops()
        for k in pairs(DropsNear) do
            RemoveNearbyDrop(k)
        end
    end
end
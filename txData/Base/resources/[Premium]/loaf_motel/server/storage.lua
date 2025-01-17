CreateThread(function()
    while not ESX do
        Wait(500)
    end

    ESX.RegisterServerCallback("loaf_motel:getMoney", function(source, cb, instance)
        if instance and Instances[instance] then
            TriggerEvent("esx_datastore:getDataStore", "loaf_motel", Instances[instance].identifier, function(store)
                local money = {}
                for k, v in pairs(Config.MoneyStorage) do
                    if v.Allow then
                        money[v.Account] = store.get(v.Account) or 0
                    end
                end
                --print(json.encode(money,{indent=true}))
                cb(money)
            end)
        end
    end)

    ESX.RegisterServerCallback("loaf_motel:deposit_money", function(source, cb, instance, account, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer and instance and Instances[instance] and type(amount) == "number" and amount > 0 then
            local xAcc = xPlayer.getAccount(account)
            if xAcc and xAcc.money >= amount then
                TriggerEvent("esx_datastore:getDataStore", "loaf_motel", Instances[instance].identifier, function(store)
                    local balance = store.get(account) or 0
                    xPlayer.removeAccountMoney(account, amount)
                    store.set(account, balance + amount)
                end)
            else
                TriggerClientEvent("esx:showNotification", source, Strings["not_enough_money"], "error")
            end
        end
        cb()
    end)

    ESX.RegisterServerCallback("loaf_motel:withdraw_money", function(source, cb, instance, account, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer and instance and Instances[instance] and type(amount) == "number" and amount > 0 then
            TriggerEvent("esx_datastore:getDataStore", "loaf_motel", Instances[instance].identifier, function(store)
                local balance = store.get(account) or 0
                if balance >= amount then
                    xPlayer.addAccountMoney(account, amount)
                    store.set(account, balance - amount)
                end
            end)
        end
        cb()
    end)

    ESX.RegisterServerCallback("loaf_motel:open_storage", function(source, cb, instance)
        local xPlayer = ESX.GetPlayerFromId(source)
    
        if Instances[instance] and xPlayer then
            TriggerEvent("esx_addoninventory:getInventory", "loaf_motel", Instances[instance].identifier, function(inventory)
                TriggerEvent("esx_datastore:getDataStore", "loaf_motel", Instances[instance].identifier, function(store)
                    local weapons = store.get("weapons") or {}
                    cb(inventory.items, xPlayer.inventory, weapons, xPlayer.getLoadout())
                end)
            end)
        end
    end)
    
    ESX.RegisterServerCallback("loaf_motel:get_weight", function(source, cb, instance)
        if Instances[instance] then
            TriggerEvent("esx_addoninventory:getInventory", "loaf_motel", Instances[instance].identifier, function(inventory)
                TriggerEvent("esx_datastore:getDataStore", "loaf_motel", Instances[instance].identifier, function(store)
                    local weapons, weight = store.get("weapons") or {}, 0
                    for k, v in pairs(inventory.items) do
                        if ESX.Items[v.name] and ESX.Items[v.name].weight then
                            weight = weight + (ESX.Items[v.name].weight * v.count)
                        else
                            weight = weight + v.count
                        end
                    end
                    if Config.Storage.WeaponWeight > 0 then
                        for k, v in pairs(weapons) do
                            weight = weight + Config.Storage.WeaponWeight
                        end
                    end
                    cb(weight, Config.Storage.Limits[Instances[instance].interior], Instances[instance].identifier)
                end)
            end)
        end
    end)
    
    ESX.RegisterServerCallback("loaf_motel:deposit", function(source, cb, instance, item, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
    
        if xPlayer and item and Instances[instance] then
            if amount and amount > 0 then
                local itemdata = xPlayer.getInventoryItem(item)
                if itemdata and itemdata.count >= amount then
                    TriggerEvent("esx_addoninventory:getInventory", "loaf_motel", Instances[instance].identifier, function(inventory)
                        TriggerEvent("esx_datastore:getDataStore", "loaf_motel", Instances[instance].identifier, function(store)
                            local weapons = store.get("weapons") or {}
                            local item_weight, weapon_weight = 0, 0
                            
                            if Config.Storage.Limit then
                                if itemdata.weight then
                                    item_weight = itemdata.weight * amount
                                end
    
                                for k, v in pairs(inventory.items) do
                                    if ESX.Items[v.name] and ESX.Items[v.name].weight then
                                        item_weight = item_weight + (ESX.Items[v.name].weight * v.count)
                                    else
                                        item_weight = item_weight + v.count
                                    end
                                end
    
                                if Config.Storage.WeaponWeight > 0 then
                                    for k, v in pairs(weapons) do
                                        weapon_weight = weapon_weight + Config.Storage.WeaponWeight
                                    end
                                end
                            end
    
                            if not Config.Storage.Limit or (item_weight + weapon_weight) <= Config.Storage.Limits[Instances[instance].interior] then
                                xPlayer.removeInventoryItem(item, amount)
                                inventory.addItem(item, amount)
                                cb(true)
                            else
                                TriggerClientEvent("esx:showNotification", source, Strings["too_much"], "error")
                                cb(false)
                            end
                        end)
                    end)
                else
                    cb(false)
                end
            else
                local loadoutNum, weapon = xPlayer.getWeapon(item)
    
                if weapon then
                    TriggerEvent("esx_datastore:getDataStore", "loaf_motel", Instances[instance].identifier, function(store)
                        local weapons = store.get("weapons") or {}
                        local found, unique_id = false, math.random(999999999)
                        while not found do
                            local in_table = false
                            for k, v in pairs(weapons) do
                                if v.id == unique_id then
                                    in_table = true
                                    break
                                end
                            end
                            if not in_table then
                                found = true
                            else
                                unique_id = math.random(999999999)
                            end
                            Wait(15)
                        end
    
                        table.insert(weapons, {
                            name = weapon.name,
                            label = weapon.label,
                            ammo = weapon.ammo,
                            components = weapon.components,
                            tint = weapon.tintIndex,
                            id = unique_id
                        })
    
                        if Config.Storage.Limit and Config.Storage.WeaponWeight > 0 then
                            local weapon_weight = 0
                            for k, v in pairs(weapons) do
                                weapon_weight = weapon_weight + Config.Storage.WeaponWeight
                            end
    
                            if weapon_weight <= Config.Storage.Limits[Instances[instance].interior] then
                                TriggerEvent("esx_addoninventory:getInventory", "loaf_motel", Instances[instance].identifier, function(inventory)
                                    local item_weight = 0
                                    for k, v in pairs(inventory.items) do
                                        if ESX.Items[v.name] and ESX.Items[v.name].weight then
                                            item_weight = item_weight + (ESX.Items[v.name].weight * v.count)
                                        else
                                            item_weight = item_weight + v.count
                                        end
                                    end
    
                                    if (item_weight + weapon_weight) <= Config.Storage.Limits[Instances[instance].interior] then
                                        store.set("weapons", weapons)
                                        xPlayer.removeWeapon(item)
                                        cb(true)
                                    else
                                        TriggerClientEvent("esx:showNotification", source, Strings["too_much"], "error")
                                        cb(false)
                                    end
                                end)
                            else
                                TriggerClientEvent("esx:showNotification", source, Strings["too_much"], "error")
                                cb(false)
                            end
                        else
                            xPlayer.removeWeapon(item)
                            store.set("weapons", weapons)
                            cb(true)
                        end
                    end)
                else
                    cb(false)
                end
            end
        else
            cb(false)
        end
    end)
    
    ESX.RegisterServerCallback("loaf_motel:withdraw", function(source, cb, instance, item, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
    
        if xPlayer and item and Instances[instance] then
            if amount and amount > 0 then
                TriggerEvent("esx_addoninventory:getInventory", "loaf_motel", Instances[instance].identifier, function(inventory)
                    local itemdata = inventory.getItem(item)
                    if itemdata and itemdata.count >= amount then
                        local itemdata = xPlayer.getInventoryItem(item)
                        if (xPlayer.canCarryItem and xPlayer.canCarryItem(item, amount)) then
                            xPlayer.addInventoryItem(item, amount)
                            inventory.removeItem(item, amount)
                            cb(true)
                        elseif not xPlayer.canCarryItem and (itemdata.limit == -1 or (itemdata.count + count) <= itemdata.limit) then
                            xPlayer.addInventoryItem(item, amount)
                            inventory.removeItem(item, amount)
                            cb(true)
                        else
                            TriggerClientEvent("esx:showNotification", source, Strings["cant_carry"], "error")
                            cb(false)
                        end
                    else
                        cb(false)
                    end
                end)
            else
                TriggerEvent("esx_datastore:getDataStore", "loaf_motel", Instances[instance].identifier, function(store)
                    local weapons = store.get("weapons") or {}
                    local weapon, weapon_data
                    for k, v in pairs(weapons) do
                        if v.id == item then
                            weapon = k
                            weapon_data = v
                        end
                    end
    
                    if weapon then
                        local _, hasweapon = xPlayer.getWeapon(weapon_data.name)
                        if not hasweapon then
                            table.remove(weapons, weapon)
                            xPlayer.addWeapon(weapon_data.name, weapon_data.ammo)
                            if xPlayer.setWeaponTint and weapon_data.tint then
                                xPlayer.setWeaponTint(weapon_data.name, weapon_data.tint)
                            end
                            if weapon_data.components and xPlayer.addWeaponComponent then
                                for k, v in pairs(weapon_data.components) do
                                    xPlayer.addWeaponComponent(weapon_data.name, v)
                                end
                            end
                            store.set("weapons", weapons)
                            cb(true)
                        else
                            TriggerClientEvent("esx:showNotification", source, (Strings["already_weapon"]):format(weapon_data.label), "error")
                            cb(false)
                        end
                    else
                        cb(false)
                    end
                end)
            end
        else
            cb(false)
        end
    end)
end)
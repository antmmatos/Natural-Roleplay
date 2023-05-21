-- DEPOSIT ITEMS
PutItems = function(instance)
    ESX.TriggerServerCallback("loaf_motel:open_storage", function(storage, inventory)
        local elements = {}
        for k, v in pairs(inventory) do
            if v.count > 0 then
                table.insert(elements, {
                    label = ("x%s %s"):format(v.count, v.label),
                    item = v.name,
                    count = v.count
                })
            end
        end

        if #elements == 0 then
            table.insert(elements, { label = Strings["empty"] })
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "deposit", {
            title = Strings["put"],
            align = Config.Options.Align,
            elements = elements
        }, function(data, menu)
            if data.current.item then
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "amount", {
                    title = Strings["amount"]
                }, function(data2, menu2)
                    local amount = tonumber(data2.value)
                    if amount and amount <= data.current.count then
                        ESX.TriggerServerCallback("loaf_motel:deposit", function(success)
                            menu2.close()
                            menu.close()
                            PutItems(instance)
                        end, instance, data.current.item, amount)
                    else
                        ESX.ShowNotification(Strings["invalid_amount"], "error")
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            end
        end, function(data, menu)
            menu.close()
        end)
    end, instance)
end

-- WITHDRAW ITEMS
GetItems = function(instance)
    ESX.TriggerServerCallback("loaf_motel:open_storage", function(storage, inventory)
        local elements = {}
        for k, v in pairs(storage) do
            if v.count > 0 then
                table.insert(elements, {
                    label = ("x%s %s"):format(v.count, v.label),
                    item = v.name,
                    count = v.count
                })
            end
        end

        if #elements == 0 then
            table.insert(elements, { label = Strings["empty"] })
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "withdraw", {
            title = Strings["get"],
            align = Config.Options.Align,
            elements = elements
        }, function(data, menu)
            if data.current.item then
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "amount", {
                    title = Strings["amount"]
                }, function(data2, menu2)
                    local amount = tonumber(data2.value)
                    if amount and amount <= data.current.count then
                        ESX.TriggerServerCallback("loaf_motel:withdraw", function(success)
                            menu2.close()
                            menu.close()
                            GetItems(instance)
                        end, instance, data.current.item, amount)
                    else
                        ESX.ShowNotification(Strings["invalid_amount"], "error")
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            end
        end, function(data, menu)
            menu.close()
        end)
    end, instance)
end

-- SELECT DEPOSIT  / WITHDRAW ITEMS
ItemInventory = function(instance)
    local weight, maxweight
    if Config.Storage.Limit then
        ESX.TriggerServerCallback("loaf_motel:get_weight", function(used, max)
            weight = used
            maxweight = max
        end, instance)
        while weight == nil do
            Wait(0)
        end
    end

    elements = {
        { value = "put", label = Strings["put"] },
        { value = "get", label = Strings["get"] },
    }
    if Config.Storage.Limit and not Config.Storage.Weapons then
        table.insert(elements, { label = (Strings["weight"]:format(weight, maxweight)) })
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_put_get", {
        title = Strings["storage-items"],
        align = Config.Options.Align,
        elements = elements
    }, function(data, menu)
        if data.current.value == "put" then
            PutItems(instance)
        elseif data.current.value == "get" then
            GetItems(instance)
        end
    end, function(data, menu)
        menu.close()
        if Config.Storage.Weapons then
            OpenStorage(instance)
        end
    end)
end

MoneyStorage = function(instance)
    ESX.TriggerServerCallback("loaf_motel:getMoney", function(accounts)
        local elements = {}
        for k, v in pairs(Config.MoneyStorage) do
            if v.Allow then
                table.insert(elements, { value = k, label = (Strings[v.Label]):format(accounts[v.Account]) })
            end
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_account", {
            title = Strings["money"],
            align = Config.Options.Align,
            elements = elements
        }, function(data, menu)
            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "withdraw_put", {
                title = data.current.label,
                align = Config.Options.Align,
                elements = {
                    { value = "deposit",  label = Strings["deposit_money"] },
                    { value = "withdraw", label = Strings["withdraw_money"] }
                }
            }, function(data2, menu2)
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "amount", {
                    title = Strings["amount_" .. data2.current.value]
                }, function(data3, menu3)
                    local amount = tonumber(data3.value)
                    if amount > 0 then
                        if data2.current.value == "deposit" then
                            if (amount + accounts[Config.MoneyStorage[data.current.value].Account] <= (Config.MoneyStorage[data.current.value].Limit or 0)) or not Config.MoneyStorage[data.current.value].Limit then
                                menu3.close()
                                menu2.close()
                                menu.close()
                                ESX.TriggerServerCallback("loaf_motel:deposit_money", function()
                                    MoneyStorage(instance)
                                end, instance, Config.MoneyStorage[data.current.value].Account, amount)
                            else
                                ESX.ShowNotification(Strings["exceed_limit"]:format(Config.MoneyStorage
                                    [data.current.value].Limit or 0), "error")
                            end
                        else
                            if amount <= accounts[Config.MoneyStorage[data.current.value].Account] then
                                menu3.close()
                                menu2.close()
                                menu.close()
                                ESX.TriggerServerCallback("loaf_motel:withdraw_money", function()
                                    MoneyStorage(instance)
                                end, instance, Config.MoneyStorage[data.current.value].Account, amount)
                            else
                                ESX.ShowNotification(Strings["too_much"], "error")
                            end
                        end
                    else
                        ESX.ShowNotification(Strings["invalid_amount"], "error")
                    end
                end, function(data3, menu3)
                    menu3.close()
                end)

                if data2.current.value == "deposit" then

                elseif data2.current.value == "withdraw" then

                end
            end, function(data2, menu2)
                menu2.close()
            end)
        end, function(data, menu)
            menu.close()
        end)
    end, instance)
end

-- SELECT ITEM TYPE
OpenStorage = function(instance)
    ESX.UI.Menu.CloseAll()

    if Config.Inventory == "default" then
        if Config.Storage.Weapons then
            local weight, maxweight
            if Config.Storage.Limit then
                ESX.TriggerServerCallback("loaf_motel:get_weight", function(used, max)
                    weight = used
                    maxweight = max
                end, instance)
                while weight == nil do
                    Wait(0)
                end
            end

            elements = {
                { value = "items",   label = Strings["items"] },
                { value = "weapons", label = Strings["weapons"] },
            }
            for k, v in pairs(Config.MoneyStorage) do
                if v.Allow then
                    table.insert(elements, { value = "money", label = Strings["money"] })
                    break
                end
            end
            if Config.Storage.Limit then
                table.insert(elements, { label = (Strings["weight"]:format(weight, maxweight)) })
            end

            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_item_type", {
                title = Strings["storage"],
                align = Config.Options.Align,
                elements = elements
            }, function(data, menu)
                if data.current.value == "items" then
                    ItemInventory(instance)
                elseif data.current.value == "weapons" then
                    WeaponInventory(instance)
                elseif data.current.value == "money" then
                    MoneyStorage(instance)
                end
            end, function(data, menu)
                menu.close()
            end)
        else
            ItemInventory(instance)
        end
    elseif Config.Inventory == "modfreakz" then
        --ESX.TriggerServerCallback("loaf_motel:register_inventory", function(built)
        --    if built then
        --        exports["mf-inventory"]:openOtherInventory(instance)
        --    end
        --end, instance)
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Motels_" .. Cache.Instance.identifier)
        TriggerEvent("inventory:client:SetCurrentStash", "Motels_" .. Cache.Instance.identifier)
    elseif Config.Inventory == "linden" then
        ESX.TriggerServerCallback("loaf_motel:get_weight", function(_, max, owner)
            exports['linden_inventory']:OpenStash({
                owner = owner,
                id = instance,
                label = "Motel room",
                slots = max or 500
            })
        end, instance)
    elseif Config.Inventory == "ox" then
        --exports.ox_inventory:openInventory("stash", {id = instance, owner = Cache.Instance.identifier})
    end
end

-- DEPOSIT WEAPONS
PutWeapons = function(instance)
    ESX.TriggerServerCallback("loaf_motel:open_storage", function(_, _, _, loadout)
        local elements = {}
        for k, v in pairs(loadout) do
            table.insert(elements, {
                weapon = v.name,
                label = v.label
            })
        end

        if #elements == 0 then
            table.insert(elements, { label = Strings["empty"] })
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "deposit_weapon", {
            title = Strings["put_weapon"],
            align = Config.Options.Align,
            elements = elements
        }, function(data, menu)
            if data.current.weapon then
                ESX.TriggerServerCallback("loaf_motel:deposit", function(success)
                    menu.close()
                    PutWeapons(instance)
                end, instance, data.current.weapon)
            end
        end, function(data, menu)
            menu.close()
        end)
    end, instance)
end

-- WITHDRAW WEAPONS
GetWeapons = function(instance)
    ESX.TriggerServerCallback("loaf_motel:open_storage", function(_, _, weapons)
        local elements = {}
        for k, v in pairs(weapons) do
            table.insert(elements, {
                id = v.id,
                label = (Strings["bullets"]):format(v.label, v.ammo)
            })
        end

        if #elements == 0 then
            table.insert(elements, { label = Strings["empty"] })
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "deposit_weapon", {
            title = Strings["get_weapon"],
            align = Config.Options.Align,
            elements = elements
        }, function(data, menu)
            if data.current.id then
                ESX.TriggerServerCallback("loaf_motel:withdraw", function(success)
                    menu.close()
                    GetWeapons(instance)
                end, instance, data.current.id)
            end
        end, function(data, menu)
            menu.close()
        end)
    end, instance)
end

-- SELECT DEPOSIT / WITHDRAW WEAPONS
WeaponInventory = function(instance)
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_put_get", {
        title = Strings["storage-weapons"],
        align = Config.Options.Align,
        elements = {
            { value = "put", label = Strings["put_weapon"] },
            { value = "get", label = Strings["get_weapon"] },
        }
    }, function(data, menu)
        if data.current.value == "put" then
            PutWeapons(instance)
        elseif data.current.value == "get" then
            GetWeapons(instance)
        end
    end, function(data, menu)
        menu.close()
        OpenStorage(instance)
    end)
end

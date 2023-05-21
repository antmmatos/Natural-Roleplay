local function ManageOwned(motel)
    local motelData = Config.Motels[motel]

    ESX.UI.Menu.CloseAll()

    local elements = {
        {label = Strings["stop_rent"], value = "sell"}
    }
    local rent = 0
    if motelData.Rent then
        rent = Config.Prices[Cache.owned.interior.Id]
    end
    if rent > 0 then
        table.insert(elements, {label = (Strings["balance"]):format(Cache.owned.money)})
        table.insert(elements, {label = Strings["deposit_rent"], value = "deposit"})
        table.insert(elements, {label = (Strings["rent_due"]):format(math.floor(Cache.owned.rent_due/(24*60*60)))})
    end

    local upgradeElements, downgradeElements = {}, {}

    if #motelData.Interiors > 1 then
        if #motelData.Interiors > Cache.owned.interiorid then
            table.insert(elements, {label = Strings["upgrade_room"], value = "upgrade"})
            for k, v in pairs(motelData.Interiors) do
                if k > Cache.owned.interiorid then
                    table.insert(upgradeElements, {label = (Strings["interior_rent"]):format(v, Config.Prices[v]), value = k, interior = v})
                end
            end
        end

        if Cache.owned.interiorid > 1 then
            table.insert(elements, {label = Strings["downgrade_room"], value = "downgrade"})
            for k, v in pairs(motelData.Interiors) do
                if k < Cache.owned.interiorid then
                    table.insert(downgradeElements, {label = (Strings["interior_rent"]):format(v, Config.Prices[v]), value = k, interior = v})
                end
            end
        end
    end
    
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "manage_rent", {
        title = motelData.Name,
        align = Config.Options.Align,
        elements = elements
    }, function(data, menu)
        if data.current.value == "sell" then
            TriggerServerEvent("loaf_motel:sell", Cache.owned)
            menu.close()
        elseif data.current.value == "deposit" then
            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "to_deposit", {
                title = Strings["amount"]
            }, function(data2, menu2)
                local amount = tonumber(data2.value)
                if amount and amount > 0 then
                    TriggerServerEvent("loaf_motel:deposit_rent", amount)
                    menu2.close()
                    menu.close()
                else
                    ESX.ShowNotification(Strings["invalid_amount"], "error")
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.value == "downgrade" then
            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "downgrade", {
                title = Strings["downgrade"],
                align = Config.Options.Align,
                elements = downgradeElements
            }, function(data2, menu2)
                ESX.UI.Menu.Open("default", GetCurrentResourceName(), "confirm_downgrade", {
                    title = (Strings["confirm_downgrade"]):format(data2.current.interior, Config.Prices[data2.current.interior]),
                    align = Config.Options.Align,
                    elements = {
                        {label = Strings["downgrade"], value = "confirm"},
                        {label = Strings["cancel"], value = "cancel"},
                    },
                }, function(data3, menu3)
                    if data3.current.value == "confirm" then
                        TriggerServerEvent("loaf_motel:swap_interior", Cache.owned, data2.current.value)
                        ESX.UI.Menu.CloseAll()
                    else
                        menu3.close()
                    end
                end, function(data3, menu3)
                    menu3.close()
                end)
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.value == "upgrade" then
            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "upgrade", {
                title = Strings["upgrade"],
                align = Config.Options.Align,
                elements = upgradeElements
            }, function(data2, menu2)
                ESX.UI.Menu.Open("default", GetCurrentResourceName(), "confirm_upgrade", {
                    title = (Strings["confirm_upgrade"]):format(data2.current.interior, Config.Prices[data2.current.interior]),
                    align = Config.Options.Align,
                    elements = {
                        {label = Strings["upgrade"], value = "confirm"},
                        {label = Strings["cancel"], value = "cancel"},
                    },
                }, function(data3, menu3)
                    if data3.current.value == "confirm" then
                        TriggerServerEvent("loaf_motel:swap_interior", Cache.owned, data2.current.value)
                        ESX.UI.Menu.CloseAll()
                    else
                        menu3.close()
                    end
                end, function(data3, menu3)
                    menu3.close()
                end)
            end, function(data2, menu2)
                menu2.close()
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
end

local function PurchaseMenu(motel)
    local motelData = Config.Motels[motel]

    local elements = {}
    if not motelData.Rent then
        table.insert(elements, {
            label = Strings["claim_room"],
            value = "rent"
        })
    else
        local rent = Config.Prices[motelData.Interiors[1]]
        table.insert(elements, {
            label = (Strings["rent_room"]:format(rent)),
            value = "rent"
        })
    end
    
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "motel_menu", {
        title = motelData.Name,
        align = Config.Options.Align,
        elements = elements
    }, function(data, menu)
        if data.current.value == "rent" then
            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "room_to_get", {
                title = (Strings["what_room"]):format(1, #motelData.Rooms)
            }, function(data2, menu2)
                local room = tonumber(data2.value)
                if room and room >= 1 and room <= #motelData.Rooms then
                    TriggerServerEvent("loaf_motel:purchase", motel, room)

                    menu2.close()
                    menu.close()
                else
                    ESX.ShowNotification(Strings["invalid_room"], "error")
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
end

function ManageMotel(motel)
    ESX.UI.Menu.CloseAll()

    if Cache.owned and Cache.owned.motel == motel then -- if the player owns a room at this motel
        ManageOwned(motel)
    else
        PurchaseMenu(motel)
    end
end
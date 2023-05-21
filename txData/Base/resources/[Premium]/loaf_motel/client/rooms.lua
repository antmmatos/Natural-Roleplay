function RoomMenu(data)
    ESX.UI.Menu.CloseAll()
    local motel, room = table.unpack(data)

    local owns = (Cache.owned and Cache.owned.motel == motel and Cache.owned.room == room)
    local elements = {}
    if owns then
        table.insert(elements, {
            label = (Strings["your_room"]):format(Cache.owned.id, GlobalState[("motel_%s:room_%s:id_%s"):format(Cache.owned.motel, Cache.owned.room, Cache.owned.id)] and Strings["unlocked"] or Strings["locked"]),
            value = "owned_room"
        })

        table.insert(elements, {
            label = Strings["copy_keys"],
            value = "copy_keys"
        })
    end

    table.insert(elements, {
        label = Strings["enter_a_room"],
        value = "enter_room"
    })

    if Cache.ispolice then
        table.insert(elements, {
            label = Strings["raid_a_room"],
            value = "raid_room"
        })
    end

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "enter_a_room", {
        title = Config.Motels[motel].Name,
        align = Config.Options.Align,
        elements = elements
    }, function(data, menu)
        if data.current.value == "owned_room" then
            local owned = Cache.owned
            TriggerServerEvent("loaf_motels:enter_room", owned.motel, owned.room, owned.id)
        elseif data.current.value == "copy_keys" then
            local owned = Cache.owned
            TriggerServerEvent("loaf_motels:copy_keys", owned.motel, owned.room, owned.id)
        elseif data.current.value == "enter_room" or data.current.value == "raid_room" then
            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "room_enter", {
                title = Strings["room_id"]
            }, function(data2, menu2)
                local id = tonumber(data2.value)
                if id and id >= 1000 and id <= 9999 then
                    menu2.close()
                    menu.close()
                    if data.current.value == "enter_room" then
                        TriggerServerEvent("loaf_motels:enter_room", motel, room, id)
                    else
                        TriggerServerEvent("loaf_motels:enter_room", motel, room, id, true)
                    end
                else
                    ESX.ShowNotification(Strings["invalid_id"], "error")
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent("loaf_motel:set_owned")
AddEventHandler("loaf_motel:set_owned", function(motel, room, interior, id, money, rent_due)
    if motel then
        Cache.owned = {
            motel = motel,
            room = room,
            interior = Shells[interior],
            interiorid = interior,
            id = id,
            money = money,
            rent_due = rent_due
        }
    else
        Cache.owned = nil
    end

    LoadBlips()
    LoadMarkers()
end)
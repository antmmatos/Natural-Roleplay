local hasAlreadyEnteredMarker, lastZone, currentAction, currentActionMsg, hasPaid

function OpenShopMenuBarber()
    hasPaid = false

    TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
        menu.close()

        local elements = {
            { label = "Sim", value = "yes" },
            { label = "Não",  value = "no" },
        }

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_menu_barber', {
            title    = "Barbearia",
            align    = 'top-left',
            elements = elements,
        }, function(data, menu)
            if data.current.value == 'yes' then
                ESX.TriggerServerCallback('esx_barbershop:checkMoney', function(hasEnoughMoney)
                    if hasEnoughMoney then
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)

                        TriggerServerEvent('esx_barbershop:pay')
                        hasPaid = true
                    else
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                            TriggerEvent('skinchanger:loadSkin', skin)
                        end)

                        ESX.ShowNotification("Saldo insuficiente", "error")
                    end
                end)
            elseif data.current.value == 'no' then
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                end)
            end
            menu.close()
        end, function(data, menu)
            menu.close()

            currentAction    = 'shop_menu_barber'
            currentActionMsg = "Pressione ~INPUT_CONTEXT~ para acessar a barbearia"
        end)
    end, function(data, menu)
        menu.close()

        currentAction    = 'shop_menu_barber'
        currentActionMsg = "Pressione ~INPUT_CONTEXT~ para acessar a barbearia"
    end, {
        'beard_1',
        'beard_2',
        'beard_3',
        'beard_4',
        'hair_1',
        'hair_2',
        'hair_color_1',
        'hair_color_2',
        'eyebrows_1',
        'eyebrows_2',
        'eyebrows_3',
        'eyebrows_4',
        'makeup_1',
        'makeup_2',
        'makeup_3',
        'makeup_4',
        'lipstick_1',
        'lipstick_2',
        'lipstick_3',
        'lipstick_4',
        'ears_1',
        'ears_2',
    })
end

AddEventHandler('esx_barbershop:hasEnteredMarker', function(zone)
    currentAction = 'shop_menu_barber'
    currentActionMsg = "Pressione ~INPUT_CONTEXT~ para acessar a barbearia"
end)

AddEventHandler('esx_barbershop:hasExitedMarker', function(zone)
    ESX.UI.Menu.CloseAll()
    currentAction = nil

    if not hasPaid then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    end
end)

-- Create Blips
CreateThread(function()
    for k, v in ipairs(BarberConfig.Shops) do
        local blip = AddBlipForCoord(v)

        SetBlipSprite(blip, 71)
        SetBlipColour(blip, 51)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.7)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("Barbearia")
        EndTextCommandSetBlipName(blip)
    end
end)

-- Enter / Exit marker events and draw marker
CreateThread(function()
    while true do
        Wait(0)
        local playerCoords, isInMarker, currentZone, letSleep = GetEntityCoords(PlayerPedId()), nil, nil, true

        for k, v in ipairs(BarberConfig.Shops) do
            local distance = #(playerCoords - v)

            if distance < BarberConfig.DrawDistance then
                letSleep = false
                DrawMarker(BarberConfig.MarkerType, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, BarberConfig.MarkerSize, BarberConfig.MarkerColor.r,
                    BarberConfig.MarkerColor.g, BarberConfig.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)

                if distance < 1.5 then
                    isInMarker, currentZone = true, k
                end
            end
        end

        if (isInMarker and not hasAlreadyEnteredMarker) or (isInMarker and lastZone ~= currentZone) then
            hasAlreadyEnteredMarker, lastZone = true, currentZone
            TriggerEvent('esx_barbershop:hasEnteredMarker', currentZone)
        end

        if not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('esx_barbershop:hasExitedMarker', lastZone)
        end

        if letSleep then
            Wait(500)
        end
    end
end)

-- Key controls
CreateThread(function()
    while true do
        Wait(0)

        if currentAction then
            ESX.ShowHelpNotification(currentActionMsg)

            if IsControlJustReleased(0, 38) then
                if currentAction == 'shop_menu_barber' then
                    OpenShopMenuBarber()
                end

                currentAction = nil
            end
        else
            Wait(500)
        end
    end
end)

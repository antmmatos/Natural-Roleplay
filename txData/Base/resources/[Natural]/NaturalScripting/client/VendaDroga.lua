local isSelling = false

Citizen.CreateThread(function()
    while not VendaDrogaConfig.VendaDroga do
        Citizen.Wait(100)
    end
    local shown = false
    while true do
        local inDistance = false
        local sleep = 1000
        for k, v in pairs(VendaDrogaConfig.VendaDroga) do
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            local distance = Vdist(pedCoords, v["coords"])
            if distance < 2 then
                sleep = 5
                inDistance = true
                if not shown then
                    shown = true
                    exports["okokTextUI"]:Open("Pressione [E] para vender " .. v["drug_label"], "darkblue", "right")
                end
                if IsControlJustPressed(0, 38) then
                    local data = { v["drug"], v["price"] }
                    isSelling = true
                    exports["okokTextUI"]:Close()
                    ESX.ShowNotification("Começaste a vender " .. v["drug_label"], "success")
                    Citizen.CreateThread(function()
                        while isSelling do
                            Citizen.Wait(0)
                            DrawMarker(1, v["coords"].x, v["coords"].y, v["coords"].z - 0.95, 0, 0, 0, 0, 0, 0, 7.5, 7.5,
                                0.15, 255, 255, 255, 255, 0, 0, 0, 0)
                        end
                    end)
                    Citizen.CreateThread(function()
                        while isSelling do
                            local ped = PlayerPedId()
                            local pedCoords = GetEntityCoords(ped)
                            if Vdist(pedCoords, v["coords"]) > 7.5 then
                                ESX.ShowNotification("Paraste de vender " .. v["drug_label"], "error")
                                isSelling = false
                                break
                            end
                            Citizen.Wait(5000)
                        end
                    end)
                    Citizen.CreateThread(function()
                        while isSelling do
                            Citizen.Wait(20000)
                            if isSelling then
                                TriggerServerEvent("Natural:Server:DrugSell:Sell", data)
                            end
                        end
                    end)
                end
            end
        end
        if not inDistance then
            sleep = 1000
            if shown then
                shown = false
                exports["okokTextUI"]:Close()
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent("esx:onPlayerDeath")
AddEventHandler("esx:onPlayerDeath", function()
    isSelling = false
end)

RegisterNetEvent("Natural:Client:DrugSell:Stop")
AddEventHandler("Natural:Client:DrugSell:Stop", function()
    isSelling = false
end)

Citizen.CreateThread(function()
    while not VendaDrogaConfig.VendaDroga do
        Citizen.Wait(100)
    end
    for k, v in pairs(VendaDrogaConfig.VendaDroga) do
        RequestModel(GetHashKey(v["model"]))
        while not HasModelLoaded(GetHashKey(v["model"])) do
            Wait(1)
        end
        local ped = CreatePed(4, v["hash"], v["coords"].x, v["coords"].y, v["coords"].z - 1, 3374176, false, true)
        SetEntityHeading(ped, v["heading"])
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end
end)

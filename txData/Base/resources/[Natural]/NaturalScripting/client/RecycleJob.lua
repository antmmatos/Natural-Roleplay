carryPackage = nil
local onDuty = false
local Config = {}

Config['delivery'] = {
    outsideLocation = { x = 1644.5480, y = 4858.0049, z = 41.0124, a = 273.6172 },
    insideLocation = { x = 1072.72, y = -3102.51, z = -40.0, a = 82.95 },
    pickupLocations = {
        [1] = { x = 1067.68, y = -3095.43, z = -39.9, a = 342.39 },
        [2] = { x = 1065.2, y = -3095.56, z = -39.9, a = 356.53 },
        [3] = { x = 1062.73, y = -3095.15, z = -39.9, a = 184.81 },
        [4] = { x = 1060.37, y = -3095.06, z = -39.9, a = 190.3 },
        [5] = { x = 1057.95, y = -3095.51, z = -39.9, a = 359.02 },
        [6] = { x = 1055.58, y = -3095.53, z = -39.9, a = 0.95 },
        [7] = { x = 1053.09, y = -3095.57, z = -39.9, a = 347.64 },
        [8] = { x = 1053.07, y = -3102.46, z = -39.9, a = 180.26 },
        [9] = { x = 1055.49, y = -3102.45, z = -39.9, a = 180.46 },
        [10] = { x = 1057.93, y = -3102.55, z = -39.9, a = 174.22 },
        [11] = { x = 1060.19, y = -3102.38, z = -39.9, a = 189.44 },
        [12] = { x = 1062.71, y = -3102.53, z = -39.9, a = 182.11 },
        [13] = { x = 1065.19, y = -3102.48, z = -39.9, a = 176.23 },
        [14] = { x = 1067.46, y = -3102.62, z = -39.9, a = 188.28 },
        [15] = { x = 1067.69, y = -3110.01, z = -39.9, a = 173.63 },
        [16] = { x = 1065.13, y = -3109.88, z = -39.9, a = 179.46 },
        [17] = { x = 1062.7, y = -3110.07, z = -39.9, a = 174.32 },
        [18] = { x = 1060.24, y = -3110.26, z = -39.9, a = 177.77 },
        [19] = { x = 1057.76, y = -3109.82, z = -39.9, a = 183.88 },
        [20] = { x = 1055.52, y = -3109.76, z = -39.9, a = 181.36 },
        [21] = { x = 1053.16, y = -3109.71, z = -39.9, a = 177.0 },
    },
    dropLocation = { x = 1048.224, y = -3097.071, z = -38.999, a = 274.810 },
    warehouseObjects = {
        "prop_boxpile_05a",
        "prop_boxpile_04a",
        "prop_boxpile_06b",
        "prop_boxpile_02c",
        "prop_boxpile_02b",
        "prop_boxpile_01a",
        "prop_boxpile_08a",
    },
}

Citizen.CreateThread(function()
    local RecycleBlip = AddBlipForCoord(Config['delivery'].outsideLocation.x, Config['delivery'].outsideLocation.y,
        Config['delivery'].outsideLocation.z)
    SetBlipSprite(RecycleBlip, 365)
    SetBlipColour(RecycleBlip, 2)
    SetBlipScale(RecycleBlip, 0.8)
    SetBlipAsShortRange(RecycleBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Centro de Reciclagem")
    EndTextCommandSetBlipName(RecycleBlip)
    local canSleep = true
    while true do
        Citizen.Wait(3)
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        ---- BUITEN
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config['delivery'].outsideLocation.x, Config['delivery'].outsideLocation.y, Config['delivery'].outsideLocation.z, true) < 1.3 then
            canSleep = false
            DrawText3D(Config['delivery'].outsideLocation.x, Config['delivery'].outsideLocation.y,
                Config['delivery'].outsideLocation.z + 1, "~g~E~w~ - Entrar no armazem")
            if IsControlJustReleased(0, 38) then
                DoScreenFadeOut(500)
                while not IsScreenFadedOut() do
                    Citizen.Wait(10)
                end
                SetEntityCoords(GetPlayerPed(-1), Config['delivery'].insideLocation.x,
                    Config['delivery'].insideLocation.y, Config['delivery'].insideLocation.z)
                DoScreenFadeIn(500)
            end
        end
        ---- BINNEN
        if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config['delivery'].insideLocation.x, Config['delivery'].insideLocation.y, Config['delivery'].insideLocation.z, true) < 15 and not IsPedInAnyVehicle(GetPlayerPed(-1), false) and not onDuty then
            canSleep = false
            DrawMarker(25, Config['delivery'].insideLocation.x, Config['delivery'].insideLocation.y,
                Config['delivery'].insideLocation.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 98, 102, 185, 100, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config['delivery'].insideLocation.x, Config['delivery'].insideLocation.y, Config['delivery'].insideLocation.z, true) < 1.3 then
                DrawText3D(Config['delivery'].insideLocation.x, Config['delivery'].insideLocation.y,
                    Config['delivery'].insideLocation.z + 1, "~g~E~w~ - Sair do armazem")
                if IsControlJustReleased(0, 38) then
                    if onDuty then
                        exports['okokNotify']:Alert("Reciclagem", "Sai de serviço primeiro", 3000, 'error')
                    else
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end
                        SetEntityCoords(GetPlayerPed(-1), Config['delivery'].outsideLocation.x,
                            Config['delivery'].outsideLocation.y, Config['delivery'].outsideLocation.z + 1)
                        DoScreenFadeIn(500)
                    end
                end
            end
        end
        ---- ENTRAR SAIR DE SERVIÇO
        if #(pos - vector3(1049.15, -3100.63, -39.95)) < 15 and not IsPedInAnyVehicle(PlayerPedId(), false) and carryPackage == nil then
            canSleep = false
            DrawMarker(25, 1049.15, -3100.63, -39.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5001, 255, 0, 0, 100, 0, 0, 0, 0)
            if #(pos - vector3(1049.15, -3100.63, -39.95)) < 1.3 then
                if onDuty then
                    DrawText3D(1049.15, -3100.63, -39.95 + 1, "~g~E~w~ - Terminar serviço")
                else
                    DrawText3D(1049.15, -3100.63, -39.95 + 1, "~g~E~w~ -  Começar serviço")
                end
                if IsControlJustReleased(0, 38) then
                    onDuty = not onDuty
                end
            end
        end
        if canSleep then
            Citizen.Wait(2000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        if onDuty then
            if IsEntityDead(playerPed) then
                onDuty = false
                exports['okokNotify']:Alert("Reciclagem", "O teu serviço foi cancelado!", 3000, 'error')
            end
        else
            Citizen.Wait(2000)
        end
        Citizen.Wait(1)
    end
end)

packagePos = nil
Citizen.CreateThread(function()
    for k, pickuploc in pairs(Config['delivery'].pickupLocations) do
        local model = GetHashKey(Config['delivery'].warehouseObjects
            [math.random(1, #Config['delivery'].warehouseObjects)])
        RequestModel(model)
        while not HasModelLoaded(model) do Citizen.Wait(0) end
        local obj = CreateObject(model, pickuploc.x, pickuploc.y, pickuploc.z, false, true, true)
        PlaceObjectOnGroundProperly(obj)
        FreezeEntityPosition(obj, true)
    end
    while true do
        Citizen.Wait(5)
        if onDuty then
            if packagePos ~= nil then
                local pos = GetEntityCoords(PlayerPedId(), true)
                if carryPackage == nil then
                    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, packagePos.x, packagePos.y, packagePos.z, true) < 2.3 then
                        DrawText3D(packagePos.x, packagePos.y, packagePos.z + 1, "~g~E~w~ - Pegar no pacote")
                        if IsControlJustReleased(0, 38) then
                            TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
                            exports["progressbar"]:Progress({
                                name = "recyclejob_progbar1",
                                duration = 5000,
                                label = "A pegar no pacote...",
                                useWhileDead = false,
                                canCancel = false,
                                controlDisables = {
                                    disableMovement = false,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                            }, function(cancelled)
                                if not cancelled then
                                    ClearPedTasksImmediately(GetPlayerPed(-1))
                                    PickupPackage()
                                end
                            end)
                        end
                    else
                        DrawText3D(packagePos.x, packagePos.y, packagePos.z + 1, "Pacote")
                    end
                else
                    if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Config['delivery'].dropLocation.x, Config['delivery'].dropLocation.y, Config['delivery'].dropLocation.z, true) < 2.0 then
                        DrawText3D(Config['delivery'].dropLocation.x, Config['delivery'].dropLocation.y,
                            Config['delivery'].dropLocation.z, "~g~E~w~ - Entregar pacote")
                        if IsControlJustReleased(0, 38) then
                            DropPackage()
                            ScrapAnim()
                            exports["progressbar"]:Progress({
                                name = "recyclejob_progbar2",
                                duration = 5000,
                                label = "Fazendo a entrega...",
                                useWhileDead = false,
                                canCancel = false,
                                controlDisables = {
                                    disableMovement = false,
                                    disableCarMovement = false,
                                    disableMouse = false,
                                    disableCombat = false,
                                },
                            }, function(cancelled)
                                if not cancelled then
                                    StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
                                    Wait(5000)
                                    local table = {
                                        ['item'] = 'scrapmetal',
                                        ['amount'] = 1,
                                        123
                                    }
                                    TriggerServerEvent('recycle:server:getItem', table)
                                    GetRandomPackage()
                                end
                            end)
                        end
                    else
                        DrawText3D(Config['delivery'].dropLocation.x, Config['delivery'].dropLocation.y,
                            Config['delivery'].dropLocation.z, "Entrega")
                    end
                end
            else
                GetRandomPackage()
            end
        else
            Citizen.Wait(2000)
        end
    end
end)

function ScrapAnim()
    local time = 5
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    Citizen.CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Citizen.Wait(1000)
            time = time - 1
            if time <= 0 then
                openingDoor = false
                StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
            end
        end
    end)
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function GetRandomPackage()
    local randSeed = math.random(1, #Config["delivery"].pickupLocations)
    packagePos = {}
    packagePos.x = Config["delivery"].pickupLocations[randSeed].x
    packagePos.y = Config["delivery"].pickupLocations[randSeed].y
    packagePos.z = Config["delivery"].pickupLocations[randSeed].z
end

function PickupPackage()
    local pos = GetEntityCoords(PlayerPedId(), true)
    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 5.0, -1, -1, 50, 0, false, false, false)
    local model = GetHashKey("prop_cs_cardbox_01")
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(0) end
    local object = CreateObject(model, pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(object, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.05, 0.1, -0.3, 300.0, 250.0,
        20.0, true, true, false, true, 1, true)
    carryPackage = object
end

function DropPackage()
    ClearPedTasks(PlayerPedId())
    DetachEntity(carryPackage, true, true)
    DeleteObject(carryPackage)
    carryPackage = nil
end

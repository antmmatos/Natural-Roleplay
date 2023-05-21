function MotelRoomMenu()
    local instance = Cache.Instance
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "manage_room", {
        title = GlobalState[instance.instance] and Strings["unlocked"] or Strings["locked"],
        align = Config.Options.Align,
        elements = {
            {label = Strings["toggle_lock"], value = "toggle_lock"},
            {label = Strings["leave"], value = "exit"},
        }
    }, function(data, menu)
        if data.current.value == "toggle_lock" then
            TriggerServerEvent("loaf_motel:toggle_lock", instance.instance)
        elseif data.current.value == "exit" then
            Cache.InMotel = false
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent("loaf_motel:toggle_weather", function()
    if not Cache.InMotel then 
        return 
    end

    StartAudioScene("MP_LEADERBOARD_SCENE") -- disable ambient sounds CRED: https://github.com/DevTestingPizza/JoinTransition/blob/master/cloading.lua#L19
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")

    local previousWind = GetWindSpeed()
    if GetResourceState("cd_easytime") == "started" then
        TriggerEvent("cd_easytime:PauseSync", true)
        while Cache.InMotel do
            Wait(250)
            SetWindSpeed(0.0)
        end
        SetWindSpeed(previousWind)
        TriggerEvent("cd_easytime:PauseSync", false)
        StopAudioScene("MP_LEADERBOARD_SCENE") -- re-enable ambient sounds
        StopAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
        return
    end

    TriggerEvent("ToggleWeatherSync", false)
    SetRainFxIntensity(0.0)
    while Cache.InMotel do
        Wait(250)
        SetWeather()
    end
    SetWindSpeed(previousWind)
    TriggerEvent("ToggleWeatherSync", true)

    StopAudioScene("MP_LEADERBOARD_SCENE") -- re-enable ambient sounds
    StopAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
end)

RegisterNetEvent("loaf_motel:spawn_motel")
AddEventHandler("loaf_motel:spawn_motel", function(instance)
    ESX.UI.Menu.CloseAll()

    local interior = Shells[instance.interior]
    if not interior then
        return
    end

    --print("loading model")
    local model = lib.LoadModel(interior.Object)
    if not model.success then
        --print("couldnt load model", model.error)
        return
    end
    --print("model loaded; creating motel")

    Cache.InMotel = true
    Cache.Instance = instance

    TriggerEvent("loaf_motel:toggle_weather")

    local shell = CreateObject(model.model, instance.location, false, false, false)
    SetEntityHeading(shell, 0.0)
    FreezeEntityPosition(shell, true)

    local spawnedObjects = {}
    for k, v in pairs(interior.DefaultFurniture) do
        local model = lib.LoadModel(v.object)
        if model.success then
            local object = CreateObject(model.model, instance.location.x + v.offset.x, instance.location.y + v.offset.y, instance.location.z + v.offset.z, false, false, false)
            FreezeEntityPosition(object, true)
            if type(v.offset) == "vector4" then
                SetEntityHeading(object, v.offset.w)
            else
                SetEntityHeading(object, 0.0)
            end
            table.insert(spawnedObjects, object)
        end
    end

    DoScreenFadeOut(750)
    while not IsScreenFadedOut() do 
        Wait(0) 
    end
    
    local doorCoords = GetOffsetFromEntityInWorldCoords(shell, interior.Offsets.Door)
    local storageCoords = GetOffsetFromEntityInWorldCoords(shell, interior.Offsets.Storage)
    local wardrobeCoords = GetOffsetFromEntityInWorldCoords(shell, interior.Offsets.Wardrobe)
    
    Teleport(doorCoords)
    DoScreenFadeIn(1500)
    ClearAreaOfPeds(instance.location.x, instance.location.y, instance.location.z, 100.0, 1)

    local doorMarker = lib.AddMarker({
        coords = doorCoords,
        type = 1,
        callbackData = {},
        alpha = 0,
        key = "primary",
        text = Strings["manage_motel"]
    }, nil, CloseMenu, MotelRoomMenu)
    local storageMarker = lib.AddMarker({
        coords = storageCoords,
        type = 1,
        callbackData = {
            press = instance.instance
        },
        alpha = 0,
        key = "primary",
        text = Strings["open_storage"]
    }, nil, CloseMenu, OpenStorage)
    local wardrobeMarker = lib.AddMarker({
        coords = wardrobeCoords,
        type = 1,
        callbackData = {},
        alpha = 0,
        key = "primary",
        text = Strings["open_wardrobe"]
    }, nil, CloseMenu, Wardrobe)

    --print("entered motel")
    while Cache.InMotel do
        Wait(1500)
        if #(GetEntityCoords(PlayerPedId()) - doorCoords) >= 50.0 then
            SetEntityCoords(PlayerPedId(), doorCoords)
        end
    end

    lib.RemoveMarker(doorMarker)
    lib.RemoveMarker(storageMarker)
    lib.RemoveMarker(wardrobeMarker)
    
    TriggerServerEvent("loaf_motel:leave", instance.instance)

    DoScreenFadeOut(750)
    while not IsScreenFadedOut() do 
        Wait(0) 
    end
    Teleport(Config.Motels[instance.motel].Rooms[instance.room])
    DoScreenFadeIn(1500)

    DeleteEntity(shell)
    for _, obj in pairs(spawnedObjects) do
        DeleteEntity(obj)
    end
end)
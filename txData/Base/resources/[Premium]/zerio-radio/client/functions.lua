Animation = {
    Prop = GetHashKey('prop_cs_hand_radio'),
    Bone = 28422,
    Offset = vector3(0.0, 0.0, 0.0),
    Rotation = vector3(0.0, 0.0, 0.0),
    Dictionary = {
        "cellphone@", "cellphone@in_car@ds", "cellphone@str", "random@arrests"
    },
    Animation = {
        "cellphone_text_in", "cellphone_text_out", "cellphone_call_listen_a",
        "generic_radio_chatter"
    }
}

CreateThread(function()
    function open()
        if ESX ~= nil and isOpen == false then
            isOpen = true
            RequestModel(Animation.Prop)

            while not HasModelLoaded(Animation.Prop) do Wait(150) end

            Handle = CreateObject(Animation.Prop, 0.0, 0.0, 0.0, true, true,
                                  false)

            local bone = GetPedBoneIndex(PlayerPedId(), Animation.Bone)

            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('weapon_unarmed'),
                                true)
            AttachEntityToEntity(Handle, PlayerPedId(), bone,
                                 Animation.Offset.x, Animation.Offset.y,
                                 Animation.Offset.z, Animation.Rotation.x,
                                 Animation.Rotation.y, Animation.Rotation.z,
                                 true, false, false, false, 2, true)

            SetModelAsNoLongerNeeded(Handle)

            startDataLoop()
            if settingsLoaded ~= true then LoadSettings() end
            AddLog("action", "Opened radio")
            SetNuiFocus(true, true)
            SendNUIMessage({
                action = "open",
                data = {
                    ShowPlayerList = Config.ShowPlayerList,
                    DisableAnonymous = Config.DisableAnonymous
                }
            })
        end
    end

    if Config.OpenType == "custom" or Config.OpenType == "item" then
        RegisterNetEvent("zerio-radio:client:open", function() open() end)
        exports("Open", function() open() end)
    end
end)

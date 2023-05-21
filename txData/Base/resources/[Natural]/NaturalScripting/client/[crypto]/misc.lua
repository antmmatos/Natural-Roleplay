function startAnim()
    Citizen.CreateThread(function()
        RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
        while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
            Citizen.Wait(0)
        end
        attachObject()
        TaskPlayAnim(PlayerPedId(), "amb@world_human_seat_wall_tablet@female@base", "base", 1.5, 1.5, -1, 50, 0, false,
            false, false)
    end)
end

function attachObject()
    local ped = PlayerPedId()
    tab = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(tab, ped, GetPedBoneIndex(ped, 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true,
        false, true, 1, true)
end

function stopAnim()
    StopAnimTask(PlayerPedId(), "amb@world_human_seat_wall_tablet@female@base", "base", 1.5, 1.5, -1, 50, 0, false,
        false, false)
    DeleteEntity(tab)
end
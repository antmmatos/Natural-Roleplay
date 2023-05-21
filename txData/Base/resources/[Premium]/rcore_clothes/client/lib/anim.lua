function requestAnimDict(dict)
    RequestAnimDict(dict)
    local breaker = 0
    while not HasAnimDictLoaded(dict) do
        Wait(0)
        breaker = breaker + 1
        if breaker > 1000 then
            dprint("requestAnimDict: " .. dict .. " failed to load")
            break
        end
    end
end

function playAnimRepeat(animDict, animName)
    if not HasAnimDictLoaded(animDict) then
        requestAnimDict(animDict)
    end

    dprint("playAnimRepeat: " .. animDict .. " " .. animName)

    local ped = PlayerPedId()
    TaskPlayAnim(ped, animDict, animName, 8.0, 8.0, -1, 1, 0, false, false, false)
end

function clearPedAnimation()
    ClearPedTasks(PlayerPedId())
end

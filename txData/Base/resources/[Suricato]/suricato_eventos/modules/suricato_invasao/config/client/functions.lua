local base = {}

RegisterNetEvent('invasao:inInvasion', function()
    -- evento de status de invasão
end)

function base.getScaleform()
    PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
    ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0)

    local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

    while not HasScaleformMovieLoaded(scaleform) do
        scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")

        Citizen.Wait(0)
    end

    if HasScaleformMovieLoaded(scaleform) then
        Citizen.Wait(0)

        PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
        BeginTextComponent("STRING")
        AddTextComponentString("~r~você morreu")
        EndTextComponent()
        PopScaleformMovieFunctionVoid()

        Citizen.Wait(500)

        PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
    end

    return scaleform
end

return base 
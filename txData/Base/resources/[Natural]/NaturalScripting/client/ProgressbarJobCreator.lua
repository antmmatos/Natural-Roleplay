RegisterNetEvent("jobs_creator:framework:ready", function()
    exports["jobs_creator"]:disableScriptEvent("jobs_creator:internalProgressBar")
end)

RegisterNetEvent("jobs_creator:internalProgressBar", function(time, text)
    exports["progressbar"]:Progress({
        name = "jobcreator",
        duration = time,
        label = text,
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = false,
        },
    })
end)

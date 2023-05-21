local isOpen = false

local menus = {
    ["police"] = {
        {
            name = "Agarrar",
            icon = "fa-solid fa-link",
            id = "drag",
            close = true
        },
        {
            name = "Colocar no veículo",
            icon = "fa-solid fa-caret-down",
            id = "putinvehicle",
            close = true
        },
        {
            name = "Retirar do veículo",
            icon = "fa-solid fa-caret-up",
            id = "outthevehicle",
            close = true
        },
        {
            name = "MDT",
            icon = "fa-solid fa-tablet",
            id = "mdt",
            close = true
        },
    },
    ["ambulance"] = {
        {
            name = "Reviver pessoa",
            icon = "fa-solid fa-suitcase-medical",
            id = "revive",
            close = true
        },
        {
            name = "Curamento leve",
            icon = "fa-solid fa-bandage",
            id = "healsmall",
            close = true
        },
        {
            name = "Curamento pesado",
            icon = "fa-solid fa-bandage",
            id = "heal",
            close = true
        }
    },
}

local menusFunctions = {
    drag = function()
        TriggerEvent("jobs_creator:actions:drag")
    end,
    putinvehicle = function()
        TriggerEvent("jobs_creator:actions:putInCar")
    end,
    outthevehicle = function()
        TriggerEvent("jobs_creator:actions:takeFromCar")
    end,
    mdt = function()
        TriggerEvent("")
    end,
    revive = function()
        TriggerEvent("jobs_creator:actions:revive")
    end,
    healsmall = function()
        TriggerEvent("jobs_creator:actions:healSmall")
    end,
    heal = function()
        TriggerEvent("jobs_creator:actions:healBig")
    end,
}

RegisterCommand("menu", function()
    if not isOpen and menus[ESX.PlayerData.job.name] then
        isOpen = true
        SendNUIMessage({
            type = "open",
            menu = menus[ESX.PlayerData.job.name],
        })
        SetNuiFocus(true, true)
    end
end)

RegisterKeyMapping("menu", "Abrir Menu", "keyboard", "F3")

RegisterNUICallback("closeMenu", function()
    SendNUIMessage({
        type = "close"
    })
    SetNuiFocus(false, false)
end)

RegisterNUICallback("closedMenu", function()
    isOpen = false
end)

RegisterNUICallback("menuAction", function(data)
    menusFunctions[data.id]()
end)
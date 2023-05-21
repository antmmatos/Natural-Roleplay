Config = {}

Config.getSharedObject = 'esx:getSharedObject' -- Your ESX Framework.
Config.onPlayerSpawn = 'esx:onPlayerSpawn' -- Your ESX Framework.

Config.ResetArmor = 'retirarcolete' -- Command to remove your vest.

Config.Anim = { -- Custom anim
    loadAnimDict = "oddjobs@basejump@ig_15",
    TaskPlayAnim = "puton_parachute"
}

Config.Progressbar = { -- Progressbar Timer.
    UseArmor = 5000,
    UseHeavyArmor = 5000,
    ResetArmor = 2500
}

Config.SetPedArmour = { -- SetPedArmour Quantity.
    UseArmor = 100,
    UseHeavyArmor = 100,
    ResetArmor = 0
}

Config.VestTexture = false -- Use Vest texture?

Config.CheckVest = { -- Check if the person has a vest, if they have a vest but do not have it equipped, they put it on automatically
    check = true, -- True = Yes || False = No
    time = 30000 -- If check = true How often do you check? in milliseconds, If check = false ignore this
}

Config.Vest = {
    male = {
        ['bproof_1'] = 5, ['bproof_2'] = 0,
    },
    female = {
        ['bproof_1'] = 3, ['bproof_2'] = 0,
    },

    maleHeavy = {
        ['bproof_1'] = 5, ['bproof_2'] = 0,
    },

    femaleHeavy = {
        ['bproof_1'] = 3, ['bproof_2'] = 0,
    }
}

function SetVest() -- If VestTexture = true
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, Config.Vest.male)
        elseif skin.sex == 1 then
            TriggerEvent('skinchanger:loadClothes', skin, Config.Vest.female)
        end
    end)
end

function SetHeavyVest() -- If VestTexture = true
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, Config.Vest.maleHeavy)
        elseif skin.sex == 1 then
            TriggerEvent('skinchanger:loadClothes', skin, Config.Vest.femaleHeavy)
        end
    end)
end

function RemoveVest()
    SetPedComponentVariation(PlayerPedId(), 5, 34, 1, 2)
end

function SendTextMessage(msg, type) --You can add your notification system here for simple messages.
    if type == 'inform' then
        QS.Notify(msg, "primary")
        --exports['mythic_notify']:DoHudText('inform', msg)
    end
    if type == 'error' then
        QS.Notify(msg, "error")
        -- exports['mythic_notify']:DoHudText('error', msg)
    end
    if type == 'success' then
        QS.Notify(msg, "success")
        --exports['mythic_notify']:DoHudText('success', msg)
    end
end

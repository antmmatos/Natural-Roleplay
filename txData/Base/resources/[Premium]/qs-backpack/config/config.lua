Config = {}

Config.Framework = 'ESX' -- 'ESX' or 'QBCore'.

Config.Backpack = {
    UseSkin = false,
    DoAnimation = true,
    Progressbar = {
        text = "Abrindo a mochila...",
        time = 2000
    },
    maxweight = 150000,
    slots = 20,
}

function SetBag()
    SetPedComponentVariation(PlayerPedId(), 5, 51, 0, 2)
    --[[ TriggerEvent('skinchanger:getSkin', function(skinData)
        if skinData ~= nil then
            skinData['bags_1'] = 41
            skinData['bags_2'] = 0
            TriggerEvent('skinchanger:loadSkin', skinData)
        end
    end) ]]
end

function RemoveBag()
    SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 2)
    --[[ TriggerEvent('skinchanger:getSkin', function(skinData)
        if skinData ~= nil then
            skinData['bags_1'] = 0
            skinData['bags_2'] = 0
            TriggerEvent('skinchanger:loadSkin', skinData)
        end
    end) ]]
end
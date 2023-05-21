local Weapons = {
    [GetHashKey('weapon_unarmed')] = {model = 'weapon_unarmed', modifier = 0.3},
}

CreateThread(function()
    local playerPed
    local weaponsConfig
    while true do
        playerPed = PlayerPedId()
        weaponsConfig = Weapons[GetSelectedPedWeapon(playerPed)]
        if weaponsConfig then
            SetWeaponDamageModifier(GetHashKey(weaponsConfig.model), weaponsConfig.modifier)
        else
            Wait(1000)
        end
        Wait(5)
    end
end)

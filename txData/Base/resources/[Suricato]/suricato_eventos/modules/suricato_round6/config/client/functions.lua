local base = {}

local Proxy = _G['lib/Proxy'..".lua"]()
local vRP = Proxy.getInterface('vRP')

function base.killGod()
    return vRP.killGod()
end

function giveWeaponToPed(ped, weaponHash, ammoCount, isHidden, equipNow, weaponName) -- Alguns anticheats pedem para mudar essa função, altere conforme a necessidade (O último parâmetro é o nome da arma, caso necessário)
    GiveWeaponToPed(ped, weaponHash, ammoCount, isHidden, equipNow)
    -- Caso use MQCU use o abaixo e comente acima:
    -- vRP.giveWeapons({[weaponName] = { ammo = ammoCount }})
end

return base
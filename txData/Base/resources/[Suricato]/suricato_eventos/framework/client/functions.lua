local base = {}

function base.setInvincible(ped, toogle)
    SetEntityInvincible(ped, toogle)
end

function base.setHealth(ped, amount)
    SetEntityHealth(ped, amount)
end

function base.setArmour(ped, amount) 
    SetPedArmour(ped, amount)
end

function base.setCoords(ped, vector) 
    SetEntityCoords(ped, vector.x, vector.y, vector.z)
end

function base.setHeading(ped, heading) 
    SetEntityHeading(ped, heading)
end

function base.setVisible(ped, toggle) 
    SetEntityVisible(ped, toggle)
end

function base.getPlayerLabel(source) -- string retornada que irá aparecer como nome do player quando espectado
    local player = GetPlayerFromServerId(source)
    local name = 'ANÔNIMO'
    if player >= 0 then
        name = GetPlayerName(player)
    end
    return '('..source..') '..tostring(name)
end

function giveWeaponToPed(ped, weaponHash, ammoCount, isHidden, equipNow, weaponName) -- Alguns anticheats pedem para mudar essa função, altere conforme a necessidade (O último parâmetro é o nome da arma, caso necessário)
    GiveWeaponToPed(ped, weaponHash, ammoCount, isHidden, equipNow)
end

return base 
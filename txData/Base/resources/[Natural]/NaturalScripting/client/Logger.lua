local armas = {
    [tostring(GetHashKey('WEAPON_UNARMED'))] = 'Unarmed',
    [tostring(GetHashKey('GADGET_PARACHUTE'))] = 'Parachute',
    [tostring(GetHashKey('WEAPON_KNIFE'))] = 'Knife',
    [tostring(GetHashKey('WEAPON_NIGHTSTICK'))] = 'Nightstick',
    [tostring(GetHashKey('WEAPON_HAMMER'))] = 'Hammer',
    [tostring(GetHashKey('WEAPON_BAT'))] = 'Baseball Bat',
    [tostring(GetHashKey('WEAPON_CROWBAR'))] = 'Crowbar',
    [tostring(GetHashKey('WEAPON_GOLFCLUB'))] = 'Golf Club',
    [tostring(GetHashKey('WEAPON_BOTTLE'))] = 'Bottle',
    [tostring(GetHashKey('WEAPON_DAGGER'))] = 'Antique Cavalry Dagger',
    [tostring(GetHashKey('WEAPON_HATCHET'))] = 'Hatchet',
    [tostring(GetHashKey('WEAPON_KNUCKLE'))] = 'Knuckle Duster',
    [tostring(GetHashKey('WEAPON_MACHETE'))] = 'Machete',
    [tostring(GetHashKey('WEAPON_FLASHLIGHT'))] = 'Flashlight',
    [tostring(GetHashKey('WEAPON_SWITCHBLADE'))] = 'Switchblade',
    [tostring(GetHashKey('WEAPON_BATTLEAXE'))] = 'Battleaxe',
    [tostring(GetHashKey('WEAPON_POOLCUE'))] = 'Poolcue',
    [tostring(GetHashKey('WEAPON_PIPEWRENCH'))] = 'Wrench',
    [tostring(GetHashKey('WEAPON_STONE_HATCHET'))] = 'Stone Hatchet',
    [tostring(GetHashKey('WEAPON_PISTOL'))] = 'Pistol',
    [tostring(GetHashKey('WEAPON_PISTOL_MK2'))] = 'Pistol Mk2',
    [tostring(GetHashKey('WEAPON_COMBATPISTOL'))] = 'Combat Pistol',
    [tostring(GetHashKey('WEAPON_PISTOL50'))] = 'Pistol .50	',
    [tostring(GetHashKey('WEAPON_SNSPISTOL'))] = 'SNS Pistol',
    [tostring(GetHashKey('WEAPON_SNSPISTOL_MK2'))] = 'SNS Pistol Mk2',
    [tostring(GetHashKey('WEAPON_HEAVYPISTOL'))] = 'Heavy Pistol',
    [tostring(GetHashKey('WEAPON_VINTAGEPISTOL'))] = 'Vintage Pistol',
    [tostring(GetHashKey('WEAPON_MARKSMANPISTOL'))] = 'Marksman Pistol',
    [tostring(GetHashKey('WEAPON_REVOLVER'))] = 'Heavy Revolver',
    [tostring(GetHashKey('WEAPON_REVOLVER_MK2'))] = 'Heavy Revolver Mk2',
    [tostring(GetHashKey('WEAPON_DOUBLEACTION'))] = 'Double-Action Revolver',
    [tostring(GetHashKey('WEAPON_APPISTOL'))] = 'AP Pistol',
    [tostring(GetHashKey('WEAPON_STUNGUN'))] = 'Stun Gun',
    [tostring(GetHashKey('WEAPON_FLAREGUN'))] = 'Flare Gun',
    [tostring(GetHashKey('WEAPON_RAYPISTOL'))] = 'Up-n-Atomizer',
    [tostring(GetHashKey('WEAPON_MICROSMG'))] = 'Micro SMG',
    [tostring(GetHashKey('WEAPON_MACHINEPISTOL'))] = 'Machine Pistol',
    [tostring(GetHashKey('WEAPON_MINISMG'))] = 'Mini SMG',
    [tostring(GetHashKey('WEAPON_SMG'))] = 'SMG',
    [tostring(GetHashKey('WEAPON_SMG_MK2'))] = 'SMG Mk2	',
    [tostring(GetHashKey('WEAPON_ASSAULTSMG'))] = 'Assault SMG',
    [tostring(GetHashKey('WEAPON_COMBATPDW'))] = 'Combat PDW',
    [tostring(GetHashKey('WEAPON_MG'))] = 'MG',
    [tostring(GetHashKey('WEAPON_COMBATMG'))] = 'Combat MG	',
    [tostring(GetHashKey('WEAPON_COMBATMG_MK2'))] = 'Combat MG Mk2',
    [tostring(GetHashKey('WEAPON_GUSENBERG'))] = 'Gusenberg Sweeper',
    [tostring(GetHashKey('WEAPON_RAYCARBINE'))] = 'Unholy Deathbringer',
    [tostring(GetHashKey('WEAPON_ASSAULTRIFLE'))] = 'Assault Rifle',
    [tostring(GetHashKey('WEAPON_ASSAULTRIFLE_MK2'))] = 'Assault Rifle Mk2',
    [tostring(GetHashKey('WEAPON_CARBINERIFLE'))] = 'Carbine Rifle',
    [tostring(GetHashKey('WEAPON_CARBINERIFLE_MK2'))] = 'Carbine Rifle Mk2',
    [tostring(GetHashKey('WEAPON_ADVANCEDRIFLE'))] = 'Advanced Rifle',
    [tostring(GetHashKey('WEAPON_SPECIALCARBINE'))] = 'Special Carbine',
    [tostring(GetHashKey('WEAPON_SPECIALCARBINE_MK2'))] = 'Special Carbine Mk2',
    [tostring(GetHashKey('WEAPON_BULLPUPRIFLE'))] = 'Bullpup Rifle',
    [tostring(GetHashKey('WEAPON_BULLPUPRIFLE_MK2'))] = 'Bullpup Rifle Mk2',
    [tostring(GetHashKey('WEAPON_COMPACTRIFLE'))] = 'Compact Rifle',
    [tostring(GetHashKey('WEAPON_SNIPERRIFLE'))] = 'Sniper Rifle',
    [tostring(GetHashKey('WEAPON_HEAVYSNIPER'))] = 'Heavy Sniper',
    [tostring(GetHashKey('WEAPON_HEAVYSNIPER_MK2'))] = 'Heavy Sniper Mk2',
    [tostring(GetHashKey('WEAPON_MARKSMANRIFLE'))] = 'Marksman Rifle',
    [tostring(GetHashKey('WEAPON_MARKSMANRIFLE_MK2'))] = 'Marksman Rifle Mk2',
    [tostring(GetHashKey('WEAPON_GRENADE'))] = 'Grenade',
    [tostring(GetHashKey('WEAPON_STICKYBOMB'))] = 'Sticky Bomb',
    [tostring(GetHashKey('WEAPON_PROXMINE'))] = 'Proximity Mine',
    [tostring(GetHashKey('WEAPON_PIPEBOMB'))] = 'Pipe Bomb',
    [tostring(GetHashKey('WEAPON_SMOKEGRENADE'))] = 'Tear Gas',
    [tostring(GetHashKey('WEAPON_BZGAS'))] = 'BZ Gas',
    [tostring(GetHashKey('WEAPON_MOLOTOV'))] = 'Molotov',
    [tostring(GetHashKey('WEAPON_FIREEXTINGUISHER'))] = 'Fire Extinguisher',
    [tostring(GetHashKey('WEAPON_PETROLCAN'))] = 'Jerry Can',
    [tostring(GetHashKey('WEAPON_BALL'))] = 'Ball',
    [tostring(GetHashKey('WEAPON_SNOWBALL'))] = 'Snowball',
    [tostring(GetHashKey('WEAPON_FLARE'))] = 'Flare',
    [tostring(GetHashKey('WEAPON_GRENADELAUNCHER'))] = 'Grenade Launcher',
    [tostring(GetHashKey('WEAPON_RPG'))] = 'RPG',
    [tostring(GetHashKey('WEAPON_MINIGUN'))] = 'Minigun',
    [tostring(GetHashKey('WEAPON_FIREWORK'))] = 'Firework Launcher',
    [tostring(GetHashKey('WEAPON_RAILGUN'))] = 'Railgun',
    [tostring(GetHashKey('WEAPON_HOMINGLAUNCHER'))] = 'Homing Launcher',
    [tostring(GetHashKey('WEAPON_COMPACTLAUNCHER'))] = 'Compact Grenade Launcher',
    [tostring(GetHashKey('WEAPON_RAYMINIGUN'))] = 'Widowmaker',
    [tostring(GetHashKey('WEAPON_PUMPSHOTGUN'))] = 'Pump Shotgun',
    [tostring(GetHashKey('WEAPON_PUMPSHOTGUN_MK2'))] = 'Pump Shotgun Mk2',
    [tostring(GetHashKey('WEAPON_SAWNOFFSHOTGUN'))] = 'Sawed-off Shotgun',
    [tostring(GetHashKey('WEAPON_BULLPUPSHOTGUN'))] = 'Bullpup Shotgun',
    [tostring(GetHashKey('WEAPON_ASSAULTSHOTGUN'))] = 'Assault Shotgun',
    [tostring(GetHashKey('WEAPON_MUSKET'))] = 'Musket',
    [tostring(GetHashKey('WEAPON_HEAVYSHOTGUN'))] = 'Heavy Shotgun',
    [tostring(GetHashKey('WEAPON_DBSHOTGUN'))] = 'Double Barrel Shotgun',
    [tostring(GetHashKey('WEAPON_AUTOSHOTGUN'))] = 'Sweeper Shotgun',
    [tostring(GetHashKey('WEAPON_REMOTESNIPER'))] = 'Remote Sniper',
    [tostring(GetHashKey('WEAPON_GRENADELAUNCHER_SMOKE'))] = 'Smoke Grenade Launcher',
    [tostring(GetHashKey('WEAPON_PASSENGER_ROCKET'))] = 'Passenger Rocket',
    [tostring(GetHashKey('WEAPON_AIRSTRIKE_ROCKET'))] = 'Airstrike Rocket',
    [tostring(GetHashKey('VEHICLE_WEAPON_SPACE_ROCKET'))] = 'Orbital Canon',
    [tostring(GetHashKey('VEHICLE_WEAPON_PLANE_ROCKET'))] = 'Plane Rocket',
    [tostring(GetHashKey('WEAPON_STINGER'))] = 'Stinger [Vehicle]',
    [tostring(GetHashKey('VEHICLE_WEAPON_TANK'))] = 'Tank Cannon',
    [tostring(GetHashKey('VEHICLE_WEAPON_SPACE_ROCKET'))] = 'Rockets',
    [tostring(GetHashKey('VEHICLE_WEAPON_PLAYER_LASER'))] = 'Laser',
    [tostring(GetHashKey('VEHICLE_WEAPON_PLAYER_LAZER'))] = 'Lazer',
    [tostring(GetHashKey('VEHICLE_WEAPON_PLAYER_BUZZARD'))] = 'Buzzard',
    [tostring(GetHashKey('VEHICLE_WEAPON_PLAYER_HUNTER'))] = 'Hunter',
    [tostring(GetHashKey('VEHICLE_WEAPON_WATER_CANNON'))] = 'Water Cannon',
    [tostring(GetHashKey('AMMO_RPG'))] = 'Rocket',
    [tostring(GetHashKey('AMMO_TANK'))] = 'Tank',
    [tostring(GetHashKey('AMMO_SPACE_ROCKET'))] = 'Rocket',
    [tostring(GetHashKey('AMMO_PLAYER_LASER'))] = 'Laser',
    [tostring(GetHashKey('AMMO_ENEMY_LASER'))] = 'Laser',
    [tostring(GetHashKey('WEAPON_RAMMED_BY_CAR'))] = 'Rammed by Car',
    [tostring(GetHashKey('WEAPON_FIRE'))] = 'Fire',
    [tostring(GetHashKey('WEAPON_HELI_CRASH'))] = 'Heli Crash',
    [tostring(GetHashKey('WEAPON_RUN_OVER_BY_CAR'))] = 'Run over by Car',
    [tostring(GetHashKey('WEAPON_HIT_BY_WATER_CANNON'))] = 'Hit by Water Cannon',
    [tostring(GetHashKey('WEAPON_EXHAUSTION'))] = 'Exhaustion',
    [tostring(GetHashKey('WEAPON_EXPLOSION'))] = 'Explosion',
    [tostring(GetHashKey('WEAPON_ELECTRIC_FENCE'))] = 'Electric Fence',
    [tostring(GetHashKey('WEAPON_BLEEDING'))] = 'Bleeding',
    [tostring(GetHashKey('WEAPON_DROWNING_IN_VEHICLE'))] = 'Drowning in Vehicle',
    [tostring(GetHashKey('WEAPON_DROWNING'))] = 'Drowning',
    [tostring(GetHashKey('WEAPON_BARBED_WIRE'))] = 'Barbed Wire',
    [tostring(GetHashKey('WEAPON_VEHICLE_ROCKET'))] = 'Vehicle Rocket',
    [tostring(GetHashKey('VEHICLE_WEAPON_ROTORS'))] = 'Rotors',
    [tostring(GetHashKey('WEAPON_AIR_DEFENCE_GUN'))] = 'Air Defence Gun',
    [tostring(GetHashKey('WEAPON_ANIMAL'))] = 'Animal',
    [tostring(GetHashKey('WEAPON_COUGAR'))] = 'Animal',
}

local deathCauses = {
    [GetHashKey('WEAPON_UNARMED')] = { 'Beaten', 'Unarmed' },
    [GetHashKey('WEAPON_CROWBAR')] = { 'Beaten', 'Crowbar' },
    [GetHashKey('WEAPON_BAT')] = { 'Beaten', 'Bat' },
    [GetHashKey('WEAPON_GOLFCLUB')] = { 'Beaten', 'Golfclub' },
    [GetHashKey('WEAPON_HAMMER')] = { 'Beaten', 'Hammer' },
    [GetHashKey('WEAPON_NIGHTSTICK')] = { 'Beaten', 'Nightstick' },
    [GetHashKey('WEAPON_MOLOTOV')] = { 'Torched', 'Molotov' },
    [GetHashKey('WEAPON_FLAREGUN')] = { 'Torched', 'Flaregun' },
    [GetHashKey('WEAPON_DAGGER')] = { 'Stabbed', 'Dagger' },
    [GetHashKey('WEAPON_KNIFE')] = { 'Stabbed', 'Knife' },
    [GetHashKey('WEAPON_SWITCHBLADE')] = { 'Stabbed', 'Switchblade' },
    [GetHashKey('WEAPON_HATCHET')] = { 'Stabbed', 'Hatchet' },
    [GetHashKey('WEAPON_BOTTLE')] = { 'Stabbed', 'Bottle' },
    [GetHashKey('WEAPON_SNSPISTOL')] = { 'Pistolled', 'SNS Pistol' },
    [GetHashKey('WEAPON_HEAVYPISTOL')] = { 'Pistolled', 'Heavy Pistol' },
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = { 'Pistolled', 'Vintage Pistol' },
    [GetHashKey('WEAPON_PISTOL')] = { 'Pistolled', 'Postol' },
    [GetHashKey('WEAPON_APPISTOL')] = { 'Pistolled', 'AP Pistol' },
    [GetHashKey('WEAPON_COMBATPISTOL')] = { 'Pistolled', 'Combat Pistol' },
    [GetHashKey('WEAPON_MICROSMG')] = { 'Riddled', 'Micro SMG' },
    [GetHashKey('WEAPON_SMG')] = { 'Riddled', 'SMG' },
    [GetHashKey('WEAPON_CARBINERIFLE')] = { 'Rifled', 'Carbine Rifle' },
    [GetHashKey('WEAPON_MUSKET')] = { 'Rifled', 'Musket' },
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = { 'Rifled', 'Advanced Rifle' },
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = { 'Rifled', 'Assult Rifle' },
    [GetHashKey('WEAPON_SPECIALCARBINE')] = { 'Rifled', 'Special Carbine' },
    [GetHashKey('WEAPON_COMPACTRIFLE')] = { 'Rifled', 'Compact Rifle' },
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = { 'Rifled', 'Bullpup Rifle' },
    [GetHashKey('WEAPON_MG')] = { 'Machine Gunned', 'MG' },
    [GetHashKey('WEAPON_COMBATMG')] = { 'Machine Gunned', 'Combat MG' },
    [GetHashKey('WEAPON_BULLPUPSHOTGUN')] = { 'Pulverized', 'Bullpup Shotgun' },
    [GetHashKey('WEAPON_ASSAULTSHOTGUN')] = { 'Pulverized', 'Assult Shotgun' },
    [GetHashKey('WEAPON_DBSHOTGUN')] = { 'Pulverized', 'Double Barrel Shotgun' },
    [GetHashKey('WEAPON_PUMPSHOTGUN')] = { 'Pulverized', 'Pump Shotgun' },
    [GetHashKey('WEAPON_HEAVYSHOTGUN')] = { 'Pulverized', 'Heavy Shotgun' },
    [GetHashKey('WEAPON_SAWNOFFSHOTGUN')] = { 'Pulverized', 'Sawnoff Shotgun' },
    [GetHashKey('WEAPON_MARKSMANRIFLE')] = { 'Sniped', 'Marksman Rifle' },
    [GetHashKey('WEAPON_SNIPERRIFLE')] = { 'Sniped', 'Sniper Rifle' },
    [GetHashKey('WEAPON_HEAVYSNIPER')] = { 'Sniped', 'Heavy Sniper' },
    [GetHashKey('WEAPON_ASSAULTSNIPER')] = { 'Sniped', 'Assult Sniper' },
    [GetHashKey('WEAPON_REMOTESNIPER')] = { 'Sniped', 'Remote Sniper' },
    [GetHashKey('WEAPON_GRENADELAUNCHER')] = { 'Obliterated', 'Grenate Launcher' },
    [GetHashKey('WEAPON_RPG')] = { 'Obliterated', 'RPG' },
    [GetHashKey('WEAPON_HOMINGLAUNCHER')] = { 'Obliterated', 'Homming Launcher' },
    [GetHashKey('WEAPON_FIREWORK')] = { 'Obliterated', 'Firework Launcher' },
    [GetHashKey('VEHICLE_WEAPON_TANK')] = { 'Obliterated', 'Tank Shell' },
    [GetHashKey('WEAPON_MINIGUN')] = { 'Shredded', 'Minigun' },
    [GetHashKey('WEAPON_GRENADE')] = { 'Bombed', 'Grenade' },
    [GetHashKey('WEAPON_PROXMINE')] = { 'Bombed', 'Proximity Mine' },
    [GetHashKey('WEAPON_EXPLOSION')] = { 'Bombed', 'Explosion' },
    [GetHashKey('WEAPON_STICKYBOMB')] = { 'Bombed', 'Sticky Bomb' },
    [GetHashKey('WEAPON_PIPEBOMB')] = { 'Bombed', 'Pipe Bomb' },
    [GetHashKey('VEHICLE_WEAPON_ROTORS')] = { 'Mowed Over', 'Helicopter Rotors' },
    [GetHashKey('WEAPON_RUN_OVER_BY_CAR')] = { 'Flattened', 'Vehicle' },
    [GetHashKey('WEAPON_RAMMED_BY_CAR')] = { 'Flattened', 'Vehicle' },
    [-842959696] = { 'Fell from a high place', nil }
}

local WeaponsNotLogged = {
    "WEAPON_SNOWBALL",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_PETROLCAN"
}

CreateThread(function()
    local fireWeapon = nil
    local timeout = 0
    local fireCount = 0
    local playerped
    while true do
        Wait(1)
        playerped = PlayerPedId()
        if IsPedArmed(playerped, 6) then
            if IsPedShooting(playerped) then
                fireWeapon = GetSelectedPedWeapon(playerped)
                fireCount = fireCount + 1
                timeout = 1000
            elseif not IsPedShooting(playerped) and fireCount ~= 0 and timeout ~= 0 then
                if timeout ~= 0 then
                    timeout = timeout - 1
                end
                if fireWeapon ~= GetSelectedPedWeapon(playerped) then
                    timeout = 0
                end
                if fireCount ~= 0 and timeout == 0 then
                    if not armas[tostring(fireWeapon)] then
                        TriggerServerEvent('Natural:Server:Logger:Tiros', 'Não encontrada', fireCount)
                        return
                    end

                    isLoggedWeapon = true
                    for k, v in pairs(WeaponsNotLogged) do
                        if GetSelectedPedWeapon(playerped) == GetHashKey(v) then
                            isLoggedWeapon = false
                        end
                    end
                    if isLoggedWeapon then
                        TriggerServerEvent('Natural:Server:Logger:Tiros', armas[tostring(fireWeapon)],
                            fireCount)
                    end
                    fireCount = 0
                end
            end
        else
            Wait(1000)
        end
    end
end)

CreateThread(function()
    local hasRun = false
    while true do
        Wait(500)
        local iPed = PlayerPedId()
        if IsEntityDead(iPed) then
            if not hasRun then
                hasRun = true
                local kPed = GetPedSourceOfDeath(iPed)
                local cause = GetPedCauseOfDeath(iPed)
                local DeathCause = deathCauses[cause]
                local killer = 0
                local kPlayer = NetworkGetPlayerIndexFromPed(kPed)
                Wait(1000)
                if kPlayer == PlayerId() then
                    if DeathCause ~= nil then
                        if DeathCause[2] ~= nil then
                            DeathReason = '**' ..
                                GetPlayerName(PlayerId()) ..
                                '** `committed suicide` (*' .. DeathCause[1] .. '* - *' .. DeathCause[2] .. '*)'
                        else
                            DeathReason = '**' ..
                                GetPlayerName(PlayerId()) .. '** `committed suicide` (*' .. DeathCause[1] .. '*)'
                        end
                    else
                        DeathReason = '**' .. GetPlayerName(PlayerId()) .. '** `committed suicide`'
                    end
                elseif kPlayer == nil or kPlayer == -1 then
                    if kPed == 0 then
                        if DeathCause ~= nil then
                            if DeathCause[2] ~= nil then
                                DeathReason = '**' ..
                                    GetPlayerName(PlayerId()) ..
                                    '** `committed suicide` (*' .. DeathCause[1] .. '* - *' .. DeathCause[2] .. '*)'
                            else
                                DeathReason = '**' ..
                                    GetPlayerName(PlayerId()) .. '** `committed suicide` (*' .. DeathCause[1] .. '*)'
                            end
                        else
                            DeathReason = '**' .. GetPlayerName(PlayerId()) .. '** `committed suicide`'
                        end
                    else
                        if IsEntityAPed(kPed) then
                            if DeathCause ~= nil then
                                if DeathCause[2] ~= nil then
                                    DeathReason = '**' ..
                                        GetPlayerName(PlayerId()) ..
                                        '** has been `' .. DeathCause[1] .. '` (*' .. DeathCause[2] .. '*) by **AI**'
                                else
                                    DeathReason = '**' ..
                                        GetPlayerName(PlayerId()) .. '** has been `' .. DeathCause[1] .. '` by **AI**'
                                end
                            else
                                DeathReason = '**' .. GetPlayerName(PlayerId()) .. '** has been `Killed` by **AI**'
                            end
                        else
                            if IsEntityAVehicle(kPed) then
                                if IsEntityAPed(GetPedInVehicleSeat(kPed, -1)) then
                                    if IsPedAPlayer(GetPedInVehicleSeat(kPed, -1)) then
                                        killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(kPed, -1))
                                        if DeathCause ~= nil then
                                            if DeathCause[2] ~= nil then
                                                DeathReason = '**' ..
                                                    GetPlayerName(PlayerId()) ..
                                                    '** has been `' ..
                                                    DeathCause[1] ..
                                                    '` (*' ..
                                                    DeathCause[2] .. '*) by **' .. GetPlayerName(killer) .. '**'
                                            else
                                                DeathReason = '**' ..
                                                    GetPlayerName(PlayerId()) ..
                                                    '** has been `' .. DeathCause[1] ..
                                                    '` by **' .. GetPlayerName(killer) .. '**'
                                            end
                                        else
                                            DeathReason = '**' ..
                                                GetPlayerName(PlayerId()) ..
                                                '** has been `Killed` by **' .. GetPlayerName(killer) .. '**'
                                        end
                                    else
                                        if DeathCause ~= nil then
                                            if DeathCause[2] ~= nil then
                                                DeathReason = '**' ..
                                                    GetPlayerName(PlayerId()) ..
                                                    '** has been `' .. DeathCause[1] .. '` (*' ..
                                                    DeathCause[2] .. '*) by **AI**'
                                            else
                                                DeathReason = '**' ..
                                                    GetPlayerName(PlayerId()) ..
                                                    '** has been `' .. DeathCause[1] .. '` by **AI**'
                                            end
                                        else
                                            DeathReason = '**' ..
                                                GetPlayerName(PlayerId()) .. '** has been `Killed` by **AI**'
                                        end
                                    end
                                else
                                    if DeathCause ~= nil then
                                        if DeathCause[2] ~= nil then
                                            DeathReason = '**' ..
                                                GetPlayerName(PlayerId()) ..
                                                '** has been `' .. DeathCause[1] ..
                                                '` (*' .. DeathCause[2] .. '*) by **Unknown**'
                                        else
                                            DeathReason = '**' ..
                                                GetPlayerName(PlayerId()) ..
                                                '** has been `' .. DeathCause[1] .. '` by **Unknown**'
                                        end
                                    else
                                        DeathReason = '**' ..
                                            GetPlayerName(PlayerId()) .. '** has been `Killed` by **Unknown**'
                                    end
                                end
                            end
                        end
                    end
                else
                    killer = NetworkGetPlayerIndexFromPed(kPed)
                    if DeathCause ~= nil then
                        if DeathCause[2] ~= nil then
                            DeathReason = '**' ..
                                GetPlayerName(PlayerId()) ..
                                '** has been `' ..
                                DeathCause[1] .. '` (*' .. DeathCause[2] .. '*) by **' .. GetPlayerName(killer) .. '**'
                        else
                            DeathReason = '**' ..
                                GetPlayerName(PlayerId()) ..
                                '** has been `' .. DeathCause[1] .. '` by **' .. GetPlayerName(killer) .. '**'
                        end
                    else
                        DeathReason = '**' ..
                            GetPlayerName(PlayerId()) .. '** has been `Killed` by **' .. GetPlayerName(killer) .. '**'
                    end
                end
                TriggerServerEvent('Natural:Server:Logger:Morte', DeathReason, GetPlayerServerId(killer))
            end
        else
            Wait(200)
            hasRun = false
        end
    end
end)

CreateThread(function()
    local health = nil
    while true do
        Wait(0)
        if health == nil then health = GetEntityHealth(PlayerPedId()) end
        if health < GetEntityHealth(PlayerPedId()) then health = GetEntityHealth(PlayerPedId()) end
        if health > GetEntityHealth(PlayerPedId()) then
            newHealth = GetEntityHealth(PlayerPedId())
            TriggerServerEvent('Natural:Server:Logger:Damage', math.floor((health - newHealth) / 2))
            health = newHealth
            Wait(500)
        else
            Wait(1000)
        end
    end
end)

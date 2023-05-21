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
    [tostring(GetHashKey('WEAPON_FALL'))] = 'Fall',
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

function LogToDiscord(source, webhook, title, reason)
    local playerName = GetPlayerName(source)
    local playerHWID = GetPlayerToken(source, 0)
    local identifiers = ExtractIdentifiers(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not playerHWID then return end
    local embed = {
        {
            footer = {
                text = "Infinity Roleplay Logs | " .. os.date("%Y/%m/%d | %X") .. "",
            },
            title = "Infinity Roleplay Logs - " .. title,
            description =
                "**Nome:** " ..
                playerName ..
                "\n**HWID:** " ..
                playerHWID ..
                "\n**Steam Hex:** " ..
                identifiers.steam ..
                "\n**Discord ID:** " ..
                identifiers.discordid ..
                "\n**Discord Name:** " ..
                identifiers.discord ..
                "\n**License:** " ..
                identifiers.license ..
                "\n**License2:** " ..
                identifiers.license2 ..
                "\n**Live:** " ..
                identifiers.live ..
                "\n**Xbox:** " ..
                identifiers.xbl ..
                "\n**FiveM:** " ..
                identifiers.fivem ..
                "\n**IP:** " ..
                identifiers.ip,
            color = 524543
        }
    }
    if xPlayer then
        embed[1].description = embed[1].description .. "\n\n```Dados ESX```\n" ..
            "\n**ESX Name:** " ..
            xPlayer.getName() ..
            "\n**ESX Group:** " ..
            xPlayer.getGroup() ..
            "\n**ESX Job:** " ..
            xPlayer.getJob().label .. " - " .. xPlayer.getJob().grade_label ..
            "\n**ESX Money:** " ..
            xPlayer.getAccount("money").money ..
            "\n**ESX Bank:** " ..
            xPlayer.getAccount("bank").money
    end
    if reason then
        embed[1].description = embed[1].description .. "\n" .. reason
    end
    PerformHttpRequest(webhook, function(ERROR, DATA, RESULT)
    end, "POST", json.encode({
        embeds = embed,
        username = "Natural Roleplay Logs - " .. title,
        avatar_url = "https://i.imgur.com/fdr0kqx.png"
    }), {
        ["Content-Type"] = "application/json"
    })
end

AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    local source = source
    LogToDiscord(source,
        "https://discord.com/api/webhooks/1107310932788531220/hC1ZTsuS2MeHdk0co-K38hts-Z7iNNG7Wvl0QjrqXk5XDLHAd6pWhCGxU5m00oDrw9GF"
        , "Entrada", false)
    local identifiers = ExtractIdentifiers(source)
    local oldName = GetResourceKvpString("Logger:nameChanger:" .. identifiers.license)
    if oldName == nil then
        SetResourceKvp("Logger:nameChanger:" .. identifiers.license, GetPlayerName(source))
    else
        if oldName ~= GetPlayerName(source) then
            local log = "**Info:** " .. oldName .. " mudou o nome para " .. GetPlayerName(source)
            LogToDiscord(source,
                "https://discord.com/api/webhooks/1107311028687077456/MC4qbaTrT7WW6UkopMLQQh_oHA-d3bYHrVUrCV-rKOuHpROMEVrqYYHIbgAL9HGST_WX"
                , "Troca de Nome", log)
            SetResourceKvp("Logger:nameChanger:" .. identifiers.license, GetPlayerName(source))
        end
    end
end)

AddEventHandler("playerDropped", function(reason)
    LogToDiscord(source,
        "https://discord.com/api/webhooks/1107311096756453396/6atPRtsDWQDRM-7s6YLvDXWCq38Ik99ScZxI-vUy1935_6SUb23MG3kXwix7QYPmvnSe"
        , "Saída (" .. reason or "" .. ")", false)
end)

RegisterServerEvent('Natural:Server:Logger:Morte')
AddEventHandler('Natural:Server:Logger:Morte', function(Reason, IDKiller)
    local log
    local _source = source
    local pedCoords = GetEntityCoords(GetPlayerPed(_source))
    if IDKiller == 0 then
        log = "**Info:** " ..
            Reason or "Unknown" ..
            "**Coordenadas:** " ..
            pedCoords.x ..
            ", " ..
            pedCoords.y ..
            ", " ..
            pedCoords.z
    else
        local killerHWID = GetPlayerToken(IDKiller, 1)
        local killerIdentifiers = ExtractIdentifiers(IDKiller)
        local killerPed = GetPlayerPed(IDKiller)
        local killerCoords = GetEntityCoords(killerPed)
        local distance = #(pedCoords - killerCoords)
        log = "**Info:**" ..
            Reason or "Unknown" ..
            " (" .. distance .. "m)\n**Coordenadas:** " ..
            pedCoords.x ..
            ", " ..
            pedCoords.y ..
            ", " ..
            pedCoords.z .. "\n\n```Assassino```" ..
            "\n\n**Nome:** " ..
            GetPlayerName(IDKiller) ..
            "\n**ID do Assassino:** " ..
            IDKiller ..
            "\n**HWID:** " ..
            killerHWID ..
            "\n**Steam Hex:** " ..
            killerIdentifiers.steam ..
            "\n**Discord ID:** " ..
            killerIdentifiers.discordid ..
            "\n**Discord Name:** " ..
            killerIdentifiers.discord ..
            "\n**License:** " ..
            killerIdentifiers.license ..
            "\n**License2:** " ..
            killerIdentifiers.license2 ..
            "\n**Live:** " ..
            killerIdentifiers.live ..
            "\n**Xbox:** " ..
            killerIdentifiers.xbl ..
            "\n**FiveM:** " ..
            killerIdentifiers.fivem .. "\n**IP:** " .. killerIdentifiers.ip
    end
    LogToDiscord(source,
        "https://discord.com/api/webhooks/1107311179052896378/ekHQSrsGvDGVQXxYW0nGuTWcqwj9oZ_taHZhfmo3AfsuyyArEV7mI6t-kVomhhLeG7Z7"
        , "Morte", log)
end)

RegisterServerEvent("Natural:Server:Logger:Damage")
AddEventHandler("Natural:Server:Logger:Damage", function()
    local iPed = GetPlayerPed(source)
    local cause = GetPedSourceOfDamage(iPed)
    local dType = GetEntityType(cause)
    local damageCause
    if dType == 0 then
        damageCause = 'próprios'
    elseif dType == 1 then
        if IsPedAPlayer(cause) then
            if GetVehiclePedIsIn(cause, false) ~= 0 then
                damageCause = GetPlayerName(getPlayerId(cause)) .. '(Veículo)'
            else
                damageCause = GetPlayerName(getPlayerId(cause))
            end
        else
            if GetVehiclePedIsIn(cause, false) ~= 0 then
                damageCause = 'AI (Veículo)'
            else
                damageCause = 'AI'
            end
        end
    elseif dType == 2 then
        driver = GetPedInVehicleSeat(cause, -1)
        if IsPedAPlayer(driver) then
            if GetPlayerName(cause) then
                damageCause = GetPlayerName(cause) .. ' com um veículo'
            else
                damageCause = 'veículo'
            end
        else
            damageCause = 'veículo'
        end
    elseif dType == 3 then
        damageCause = 'objeto'
    end
    local pedCoords = GetEntityCoords(GetPlayerPed(source))
    local log = "**Info:**\n**Coordenadas:** " ..
        pedCoords.x ..
        ", " ..
        pedCoords.y ..
        ", " ..
        pedCoords.z ..
        "\n**Causa do dano:** " ..
        damageCause
    LogToDiscord(source,
        "https://discord.com/api/webhooks/1107311406417719427/foKa_phe-Rhce_mUG-b4BhdL0_Sg-21RHiIigcNbZAo72SH6IcPlUHfy7hOvFJlH3_vW"
        , "Dano", log)
end)

RegisterServerEvent("Natural:Server:Logger:Tiros")
AddEventHandler("Natural:Server:Logger:Tiros", function(arma, quantidadeDeTiros)
    local source = source
    local log = "**Info:** Tiros\n**Coordenadas:** " ..
        GetEntityCoords(GetPlayerPed(source)).x ..
        ", " ..
        GetEntityCoords(GetPlayerPed(source)).y ..
        ", " ..
        GetEntityCoords(GetPlayerPed(source)).z ..
        "\n**Arma:** " .. arma .. "\n**Tiros disparados:** " .. quantidadeDeTiros
    LogToDiscord(source,
        "https://discord.com/api/webhooks/1107311234447069196/W8NkJSSt2iU99PbyT5lczU18EhbGz8v_ayq7h2G_f5c1W639Bj94nCldzMTvBnY6rDaQ"
        , "Tiros", log)
end)

AddEventHandler("explosionEvent", function(sender, ev)
    local source = sender
    local log = "**Info:** Explosão\n**Coordenadas:** " ..
        ev.posX ..
        ", " ..
        ev.posY ..
        ", " ..
        ev.posZ ..
        "\n**Tipo:** " ..
        ev.explosionType ..
        "\n**Dano:** " .. ev.damageScale
    LogToDiscord(source,
        "https://discord.com/api/webhooks/1107311289811861596/BCKr4LN7IMbU2StuhPn-zRcMT7QkrC6Uk7zhsImQXc2GvJb1-IrldHu8BwDtKsJH99A2"
        , "Explosão", log)
end)

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        discordid = "",
        license = "",
        license2 = "",
        xbl = "",
        live = "",
        fivem = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)
        if string.find(id, "steam:") then
            identifiers.steam = id
        elseif string.find(id, "ip:") then
            identifiers.ip = id
        elseif string.sub(id, 1, string.len("discord:")) == "discord:" then
            identifiers.discordid = string.sub(id, 9)
            identifiers.discord = "<@" .. identifiers.discordid .. ">"
        elseif string.find(id, "license:") then
            identifiers.license = id
        elseif string.find(id, "license2:") then
            identifiers.license2 = id
        elseif string.find(id, "xbl:") then
            identifiers.xbl = id
        elseif string.find(id, "live:") then
            identifiers.live = id
        elseif string.find(id, "fivem:") then
            identifiers.fivem = id
        end
    end

    return identifiers
end

function getPlayerId(ped)
    for k, v in pairs(GetPlayers()) do
        if GetPlayerPed(v) == ped then
            return v
        end
    end
end

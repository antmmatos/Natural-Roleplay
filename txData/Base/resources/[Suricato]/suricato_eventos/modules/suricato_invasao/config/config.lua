local cfg = {}

cfg.debug = false

cfg.spectate = true -- spectador após morrer
cfg.minutesWaiting = 0.5 -- minutos esperando a entrada de players após dar o horário marcado
cfg.commandInvasion = 'invadir' -- comando para players invadirem
cfg.permissionCommand = 'admin.permissao' -- permissão para abrir o menu de marcação
cfg.returnAfterDrop = true -- se true, quando alguém sair do servidor, e voltar, será inserido na invasão novamente

cfg.healthAmountDied = 101

cfg.webhooks = {
    settings = {
        username = 'Suricato Invasão',
        avatar = 'https://cdn.discordapp.com/attachments/546438668831817769/949025941055737917/unknown.png', 
        color = 16711680
    },

    started = '',
    finished = '',
    kill = '',
    reconnect = '',
    disconnect = ''
}

cfg.weapons = { -- armas que matarão com um tiro na cabeça
    [GetHashKey('WEAPON_UNARMED')] = false,
    [GetHashKey('WEAPON_RUN_OVER_BY_CAR')] = false,
    [GetHashKey('WEAPON_RAMMED_BY_CAR')] = false,
    [GetHashKey('VEHICLE_WEAPON_ROTORS')] = false,
    [GetHashKey('WEAPON_DAGGER')] = false,
    [GetHashKey('WEAPON_BAT')] = false,
    [GetHashKey('WEAPON_BOTTLE')] = false,
    [GetHashKey('WEAPON_CROWBAR')] = false,
    [GetHashKey('WEAPON_FLASHLIGHT')] = false,
    [GetHashKey('WEAPON_GOLFCLUB')] = false,
    [GetHashKey('WEAPON_HAMMER')] = false,
    [GetHashKey('WEAPON_HATCHET')] = false,
    [GetHashKey('WEAPON_KNUCKLE')] = false,
    [GetHashKey('WEAPON_KNIFE')] = false,
    [GetHashKey('WEAPON_MACHETE')] = false,
    [GetHashKey('WEAPON_SWITCHBLADE')] = false,
    [GetHashKey('WEAPON_NIGHTSTICK')] = false,
    [GetHashKey('WEAPON_WRENCH')] = false,
    [GetHashKey('WEAPON_BATTLEAXE')] = false,
    [GetHashKey('WEAPON_POOLCUE')] = false,
    [GetHashKey('WEAPON_STONE_HATCHET')] = false,
    [GetHashKey('WEAPON_PISTOL')] = true,
    [GetHashKey('WEAPON_PISTOL_MK2')] = true,
    [GetHashKey('WEAPON_COMBATPISTOL')] = true,
    [GetHashKey('WEAPON_APPISTOL')] = true,
    [GetHashKey('WEAPON_STUNGUN')] = true,
    [GetHashKey('WEAPON_PISTOL50')] = true,
    [GetHashKey('WEAPON_SNSPISTOL')] = true,
    [GetHashKey('WEAPON_SNSPISTOL_MK2')] = true,
    [GetHashKey('WEAPON_HEAVYPISTOL')] = true,
    [GetHashKey('WEAPON_VINTAGEPISTOL')] = true,
    [GetHashKey('WEAPON_FLAREGUN')] = true,
    [GetHashKey('WEAPON_MARKSMANPISTOL')] = true,
    [GetHashKey('WEAPON_REVOLVER')] = true,
    [GetHashKey('WEAPON_REVOLVER_MK2')] = true,
    [GetHashKey('WEAPON_DOUBLEACTION')] = true,
    [GetHashKey('WEAPON_RAYPISTOL')] = true,
    [GetHashKey('WEAPON_CERAMICPISTOL')] = true,
    [GetHashKey('WEAPON_NAVYREVOLVER')] = true,
    [GetHashKey('WEAPON_GADGETPISTOL')] = true,
    [GetHashKey('WEAPON_MICROSMG')] = true,
    [GetHashKey('WEAPON_SMG')] = true,
    [GetHashKey('WEAPON_SMG_MK2')] = true,
    [GetHashKey('WEAPON_ASSAULTSMG')] = true,
    [GetHashKey('WEAPON_COMBATPDW')] = true,
    [GetHashKey('WEAPON_MACHINEPISTOL')] = true,
    [GetHashKey('WEAPON_MINISMG')] = true,
    [GetHashKey('WEAPON_RAYCARBINE')] = true,
    [GetHashKey('WEAPON_PUMPSHOTGUN')] = true,
    [GetHashKey('WEAPON_PUMPSHOTGUN_MK2')] = true,
    [GetHashKey('WEAPON_SAWNOFFSHOTGUN')] = true,
    [GetHashKey('WEAPON_ASSAULTSHOTGUN')] = true,
    [GetHashKey('WEAPON_BULLPUPSHOTGUN')] = true,
    [GetHashKey('WEAPON_MUSKET')] = true,
    [GetHashKey('WEAPON_HEAVYSHOTGUN')] = true,
    [GetHashKey('WEAPON_DBSHOTGUN')] = true,
    [GetHashKey('WEAPON_AUTOSHOTGUN')] = true,
    [GetHashKey('WEAPON_COMBATSHOTGUN')] = true,
    [GetHashKey('WEAPON_ASSAULTRIFLE')] = true,
    [GetHashKey('WEAPON_ASSAULTRIFLE_MK2')] = true,
    [GetHashKey('WEAPON_CARBINERIFLE')] = true,
    [GetHashKey('WEAPON_CARBINERIFLE_MK2')] = true,
    [GetHashKey('WEAPON_ADVANCEDRIFLE')] = true,
    [GetHashKey('WEAPON_SPECIALCARBINE')] = true,
    [GetHashKey('WEAPON_SPECIALCARBINE_MK2')] = true,
    [GetHashKey('WEAPON_BULLPUPRIFLE')] = true,
    [GetHashKey('WEAPON_BULLPUPRIFLE_MK2')] = true,
    [GetHashKey('WEAPON_COMPACTRIFLE')] = true,
    [GetHashKey('WEAPON_MILITARYRIFLE')] = true,
    [GetHashKey('WEAPON_MG')] = true,
    [GetHashKey('WEAPON_COMBATMG')] = true,
    [GetHashKey('WEAPON_COMBATMG_MK2')] = true,
    [GetHashKey('WEAPON_GUSENBERG')] = true,
    [GetHashKey('WEAPON_SNIPERRIFLE')] = true,
    [GetHashKey('WEAPON_HEAVYSNIPER')] = true,
    [GetHashKey('WEAPON_HEAVYSNIPER_MK2')] = true,
    [GetHashKey('WEAPON_MARKSMANRIFLE')] = true,
    [GetHashKey('WEAPON_MARKSMANRIFLE_MK2')] = true,
    [GetHashKey('WEAPON_RPG')] = false,
    [GetHashKey('WEAPON_GRENADELAUNCHER')] = false,
    [GetHashKey('WEAPON_MINIGUN')] = true,
    [GetHashKey('WEAPON_FIREWORK')] = false,
    [GetHashKey('WEAPON_RAILGUN')] = false,
    [GetHashKey('WEAPON_HOMINGLAUNCHER')] = false,
    [GetHashKey('WEAPON_COMPACTLAUNCHER')] = false,
    [GetHashKey('WEAPON_RAYMINIGUN')] = false,
    [GetHashKey('WEAPON_GRENADE')] = false,
    [GetHashKey('WEAPON_BZGAS')] = false,
    [GetHashKey('WEAPON_MOLOTOV')] = false,
    [GetHashKey('WEAPON_STICKYBOMB')] = false,
    [GetHashKey('WEAPON_PROXMINE')] = false,
    [GetHashKey('WEAPON_SNOWBALL')] = false,
    [GetHashKey('WEAPON_PIPEBOMB')] = false,
    [GetHashKey('WEAPON_BALL')] = false,
    [GetHashKey('WEAPON_SMOKEGRENADE')] = false,
    [GetHashKey('WEAPON_FLARE')] = false,
    [GetHashKey('WEAPON_PETROLCAN')] = false,
    [GetHashKey('WEAPON_PARACHUTE')] = false,
    [GetHashKey('WEAPON_FIREEXTINGUISHER')] = false,
    [GetHashKey('WEAPON_HAZARDCAN')] = false,
}

cfg.weaponClassIcons = { -- foto das armas no killfeed
    dropped = 'https://cdn.discordapp.com/attachments/546438668831817769/948996061018615869/1496957-200.png',
    pistol = 'https://cdn.discordapp.com/attachments/864220360416952341/911036858849435719/WEAPON_PISTOL_MK2.png',
    rifle = 'https://cdn.discordapp.com/attachments/864220360416952341/911036754134441984/WEAPON_ASSAULTRIFLE.png',
    smg = 'https://cdn.discordapp.com/attachments/864220360416952341/911037099275329576/WEAPON_MICROSMG.png',
    unarmed = 'https://cdn.discordapp.com/attachments/864220360416952341/911036987430015046/WEAPON_UNARMED.png',
    sniper = 'https://cdn.discordapp.com/attachments/864220360416952341/911036931649970196/WEAPON_HEAVYSNIPER.png',
    melee = 'https://cdn.discordapp.com/attachments/864220360416952341/911036959957352469/WEAPON_KNUCKLE.png',
    shotgun = 'https://cdn.discordapp.com/attachments/864220360416952341/911037866048626738/WEAPON_PUMPSHOTGUN.png',
    rpg = 'https://cdn.discordapp.com/attachments/864220360416952341/911038263303745586/WEAPON_RPG.png',
    grenade = 'https://cdn.discordapp.com/attachments/864220360416952341/911038505197637663/WEAPON_GRENADE.png',
    snowball = 'https://cdn.discordapp.com/attachments/864220360416952341/911038726036140073/WEAPON_SNOWBALL.png',
}

cfg.controls = { -- ações desativadas quando for para desativar as teclas
    29,38,47,56,57,73,137,166,167,169,170,182,187,188,189,190,243,245,257,288,289,311,344
}

return cfg 
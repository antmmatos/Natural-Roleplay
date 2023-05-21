Config = Config or {}

Config.Menus = {
    ['empty'] = {
        title = '',
        options = {},
    },
    ['main'] = {
        title = '',
        options = {
            {
                label = 'Reparar',
                img = 'img/icons/repair.png',
                price = 0,
                onSelect = function()
                    repairtVehicle(customVehicle)
                end
            },
            { label = 'Visual',  img = 'img/icons/visual.png',  openSubMenu = 'visual' },
            { label = 'Upgrade', img = 'img/icons/upgrade.png', openSubMenu = 'upgrade' }
        },
        onBack = function() closeUI(1) end,
        defaultOption = 1
    },
    ['upgrade'] = {
        title = 'UPGRADES',
        options = {
            {
                label = 'Motor',
                img = 'img/icons/engine.png',
                modType = 11,
                priceMult = { 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0 }
            },
            {
                label = 'Travões',
                img = 'img/icons/brakes.png',
                modType = 12,
                priceMult = { 0.0, 0.0, 0.0,
                    0.0, 0.0 }
            },
            {
                label = 'Transmissão',
                img = 'img/icons/transmission.png',
                modType = 13,
                priceMult = { 0.0, 0.0, 0.0,
                    0.0, 0.0 }
            },
            {
                label = 'Suspenssão',
                img = 'img/icons/suspension.png',
                modType = 15,
                priceMult = { 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0, 0.0 }
            },
            {
                label = 'Armadura',
                img = 'img/icons/armor.png',
                modType = 16,
                priceMult = { 0.0, 0.0, 0.0,
                    0.0, 0.0, 0.0, 0.0, 0.0 }
            },
            { label = 'Turbo', img = 'img/icons/engine.png', modType = 18, priceMult = { 0.0, 0.0 } },
        },
        onBack = function() updateMenu('main') end
    },
    ['visual'] = {
        title = 'VISUALS',
        options = {
            { label = 'Partes do Carro', img = 'img/icons/body.png',    openSubMenu = 'body_parts' },
            { label = 'Pecas Internas',  img = 'img/icons/body.png',    openSubMenu = 'inside_parts' },
            { label = 'Pintura',         img = 'img/icons/respray.png', openSubMenu = 'respray' },
            {
                label = 'Rodas',
                img = 'img/icons/wheel.png',
                openSubMenu = 'wheels',
                onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'wheel_lf',
                        { x = -1.8, y = 0.0, z = 0.0 }, { x = 0.0, y = 0.0, z = -20.0 })
                end
            },
            { label = 'Matriculas',   img = 'img/icons/plate.png',      openSubMenu = 'plate' },
            { label = 'Luzes',        img = 'img/icons/headlights.png', openSubMenu = 'lights' },
            { label = 'Autocolantes', img = 'img/icons/respray.png',    openSubMenu = 'stickers' },
            { label = 'Extra',        img = 'img/icons/plus.png',       modType = 'extras',      priceMult = 0 },
            {
                label = 'Vidros',
                img = 'img/icons/door.png',
                modType = 'windowTint',
                priceMult = 0,
                onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'window_lf',
                        { x = -2.0, y = 0.0, z = 0.0 }, { x = 0.0, y = 0.0, z = -10.0 })
                end,
                onSubBack = function()
                    SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                end
            },
            { label = 'Buzina',   img = 'img/icons/horn.png',    modType = 14, priceMult = 0 },
            { label = 'Interior', img = 'img/icons/body.png',    modType = 27, priceMult = 0 },
            { label = 'Placas',   img = '',                      modType = 35, priceMult = 0 },
            { label = 'Colunas',  img = 'img/icons/speaker.png', modType = 36, priceMult = 0 },
            {
                label = 'Mala',
                img = 'img/icons/trunk.png',
                modType = 37,
                priceMult = 0,
                onSelect = function()
                    openDoors(customVehicle, { 0, 0, 0, 0, 0, 1, 1 })
                end
            },
            { label = 'Hidraulicos',   img = 'img/icons/hydrulics.png',  modType = 38, priceMult = 0 },
            {
                label = 'Bloco do Motor',
                img = 'img/icons/engine_block.png',
                modType = 39,
                priceMult = 0,
                onSelect = function()
                    openDoors(customVehicle, { 0, 0, 0, 0, 1, 0, 0 })
                end
            },
            { label = 'Filtros de Ar', img = 'img/icons/air_filter.png', modType = 40, priceMult = 0 },
            { label = 'Suportes',      img = 'img/icons/suspension.png', modType = 41, priceMult = 0 },
            { label = 'Tanque',        img = 'img/icons/gas_tank.png',   modType = 45, priceMult = 0 },
        },
        onBack = function() updateMenu('main') end
    },
    ['body_parts'] = {
        title = 'PARTES DO CARRO',
        options = {
            { label = 'Spoilers',      img = 'img/icons/spoiler.png', modType = 0, priceMult = 0 },
            { label = 'Parac/ frente', img = 'img/icons/bumper.png',  modType = 1, priceMult = 0 },
            {
                label = 'Parac/ trás',
                img = 'img/icons/bumper.png',
                modType = 2,
                priceMult = 0,
                onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r',
                        { x = 0.0, y = -4.0, z = 1.5 }, { x = -30.0, y = 0.0, z = 0.0 })
                end,
                onSubBack = function()
                    SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                end
            },
            {
                label = 'Saias',
                img = 'img/icons/bumper.png',
                modType = 3,
                priceMult = 0,
                onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'wheel_lf',
                        { x = -2.5, y = 0.0, z = 0.0 }, { x = 0.0, y = 0.0, z = -20.0 })
                end,
                onSubBack = function()
                    SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                end
            },
            {
                label = 'Escape',
                img = 'img/icons/exhaust.png',
                modType = 4,
                priceMult = 0,
                onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r',
                        { x = 0.0, y = -4.0, z = 1.5 }, { x = -30.0, y = 0.0, z = 0.0 })
                end,
                onSubBack = function()
                    SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                end
            },
            {
                label = 'Gaiola',
                img = 'img/icons/body.png',
                modType = 5,
                priceMult = 0,
                onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'interiorlight',
                        { x = 0.0, y = 1.0, z = -0.1 }, { x = 0.0, y = 0.0, z = 0.0 })
                end,
                onSubBack = function()
                    SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                end
            },
            { label = 'Grelha',             img = '',                     modType = 6,  priceMult = 0 },
            { label = 'Capô',              img = 'img/icons/hood.png',   modType = 7,  priceMult = 0 },
            { label = 'Para-lama Esquerdo', img = 'img/icons/bumper.png', modType = 8,  priceMult = 0 },
            { label = 'Para-lama Direito',  img = 'img/icons/bumper.png', modType = 9,  priceMult = 0 },
            { label = 'Tecto',              img = '',                     modType = 10, priceMult = 0 },
            { label = 'Cobertura',          img = 'img/icons/bumper.png', modType = 42, priceMult = 0 },
            { label = 'Aéreos',            img = '',                     modType = 43, priceMult = 0 },
            { label = 'Asas',               img = 'img/icons/bumper.png', modType = 44, priceMult = 0 },
            { label = 'Vidros',             img = 'img/icons/door.png',   modType = 46, priceMult = 0 },
        },
        onBack = function() updateMenu('visual') end
    },
    ['inside_parts'] = {
        title = 'PEÇAS INTERNAS',
        options = {
            { label = 'Painel', img = 'img/icons/dashboard.png', modType = 29, priceMult = 0 },
            { label = 'Dial',   img = 'img/icons/dashboard.png', modType = 30, priceMult = 0 },
            {
                label = 'Colunas portas',
                img = 'img/icons/speaker.png',
                modType = 31,
                priceMult = 5.58,
                onSelect = function()
                    openDoors(customVehicle, { 1, 1, 1, 1, 0, 0, 0 })
                end
            },
            { label = 'Assento',            img = 'img/icons/seat.png',           modType = 32, priceMult = 0 },
            { label = 'Volante',            img = 'img/icons/steering_wheel.png', modType = 33, priceMult = 0 },
            { label = 'Manete velocidades', img = 'img/icons/shifter_leaver.png', modType = 34, priceMult = 0 },
            { label = 'Ornamentos',         img = '',                             modType = 28, priceMult = 0 },
        },
        onBack = function() updateMenu('visual') end
    },
    ['respray'] = {
        title = 'PINTURA',
        options = {
            {
                label = 'Primária',
                img = 'img/icons/respray.png',
                modType = 'color1',
                customType =
                'customColor',
                priceMult = 0,
                onSelect = function()
                    openColorPicker('Primary Color', 'color1', true, 0)
                end
            },
            {
                label = 'Secundária',
                img = 'img/icons/respray.png',
                modType = 'color2',
                customType =
                'customColor',
                priceMult = 0.66,
                onSelect = function()
                    openColorPicker('Secondary Color', 'color2', true, 0)
                end
            },
            { label = 'Tipo de primário',   img = 'img/icons/respray.png', modType = 'paintType1', priceMult = 0 },
            { label = 'Tipo de secundário', img = 'img/icons/respray.png', modType = 'paintType2', priceMult = 0 },
            {
                label = 'Pearolado',
                img = 'img/icons/respray.png',
                modType = 'pearlescentColor',
                customType =
                'color',
                priceMult = 0,
                onSelect = function()
                    openColorPicker('Pearlescent Color', 'pearlescentColor', false, 0)
                end
            },
        },
        onBack = function() updateMenu('visual') end
    },
    ['wheels'] = {
        title = 'RODAS',
        options = {
            { label = 'Tipo de rodas', img = 'img/icons/wheel.png', onSelect = function() updateMenu('wheels_type') end },
            {
                label = 'Cor das rodas',
                img = 'img/icons/respray.png',
                modType = 'wheelColor',
                customType =
                'color',
                priceMult = 0,
                onSelect = function()
                    openColorPicker('Wheels Color', 'wheelColor', false, 0)
                end
            },
            {
                label = 'Cor Fumaça',
                img = 'img/icons/respray.png',
                modType = 'tyreSmokeColor',
                customType =
                'customColor',
                priceMult = 0,
                onSelect = function()
                    openColorPicker('Tyre Smoke Color', 'tyreSmokeColor', true, 0)
                end
            },
        },
        onBack = function()
            updateMenu('visual')
            SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
        end
    },
    ['wheels_type'] = {
        title = 'JANTES',
        options = {
            {
                label = 'Sport',
                img = 'img/icons/wheel.png',
                modType = 23,
                priceMult = 0,
                onSelect = function()
                    SetVehicleModData(customVehicle, 'wheels', 0)
                end
            },
            {
                label = 'Muscle ',
                img = 'img/icons/wheel.png',
                modType = 23,
                priceMult = 0,
                onSelect = function()
                    SetVehicleModData(customVehicle, 'wheels', 1)
                end
            },
            {
                label = 'Lowrider',
                img = 'img/icons/wheel.png',
                modType = 23,
                priceMult = 0,
                onSelect = function()
                    SetVehicleModData(customVehicle, 'wheels', 2)
                end
            },
            {
                label = 'SUV',
                img = 'img/icons/wheel.png',
                modType = 23,
                priceMult = 0,
                onSelect = function()
                    SetVehicleModData(customVehicle, 'wheels', 3)
                end
            },
            {
                label = 'Offroad',
                img = 'img/icons/wheel.png',
                modType = 23,
                priceMult = 0,
                onSelect = function()
                    SetVehicleModData(customVehicle, 'wheels', 4)
                end
            },
            {
                label = 'Tuner',
                img = 'img/icons/wheel.png',
                modType = 23,
                priceMult = 0,
                onSelect = function()
                    SetVehicleModData(customVehicle, 'wheels', 5)
                end
            },
            {
                label = 'Bike Wheels',
                img = 'img/icons/wheel.png',
                modType = 23,
                priceMult = 0,
                onSelect = function()
                    SetVehicleModData(customVehicle, 'wheels', 6)
                end
            },
            {
                label = 'High End',
                img = 'img/icons/wheel.png',
                modType = 23,
                priceMult = 0,
                onSelect = function()
                    SetVehicleModData(customVehicle, 'wheels', 7)
                end
            },
        },
        onBack = function() updateMenu('wheels') end
    },
    ['plate'] = {
        title = 'Matricula',
        options = {
            { label = 'Tipo',   img = 'img/icons/plate.png',  modType = 25, priceMult = 0 },
            {
                label = 'Cor',
                img = 'img/icons/respray.png',
                modType = 'plateIndex',
                priceMult = 0,
                onSelect = function()
                    moveToCameraToBoneSmoth(customCamMain, customCamSec, customVehicle, 'bumper_r',
                        { x = -2.0, y = -2.0, z = 1.5 }, { x = -30.0, y = 0.0, z = 0.0 })
                end,
                onSubBack = function()
                    SetCamActiveWithInterp(customCamMain, customCamSec, 500, true, true)
                end
            },
            { label = 'Holder', img = 'img/icons/bumper.png', modType = 26, priceMult = 0 },
        },
        onBack = function() updateMenu('visual') end
    },
    ['lights'] = {
        title = 'LUZES',
        options = {
            {
                label = 'Xenon',
                img = 'img/icons/headlights.png',
                modType = 'modXenon',
                priceMult = 0,
                onSelect = function()
                    SetVehicleEngineOn(customVehicle, true, false, false)
                end
            },
            {
                label = 'Neon',
                img = 'img/icons/headlights.png',
                modType = 'neonColor',
                customType = 'customColor',
                priceMult = 0,
                onSelect = function()
                    SetVehicleEngineOn(customVehicle, true, false, false)
                    openColorPicker('Neon Color', 'neonColor', true, 0)
                end
            },
        },
        onBack = function() updateMenu('visual') end
    },
    ['stickers'] = {
        title = 'AUTOCOLANTES',
        options = {
            { label = 'Stickers', img = 'img/icons/respray.png', modType = 48,       priceMult = 0 },
            { label = 'Livery',   img = 'img/icons/respray.png', modType = 'livery', priceMult = 0 },
        },
        onBack = function() updateMenu('visual') end
    },
}

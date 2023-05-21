Config, Locales = {}, {}

Config.Debug = false -- This will print multiple steps in the console, useful to find when an error happens

Config.DoubleXP = false

Config.EventPrefix = 'okokCrafting'

Config.xpColumnsName = 'xp'

Config.ESXPrefix = 'esx'

Config.getSharedObject = 'getSharedObject'

Config.Locale = 'pt'                     -- en / pt / gr / fr / de

Config.UseOkokTextUI = true              -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.Key = 38                          -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.HideMinimap = true                -- If true it'll hide the minimap when the Crafting menu is opened

Config.ShowBlips = true                  -- If true it'll show the crafting blips on the map

Config.ShowFloorBlips = true             -- If true it'll show the crafting markers on the floor

Config.ShowAllCrafts = true              -- This option will show all crafts even if you don't have enough level to craft it

Config.UseXP = false                     -- If you want to use the XP system or not

Config.SameLevelForAllTables = false     -- Use the same level in all the crafting tables

Config.MaxLevel = 20                     -- Max level on the workbenches

Config.StartXP = 100                     -- First level XP

Config.LevelMultiplier = 1.05            -- How much the XP needed increases per level (1.05 = 5% | level 1 = 100 | level 2 = 205 | etc...)

Config.GiveXPOnCraftFailed = true        -- If the player receives XP when he fails the craft of an item

Config.SetXPCommand = 'setcraftxp'       -- Set the players XP

Config.SetLevelCommand = 'setcraftlevel' -- Set the players level

Config.CraftRadius = 5                   -- if you are further it will stop the craft

Config.MaxCraftsPerWorkbench = 10        -- how many items can be in the queue at the same time

Config.UseCategories = false

Config.NotInterectableTables = false -- true = all blips will disapear and you can only open the crafting table using the `openClosestTable` or `openWorkbench` events

Config.AdminGroups = {
    'owner',
    'admin'
}

Config.itemNames = {
    -- Format: id = label | In case the item starts with a number make sure to set it in this format: ['9mm'] = 9mm ammo,
    metalscrap                = 'Metal Scrap',
    weapon_assaultrifle       = 'Ak-47',
    weapon_pistol_mk2         = 'Pistola Mk-2',
    weapon_pistol50           = 'Pistola .50',
    weapon_revolver           = 'Pistola Revolver',
    weapon_microsmg           = 'Micro-UZI SMG',
    weapon_assaultsmg         = 'P90 SMG',
    weapon_machinepistol      = 'Tec-9 SMG',
    weapon_specialcarbine_mk2 = 'Carabina Especial MK2',
    weapon_bullpuprifle_mk2   = 'Famas MK2',
    weapon_compactrifle       = 'Mini Draco Ak-47',
    weapon_combatpdw          = 'PDW SMG',
    rifle_ammo                = 'Munição 5.56x45mm',
    pistol_ammo               = 'Munição 9x19mm',
    smg_ammo                  = 'Munição 7.62x39mm',
    pistol_extendedclip       = 'Carregador Ext. Pistola',
    smg_extendedclip          = 'Carregador Ext. SMG',
    rifle_extendedclip        = 'Carregador Ext. Rifle',
    pistol_suppressor         = 'Silenciador de Pistola',
    smg_suppressor            = 'Silenciador de SNG',
    rifle_suppressor          = 'Silenciador de Rifle',
    smg_grip                  = 'Grip de SMG',
    rifle_grip                = 'Grip de Rifle',
    smg_scope                 = 'Mira de SMG',
    rifle_scope               = 'Mira de Rifle',
    pistol_flashlight         = 'Lanterna de Pistola',
    smg_flashlight            = 'Lanterna de SMG',
    rifle_flashlight          = 'Lanterna de Rifle',
    armor                     = 'Colete',
    molapeca                  = 'Peça de arma',
    iron_metal                = 'Ferro',
    carbon_metal              = 'Carvão',
    hunter_animal_leather     = 'Couro',
    wood_processed            = 'Madeira',
    rubber                    = 'Borracha',
    glass                     = 'Vidro',
    plastic                   = 'Plástico',
    gold_metal                = 'Ouro',
    hunter_animal_cloth       = 'Tecido',
    polvora                   = 'Pólvora',







}

Config.Crafting = {
   
    {
        coordinates = vector3(2850.2410, 1494.6057, 24.7244 - 0.95), -- coordinates of the table
        radius = 1,                                                 -- radius of the table
        showMapBlip = true,
        marker = {
            type = 27,
            r = 255,
            g = 255,
            b = 255,
            a = 255,
            bobUpAndDown = 0,
            faceCamera = 0,
            rotate = 1,
            textureDict = 0,
            textureName = 0,
            drawOnEnts = 0
        },
        showBlipRadius = 20,
        blip = { blipId = 89, blipColor = 3, blipScale = 0.9, blipText = 'Crafting' }, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
        tableName = 'peças de arma',                                                     -- Title
        tableID = 'pecas',                                                        -- make a different one for every table with NO spaces
        crafts = {                                                                     -- What items are available for crafting and the recipe
            'Peça de arma',
           
          
        },
        jobs = {
            -- What jobs are able to open the workbench
            ['vagos'] = {
                ['all'] = true,
            },
            ['ballas'] = {
                ['all'] = true,
            },
            ['families'] = {
                ['all'] = true,
            },
        },
    },



    {
        coordinates = vector3(-176.9587, 6151.2188, 42.6375 - 0.95), -- coordinates of the table
        radius = 1,                                                 -- radius of the table
        showMapBlip = true,
        marker = {
            type = 27,
            r = 255,
            g = 255,
            b = 255,
            a = 255,
            bobUpAndDown = 0,
            faceCamera = 0,
            rotate = 1,
            textureDict = 0,
            textureName = 0,
            drawOnEnts = 0
        },
        showBlipRadius = 20,
        blip = { blipId = 89, blipColor = 3, blipScale = 0.9, blipText = 'Crafting' }, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
        tableName = 'Acessórios',                                                     -- Title
        tableID = 'acessorios',                                                        -- make a different one for every table with NO spaces
        crafts = {                                                                     -- What items are available for crafting and the recipe
            'Carregador extra Pistola',
            'Carregador extra Smg',                                                    -- Recipe id
            'Carregador extra Rifle',
            'Silenciador de Pistola',
            'Silenciador de Smg',
            'Silenciador de Rifle',
            'Grip de Smg',
            'Grip de Rifle',
            'Mira de Pistola',
            'Mira de Smg',
            'Mira de Rifle',
            'Lanterna de Pistola',
            'Lanterna de Smg',
            'Lanterna de Rifle',
            'armor'
        },
        jobs = {
            -- What jobs are able to open the workbench
            ['cv'] = {
                ['all'] = true,
            },
            ['japao'] = {
                ['all'] = true,
            },
            ['cpx'] = {
                ['all'] = true,
            },
        },
    },

    {
        coordinates = vector3(3606.0288, 3729.1758, 29.6894 - 0.95), -- coordinates of the table
        radius = 1,                                                 -- radius of the table
        showMapBlip = true,
        marker = {
            type = 27,
            r = 255,
            g = 255,
            b = 255,
            a = 255,
            bobUpAndDown = 0,
            faceCamera = 0,
            rotate = 1,
            textureDict = 0,
            textureName = 0,
            drawOnEnts = 0
        },
        showBlipRadius = 20,
        blip = { blipId = 89, blipColor = 3, blipScale = 0.9, blipText = 'Crafting' }, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
        tableName = 'Armas',                                                           -- Title
        tableID = 'armas',                                                             -- make a different one for every table with NO spaces
        crafts = {                                                                     -- What items are available for crafting and the recipe
            'Ak-47',
            'Pistola Mk-2',                                                            -- Recipe id
            'Pistola 50',
            'Pistola Revolver',
            'Micro-uzi smg',
            'P-90 smg',
            'Tec-9 smg',
            'Carabina-Especial mk2',
            'Famas mk2',
            'Mini-Draco',
            'Pdw-smg',
        },
        jobs = {
            -- What jobs are able to open the workbench
            ['franca'] = {
                ['all'] = true,
            },
            ['grota'] = {
                ['all'] = true,
            },
            ['italia'] = {
                ['all'] = true,
            },
            ['cartel'] = {
                ['all'] = true,
            },
        },
    },

    {
        coordinates = vector3(1394.5292, 3601.7373, 38.9419 - 0.95), -- coordinates of the table
        radius = 1,                                                  -- radius of the table
        showMapBlip = true,
        marker = {
            type = 27,
            r = 255,
            g = 255,
            b = 255,
            a = 255,
            bobUpAndDown = 0,
            faceCamera = 0,
            rotate = 1,
            textureDict = 0,
            textureName = 0,
            drawOnEnts = 0
        },
        showBlipRadius = 20,
        blip = { blipId = 89, blipColor = 3, blipScale = 0.9, blipText = 'Crafting' }, -- to get blips and colors check this: https://wiki.gtanet.work/index.php?title=Blips
        tableName = 'Balas',                                                           -- Title
        tableID = 'balas',                                                             -- make a different one for every table with NO spaces
        crafts = {                                                                     -- What items are available for crafting and the recipe
            'Balas de Rifle',
            'Balas de Pistola',                                                        -- Recipe id
            'Balas de Smg',

        },
        jobs = {
            -- What jobs are able to open the workbench
            ['ballas'] = {
                ['all'] = true,
            },
            ['vagos'] = {
                ['all'] = true,
            },
            ['families'] = {
                ['all'] = true,
            },
        },
    },
}

Config.Crafts = {
  
 
  
    ['Peça de arma'] = {
        item = 'molapeca',         -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'iron_metal', 1, true, false },  { 'carbon_metal', 1, true, false }, { 'hunter_animal_leather', 1, true, false }, { 'wood_processed', 1, true, false },-- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'pecas', -- Used as ID and Name of the category
    },
   
    ['Lanterna de Rifle'] = {
        item = 'rifle_flashlight',         -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'glass', 1, true, false },   { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Lanterna de Smg'] = {
        item = 'smg_flashlight',           -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'glass', 1, true, false },   { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Lanterna de Pistola'] = {
        item = 'pistol_flashlight',        -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'glass', 1, true, false },   { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Mira de Rifle'] = {
        item = 'rifle_scope',              -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'glass', 1, true, false },   { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Mira de Smg'] = {
        item = 'smg_scope',                -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'glass', 1, true, false },   { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Grip de Smg'] = {
        item = 'smg_grip',                 -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
       { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Grip de Rifle'] = {
        item = 'rifle_grip',               -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Silenciador de Pistola'] = {
        item = 'pistol_suppressor',        -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'gold_metal', 1, true, false },  { 'rubber', 1, true, false },  { 'plastic', 1, true, false },   -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Silenciador de Smg'] = {
        item = 'smg_suppressor',           -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'gold_metal', 1, true, false },  { 'rubber', 1, true, false },  { 'plastic', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Silenciador de Rifle'] = {
        item = 'rifle_suppressor',         -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
             { 'gold_metal', 1, true, false },  { 'rubber', 1, true, false },  { 'plastic', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Carregador extra Pistola'] = {
        item = 'pistol_extendedclip',      -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Carregador extra Smg'] = {
        item = 'smg_extendedclip',         -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Carregador extra Rifle'] = {
        item = 'rifle_extendedclip',       -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'gold_metal', 1, true, false },  { 'iron_metal', 1, true, false },  { 'plastic', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Balas de Rifle'] = {
        item = 'rifle_ammo',               -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'polvora', 1, true, false },  { 'iron_metal', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Balas de Pistola'] = {
        item = 'pistol_ammo',              -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'polvora', 1, true, false },  { 'iron_metal', 1, true, false },   -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Balas de Smg'] = {
        item = 'smg_ammo',                 -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'polvora', 1, true, false },  { 'iron_metal', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['armor'] = {
        item = 'armor',                    -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'rubber', 1, true, false },   { 'hunter_animal_leather', 1, true, false },    { 'hunter_animal_cloth', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},                           -- Used to pass additional data, such as metadata
        category = 'Acessórios/Componentes', -- Used as ID and Name of the category
    },
    ['Pistola Revolver'] = {
        item = 'weapon_revolver',          -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['Ak-47'] = {
        item = 'weapon_assaultrifle',      -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1,    true, false }, -- item/amount/if the item should be removed when crafting/if it's money
            
        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['Carabina-Especial mk2'] = {
        item = 'weapon_specialcarbine_mk2', -- Item id and name of the image
        amount = 1,                         -- Amount of the item the player will receive
        maxCraft = 1,                       -- Max amount of crafts at a time
        successCraftPercentage = 100,       -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                      -- if true = is item | if false = is weapon
        isDisassemble = false,              -- true = disassemble | false = craft
        time = 6,                           -- Time to craft (in seconds)
        levelNeeded = 2,                    -- What level he needs to craft this item
        xpPerCraft = 40,                    -- How much XP he receives after crafting this item
        recipe = {                          -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false },  -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['Pistola Mk-2'] = {
        item = 'weapon_pistol_mk2',        -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['Pistola 50'] = {
        item = 'weapon_pistol50',          -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['Micro-uzi smg'] = {
        item = 'weapon_microsmg',          -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['P-90 smg'] = {
        item = 'weapon_assaultsmg',        -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['Tec-9 smg'] = {
        item = 'weapon_machinepistol',     -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['Famas mk2'] = {
        item = 'weapon_bullpuprifle_mk2',  -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['Mini-Draco'] = {
        item = 'weapon_compactrifle',      -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['Pdw-smg'] = {
        item = 'weapon_combatpdw',         -- Item id and name of the image
        amount = 1,                        -- Amount of the item the player will receive
        maxCraft = 1,                      -- Max amount of crafts at a time
        successCraftPercentage = 100,      -- Percentage of successful craft 0 = 0% | 50 = 50% | 100 = 100%
        isItem = true,                     -- if true = is item | if false = is weapon
        isDisassemble = false,             -- true = disassemble | false = craft
        time = 6,                          -- Time to craft (in seconds)
        levelNeeded = 2,                   -- What level he needs to craft this item
        xpPerCraft = 40,                   -- How much XP he receives after crafting this item
        recipe = {                         -- Recipe to craft it
            -- nome, quantidade, remover item, dinheiro
            { 'molapeca', 1, true, false }, -- item/amount/if the item should be removed when crafting/if it's money

        },
        job = { -- What jobs can craft this item in this workbench
            ''
        },
        data = {},              -- Used to pass additional data, such as metadata
        category = 'Armamento', -- Used as ID and Name of the category
    },
    ['firstaid'] = {
        item = 'medikit',
        amount = 1,
        maxCraft = 10,
        successCraftPercentage = 75,
        isItem = true,
        isDisassemble = false,
        time = 3,
        levelNeeded = 0,
        xpPerCraft = 15,
        recipe = {
            { 'bandage', 4, true, false },
        },
        job = {
            ''
        },
        data = {}, -- Used to pass additional data, such as metadata
        category = 'Health',
    },
}

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 3

Config.BotName = 'ServerName'       -- Write the desired bot name

Config.ServerName = 'ServerName'    -- Write your server's name

Config.IconURL = ''                 -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.StartCraftWebhookColor = '16127'

Config.CancelWebhookColor = '16776960'

Config.ClaimCraftWebhookColor = '65352'

Config.FailedCraftWebhookColor = '16711680'

-------------------------- LOCALES (DON'T TOUCH)

function _L(id)
    if Locales[Config.Locale][id] then
        return Locales[Config.Locale][id]
    else
        print('Locale ' .. id .. ' doesn\'t exist')
    end
end

--

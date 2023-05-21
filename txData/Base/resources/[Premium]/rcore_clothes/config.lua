Config = {}
--------------------
Config.Locale = 'en'
--------------------
Config.Debug = false
Config.DisableTeleport = false
--------------------
Config.WaitBeforeOpenMenu = 200
Config.CheckPlayerPosition = 2000
Config.NearObjectDistance = 5.0
--------------------
Config.DatastoreName = 'property'
Config.UseESXDataStore = true
--------------------
Config.TitleShop = "Loja de Roupa"

--Handsup & Animations
Config.NotClearTask = false --if true it will not clear ped task on enter shop
Config.HandsupDict = 'missminuteman_1ig_2'
Config.HandsupAnim = 'handsup_base'
Config.ForcedRotate = true --if true rotation of player will be set and not animated
Config.RotationValue = 10
--------------------
Config.SkipClothesPieces = {
    "skin",
    "hair_1",
    "hair_2",
}
--------------------
Config.Framework = {
    -- 1 = esx
    -- 2 = qbcore
    Active = 1,
    -- esx
    ESX_SHARED_OBJECT = "esx:getSharedObject",
    -- es_extended resource name
    ES_EXTENDED_NAME = "es_extended",
    -- qbcore
    QBCORE_SHARED_OBJECT = "QBCore:GetObject",
    -- qb-core resource name
    QB_CORE_NAME = "qb-core",
}
--------------------

-- skinchanger         = 1
-- cui_character       = 2
-- qb_clothing         = 3
-- fivem_appearance    = 4
-- illenium-appearance = 5

-- Note: if you're using qb-clothing you need to open readme.md and make changes that are **necessary** for the resource!
SkinChanger = "1"

--------------------
-- Alot of fivem_appearance does not offer save / load. This resource **DOES NOT take care of the saving/loading**
-- you will have to edit this string to the event you're using for saving.
Config.Fivem_AppearanceSaveEvent = ""
--------------------
Config.QBCoreCallbacks = {
    ['QBCore:Client:OnJobUpdate'] = 'QBCore:Client:OnJobUpdate',
    ['QBCore:Player:SetPlayerData'] = 'QBCore:Player:SetPlayerData',
}
--------------------
Config.ESXCallbacks = {
    ['esx_datastore:getDataStore'] = 'esx_datastore:getDataStore',
    ['esx:playerLoaded'] = 'esx:playerLoaded',
    ['esx:setJob'] = 'esx:setJob',
    ['esx_addonaccount:getSharedAccount'] = 'esx_addonaccount:getSharedAccount',
    ['skinchanger:getSkin'] = 'skinchanger:getSkin',
    ['skinchanger:loadClothes'] = 'skinchanger:loadClothes',
    ['esx_skin:setLastSkin'] = 'esx_skin:setLastSkin',
    ['esx_skin:save'] = 'esx_skin:save',
    ['skinchanger:loadSkin'] = 'skinchanger:loadSkin',
}
--------------------
Config.GlobalBlacklist = {
    --['boots'] = { --Name of section of shop
    --    ['shoes_1'] = { --Name of skinchanger field
    --        --['male'] = { 4, 5, 6 }, --Specific sex blacklist
    --        --['female'] = { 1, 2, 3 },
    --    }
    --},
    --['bags'] = {--Numbers of blacklisted items for bags for both sex
    --}
}
--------------------
Config.GlobalWhitelist = { --Same as blacklist you can do with whitelist
    --['hats'] = {
    --    ['helmet_1'] = {
    --        ['male'] = {}, --Specific sex blacklist
    --        ['female'] = {},
    --    }
    --},
    --['bags'] = {
    --    --Numbers of blacklisted items for bags for both sex
    --}
}
--------------------
-- Where player can change his clothes at store or anywhere
Config.ChangePoint = {
    title = 'Trocar de roupa',      -- menu title
    label = 'Vestiário\n~r~[E]~w~', --3D text
    help = 'Pressione ~INPUT_CONTEXT~ para abrir o menu de troca de roupa',
    key = 38,                       --E https://docs.fivem.net/docs/game-references/controls/
    menualign = 'right',
    heightMenu = "middle",
    renderDistance = 5.0,
    size = 0.5,
    points = {
        vector3(429.75, -811.41, 29.49),
        vector3(71.19, -1387.76, 29.38),
        vector3(-819.66, -1067.17, 11.33),
        vector3(3.63, 6505.58, 31.88),
        vector3(1699.01, 4817.92, 42.06),
        vector3(1201.89, 2714.5, 38.22),
        vector3(-1100.45, 2717.04, 19.11),
        vector3(-703.51, -151.62, 37.42),
        vector3(-168.3, -299.38, 39.73),
        vector3(-1447.35, -242.73, 49.82),
        vector3(118.18, -232.61, 54.56),
        vector3(617.72, 2773.41, 42.09),
        vector3(-1182.54, -765.13, 17.33),
        vector3(-3178.37, 1035.77, 20.86),
        vector3(-571.05, -198.66, 42.76),
        vector3(365.2, 4819.63, -59),
        vector3(151.01, -768.22, 50.14),
        vector3(461.55, -996.48, 30.69), --PD
    }
}
--------------------
-- key that will open shop with clothes
-- E https://docs.fivem.net/docs/game-references/controls/
Config.KeyToOpenShop = 38
--------------------
---checkVisibleSection()
Config.Stores = {
    {
        blipPosition = {
            vector3(422.86, -808.31, 29.49),
            vector3(77.77, -1391.3, 29.38),
            vector3(-715.03, -145.58, 37.42),
            vector3(-165.69, -311.55, 39.73),
            vector3(-822.42, -1080.5, 11.33),
            vector3(-1444.74, -230.44, 49.81),
            vector3(3.3, 6519.29, 31.88),
            vector3(119.08, -222.55, 54.56),
            vector3(1687.45, 4825.47, 42.06),
            vector3(620.66, 2764.38, 42.09),
            vector3(1193.16, 2704.16, 38.22),
            vector3(-1188.25, -772.88, 17.33),
            vector3(-3176.96, 1045.31, 20.86),
            vector3(-1100.05, 2703.59, 19.11),
        },
        label = 'Loja de Roupa',
        sprite = 73, -- to disable blip make this -1
        scale = 1.0,
        color = 1,
        --job = { "police" },
        --identifier = { "identifier"},

        sections = {
            boots = {
                pos = {
                    vec4(419.549988, -802.770020, 29.490000, 270.553833),
                    vec4(81.209999, -1396.500000, 29.379999, 89.768616),
                    vec4(-715.030029, -145.580002, 37.419998, 210.314392),
                    vec4(-165.690002, -311.549988, 39.730000, 340.599854),
                    vec4(-822.419983, -1080.500000, 11.330000, 30.766073),
                    vec4(-1444.739990, -230.440002, 49.810001, 136.835541),
                    vec4(3.300000, 6519.290039, 31.879999, 222.224854),
                    vec4(119.080002, -222.550003, 54.560001, 252.511353),
                    vec4(1687.449951, 4825.470215, 42.060001, 277.861328),
                    vec4(620.659973, 2764.379883, 42.090000, 93.607147),
                    vec4(1193.160034, 2704.159912, 38.220001, 357.344025),
                    vec4(-1188.250000, -772.880005, 17.330000, 33.100834),
                    vec4(-3176.959961, 1045.310059, 20.860001, 243.535919),
                    vec4(-1100.050049, 2703.590088, 19.110001, 39.402077)
                },
                label = '👞',
                title = "Loja de Sapatos!",
                help = 'Pressione ~INPUT_CONTEXT~ para abrir o menu da loja',
                components = {
                    {
                        label = 'Sapatos',
                        name = 'shoes_1',
                        --fixedTo = 10, -- will limit the store to max 10 clothes
                        from = 1,
                        price = 50,
                        reset = {
                            'shoes_2'
                        },
                        --customPrices = {
                        --    ['1'] = 50,
                        --    ['2'] = 200,
                        --    ['5'] = 1500,
                        --},
                        --customPrices = {
                        --    ['male'] = {
                        --        ['2'] = 200,
                        --        ['3'] = 350,
                        --        ['5'] = 150,
                        --    },
                        --    ['female'] = {},
                        --},
                        --hideCompoment = {
                        --    ["pants_1"] = -1,
                        --},
                        --whitelist = { --Specific for female & male
                        --    ['female'] = {5,6,7},
                        --    ['male'] = {1,2,3}
                        --},
                        --blacklist = { --Global for male & female
                        --    1,2,3
                        --},
                        customCamera = {
                            offset = {
                                x = 1.5,
                                y = 1.0,
                                z = 1.5
                            },
                            pointOffset = {
                                x = 0.0,
                                y = 0.0,
                                z = 0.0
                            }
                        },
                    },
                    {
                        label = 'Cor dos Sapatos',
                        name = 'shoes_2',
                        from = 0,
                        price = 50,
                    }
                },
                cam = {
                    offset = {
                        x = -0.5,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.8
                    },
                },
                size = 1.2, --Default 1
                renderDistance = 10.0,
            },
            hats = {
                pos = {
                    vec4(427.510010, -798.890015, 29.490000, 180.622803),
                    vec4(73.440002, -1400.250000, 29.379999, 352.496460),
                    vec4(-829.789978, -1075.680054, 11.330000, 281.446808),
                    vec4(11.620000, 6516.029785, 31.879999, 130.837494),
                    vec4(121.870003, -221.850006, 54.560001, 265.525818),
                    vec4(1694.849976, 4830.450195, 42.060001, 184.072403),
                    vec4(618.460022, 2762.719971, 42.090000, 98.015945),
                    vec4(1189.359985, 2712.209961, 38.220001, 268.958649),
                    vec4(-1190.880005, -771.609985, 17.330000, 58.856960),
                    vec4(-3174.219971, 1045.900024, 20.860001, 258.818665),
                    vec4(-1108.310059, 2707.010010, 19.110001, 309.985565)
                },
                label = '👒 ',
                title = "Loja de Chapéus",
                help = 'Pressione ~INPUT_CONTEXT~ para abrir o menu da loja',
                components = {
                    {
                        label = 'Chapéus',
                        name = 'helmet_1',
                        from = -1,
                        reset = {
                            'helmet_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Cor dos Chapéus',
                        name = 'helmet_2',
                        from = 0,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                }
            },
            pants = {
                pos = {
                    vec4(430.579987, -800.130005, 29.500000, 89.743790),
                    vec4(69.760002, -1399.060059, 29.379999, 269.425537),
                    vec4(-712.929993, -147.710007, 37.419998, 117.859375),
                    vec4(-165.750000, -308.540009, 39.730000, 252.681137),
                    vec4(-830.460022, -1072.010010, 11.340000, 208.985748),
                    vec4(-1446.130005, -233.259995, 49.810001, 47.346375),
                    vec4(12.760000, 6512.479980, 31.889999, 46.612553),
                    vec4(122.989998, -229.270004, 54.560001, 340.102264),
                    vec4(1698.319946, 4829.520020, 42.070000, 97.743324),
                    vec4(614.289978, 2768.699951, 42.090000, 253.378723),
                    vec4(1190.589966, 2715.399902, 38.230000, 180.064011),
                    vec4(-1188.000000, -764.679993, 17.320000, 128.363388),
                    vec4(-3173.770020, 1038.339966, 20.860001, 334.796082),
                    vec4(-1109.479980, 2710.530029, 19.120001, 221.855286)
                },
                label = '👖',
                title = "Loja de Calças",
                help = 'Pressione ~INPUT_CONTEXT~ para abrir o menu da loja',
                components = {
                    {
                        label = 'Calças',
                        name = 'pants_1',
                        from = 1,
                        reset = {
                            'pants_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Cor das Calças',
                        name = 'pants_2',
                        from = 0,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = -0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = -0.4
                    },
                }
            },
            glasses = {
                pos = {
                    vec4(425.690002, -808.109985, 29.490000, 91.236084),
                    vec4(75.209999, -1391.219971, 29.379999, 268.382813),
                    vec4(-821.000000, -1072.709961, 11.330000, 208.076538),
                    vec4(3.740000, 6511.350098, 31.879999, 40.099686),
                    vec4(126.769997, -221.199997, 54.560001, 340.593994),
                    vec4(1694.119995, 4820.950195, 42.060001, 97.270439),
                    vec4(614.520020, 2759.919922, 42.090000, 238.793884),
                    vec4(1198.079956, 2710.110107, 38.220001, 179.955292),
                    vec4(-1195.170044, -769.830017, 17.320000, 193.964615),
                    vec4(-1369.339966, 1046.349976, 20.860001, 208.443039),
                    vec4(-1100.140015, 2711.699951, 19.110001, 221.110672)
                },
                label = '👓',
                title = "Loja de Óculos",
                help = 'Pressione ~INPUT_CONTEXT~ para abrir o menu da loja',
                components = {
                    {
                        label = 'Óculos',
                        name = 'glasses_1',
                        from = 0,
                        reset = {
                            'glasses_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Cor dos Óculos',
                        name = 'glasses_2',
                        from = 0,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                }
            },
            tshirt = {
                pos = {
                    vec4(425.410004, -798.900024, 29.490000, 180.572876),
                    vec4(75.529999, -1399.989990, 29.379999, 356.718994),
                    vec4(-707.979980, -161.210007, 37.419998, 31.808643),
                    vec4(-158.679993, -295.790009, 39.730000, 161.493729),
                    vec4(-828.630005, -1077.369995, 11.330000, 299.784454),
                    vec4(-1457.650024, -242.210007, 49.810001, 317.462708),
                    vec4(9.950000, 6517.470215, 31.879999, 130.273239),
                    vec4(121.910004, -212.009995, 54.560001, 250.285278),
                    vec4(1692.770020, 4829.899902, 42.060001, 184.442184),
                    vec4(622.640015, 2753.040039, 42.090000, 93.916138),
                    vec4(1189.420044, 2710.090088, 38.220001, 268.194336),
                    vec4(-1196.719971, -780.130005, 17.330000, 35.344364),
                    vec4(-3173.570068, 1056.109985, 20.860001, 246.846985),
                    vec4(-1106.729980, 2705.600098, 19.110001, 310.021729)
                },
                label = '👕',
                title = "Loja de T-Shirts",
                help = 'Pressione ~INPUT_CONTEXT~ para abrir o menu da loja',
                components = {
                    {
                        label = 'TShirt',
                        name = 'tshirt_1',
                        from = 1,
                        reset = {
                            'tshirt_2'
                        },
                        price = 150,
                    },
                    {
                        label = 'Cor da TShirt',
                        name = 'tshirt_2',
                        from = 0,
                        price = 50,
                    },
                    {
                        label = 'Casaco',
                        name = 'torso_1',
                        from = 1,
                        reset = {
                            'torso_2'
                        },
                        price = 300,
                    },
                    {
                        label = 'Cor do Casaco',
                        name = 'torso_2',
                        from = 0,
                        price = 50,
                    },
                    {
                        label = 'Braços',
                        name = 'arms',
                        from = 1,
                        price = 0,
                    },

                    {
                        label = 'Acessórios',
                        name = 'chain_1',
                        from = 0,
                        price = 50,
                    },
                    {
                        label = 'Cor dos Acessórios',
                        name = 'chain_2',
                        from = 0,
                        price = 50,
                    },
                    {
                        label = 'Colete',
                        name = 'bproof_1',
                        from = 0,
                        price = 50,
                    },
                    {
                        label = 'Cor do Colete',
                        name = 'bproof_2',
                        from = 0,
                        price = 50,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                }
            }
        }
    },
    --{
    --    blipPosition = {
    --        vector3(-627.71, -233.16, 38.06),
    --    },
    --    label = 'Jewelry store',
    --    sprite = 58,
    --    color = 60,
    --    sections = {
    --        jewelry = {
    --            pos = {
    --                vec4(-627.710022, -233.160004, 38.060001, 33.907402),
    --            },
    --            label = '💎',
    --            help = 'Pressione ~INPUT_CONTEXT~ para abrir o menu da loja',
    --            components = {
    --                {
    --                    label = 'Acessórios',
    --                    name = 'chain_1',
    --                    from = -1,
    --                    price = 120,
    --                },
    --                {
    --                    label = 'Cor dos Acessórios',
    --                    name = 'chain_2',
    --                    from = -1,
    --                    price = 120,
    --                },
    --
    --                {
    --                    label = 'Acessórios de Orelha',
    --                    name = 'ears_1',
    --                    from = -1,
    --                    price = 120,
    --                },
    --                {
    --                    label = 'Cor dos Acessórios de Orelha',
    --                    name = 'ears_2',
    --                    from = -1,
    --                    price = 120,
    --                },
    --            },
    --            cam = {
    --                offset = {
    --                    x = 0.0,
    --                    y = 1.0,
    --                    z = 0.5
    --                },
    --                pointOffset = {
    --                    x = 0,
    --                    y = 0,
    --                    z = 0.4
    --                },
    --            }
    --        },
    --    }
    --},
    {
        blipPosition = {
            vector3(-1226.68, -1445.17, 4.28),
        },
        label = 'Mochilas',
        sprite = 440,
        color = 60,
        sections = {
            bags = {
                pos = {
                    vec4(-1226.680054, -1445.170044, 4.280000, 214.492447),
                },
                label = '🎒',
                help = 'Pressione ~INPUT_CONTEXT~ para abrir o menu da loja',
                components = {
                    {
                        label = 'Mochila',
                        name = 'bags_1',
                        from = -1,
                        reset = {
                            'bags_2'
                        },
                        price = 120,
                    },
                    {
                        label = 'Cor da Mochila',
                        name = 'bags_2',
                        from = 0,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.5
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.4
                    },
                }
            },
        }
    },
    {
        blipPosition = {
            vector3(-1337.7, -1277.47, 4.68),
        },
        label = 'Loja de Máscaras',
        sprite = 362,
        color = 60,
        sections = {
            bags = {
                pos = {
                    vec4(-1337.7, -1277.47, 4.68, 214.492447),
                },
                label = '🙈',
                help = 'Pressione ~INPUT_CONTEXT~ para abrir o menu da loja',
                components = {
                    {
                        label = 'Máscara',
                        name = 'mask_1',
                        from = -1,
                        reset = {
                            'mask_2'
                        },
                        price = 50,
                    },
                    {
                        label = 'Cor da Máscara',
                        name = 'mask_2',
                        from = 0,
                        price = 10,
                    },
                },
                cam = {
                    offset = {
                        x = 0.0,
                        y = 1.0,
                        z = 0.7
                    },
                    pointOffset = {
                        x = 0,
                        y = 0,
                        z = 0.8
                    },
                }
            },
        }
    },
}

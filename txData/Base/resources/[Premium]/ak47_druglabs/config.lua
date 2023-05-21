Config = {}

Config.GiveBlack = true                         -- give black money? if disabled it'll give regular cash.

Config.CircleZones = {
    [1] = {
        collect = {
              --Drug collect points
            [1] = { pos = vector3(1745.6112, -1635.7861, 112.4932 - 0.95), heading = 260.4261, quantity = 1 },
            [2] = { pos = vector3(1743.2623, -1636.2190, 112.5049 - 0.95), heading = 301.9222, quantity = 1 },
            [3] = { pos = vector3(1740.7832, -1636.5829, 112.5157 - 0.95), heading = 114.3717, quantity = 1 },
            [4] = { pos = vector3(1738.3356, -1637.0310, 112.5279 - 0.95), heading = 114.3717, quantity = 1 },
        },
        process = {
            [1] = { pos = vector3(944.9984, -1521.1964, 31.0839 - 0.95), heading = 246.0837 },
            [2] = { pos = vector3(942.6456, -1521.1414, 31.0627 - 0.95), heading = 145.9290 },
            [3] = { pos = vector3(938.8054, -1521.2097, 31.0670 - 0.95), heading = 262.2843 },
            [4] = { pos = vector3(936.3239, -1521.1475, 31.0697 - 0.95), heading = 262.2843 },
        },
        processDelay = 5,                --in second
        requiredForProcess = 'pooch_bag', -- Set it false if you don't need any require item.(requiredForProcess = false)
        requiredForProcessLabel = 'Saco', --Any name
        removable = true,
        xItem = 'weed_leaf', xQuantity = 5, --xItem is the raw item and xQuantity is the required quantity for process
        xLabel = 'Erva',            --Any Name
        yItem = 'weed_pooch', yQuantity = 1, --yItem is the item after process and it's quantity is yQuantity
        yLabel = 'Saco de Erva',           --Any name
    },

    [2] = {
        collect = {
              --Drug collect points
            [1] = { pos = vector3(1248.2579, -3014.0757, 9.3193 - 0.95), heading = 260.4261, quantity = 1 },
            [2] = { pos = vector3(1248.1560, -3016.6487, 9.3193 - 0.95), heading = 301.9222, quantity = 1 },
            [3] = { pos = vector3(1248.1583, -3019.1907, 9.3193- 0.95), heading = 114.3717, quantity = 1 },
            [4] = { pos = vector3(1248.2587, -3021.8911, 9.3193 - 0.95), heading = 114.3717, quantity = 1 },
        },
        process = {
            [1] = { pos = vector3(-504.8848, -2702.8855, 8.7578 -0.95), heading = 246.0837 },
            [2] = { pos = vector3(-503.1181, -2704.7957, 8.7578 - 0.95), heading = 145.9290 },
            [3] = { pos = vector3(-501.4990, -2706.3628, 8.7578 - 0.95), heading = 262.2843 },
        },
        processDelay = 5,                --in second
        requiredForProcess = 'pooch_bag', -- Set it false if you don't need any require item.(requiredForProcess = false)
        requiredForProcessLabel = 'Saco', --Any name
        removable = true,
        xItem = 'meth_leaf', xQuantity = 5, --xItem is the raw item and xQuantity is the required quantity for process
        xLabel = 'Meta',            --Any Name
        yItem = 'meth_pooch', yQuantity = 1, --yItem is the item after process and it's quantity is yQuantity
        yLabel = 'Saco de Meta',           --Any name
    },

    
    [3] = {
        collect = {
              --Drug collect points
            [1] = { pos = vector3(1337.3535, 4361.8452, 44.3651 - 0.95), heading = 260.4261, quantity = 1 },
            [2] = { pos = vector3(1340.7402, 4358.6509, 44.3652 - 0.95), heading = 301.9222, quantity = 1 },
            [3] = { pos = vector3(1342.6882, 4356.6216, 44.3639 - 0.95), heading = 114.3717, quantity = 1 },
           
        },
        process = {
            [1] = { pos = vector3(2435.6665, 4965.7446, 42.3476 - 0.95), heading = 260.4261, quantity = 1 },
            [2] = { pos = vector3(2434.4458, 4963.9619, 42.3476 - 0.95), heading = 301.9222, quantity = 1 },
            [3] = { pos = vector3(2433.6372, 4968.9678, 42.3476 - 0.95), heading = 114.3717, quantity = 1 },
            [4] = { pos = vector3(2431.0093, 4970.6519, 42.3476 - 0.95), heading = 114.3717, quantity = 1 },
            [5] = { pos = vector3(2432.7061, 4972.0996, 42.3476 - 0.95), heading = 114.3717, quantity = 1 },
        },
        processDelay = 5,                --in second
        requiredForProcess = 'pooch_bag', -- Set it false if you don't need any require item.(requiredForProcess = false)
        requiredForProcessLabel = 'Saco', --Any name
        removable = true,
        xItem = 'cokebrick', xQuantity = 5, --xItem is the raw item and xQuantity is the required quantity for process
        xLabel = 'Cocaína',            --Any Name
        yItem = 'coke_pooch', yQuantity = 1, --yItem is the item after process and it's quantity is yQuantity
        yLabel = 'Saco de Cocaína',           --Any name
    }
}
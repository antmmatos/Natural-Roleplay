### How to open stored clothes

```LUA
CreateThread(function()
    TriggerEvent("rcore_clothes:openOutfits")
end)
```


### How to open shop via event

```LUA
CreateThread(function()
    local section =
    {
        pos = GetEntityCoords(PlayerPedId()),
        label = '👞',
        help = 'Press ~INPUT_CONTEXT~ to open shop menu',
        components = {
            {
                label = 'Shoes',
                name = 'shoes_1',
                from = 1,
                to = 88,
                current = 1,
                price = 150,
                reset = {
                    'shoes_2'
                },
            },
            {
                label = 'Shoes color',
                name = 'shoes_2',
                from = 0,
                to = 20,
                current = 1,
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
            taskHeading = 354.66
        },
        size = 1.2, --Default 1
        renderDistance = 10.0,
    }

    TriggerEvent("rcore_clothes:openMenu", section, 1, 1, false, true)
    --TriggerEvent("rcore_clothes:openMenu", section, sectionIndex, shopIndex, paid, saving)
end)
```

# loaf_motel
ESX motel system, works with weight &amp; item limit. Uses shells, which basically means it syncs perfectly between clients. You can store items and weapons, weapons are stored individually meaning ammo, components & weapon tint is saved.

## Requirements
* [loaf_keysystem](https://github.com/loaf-scripts/loaf_keysystem)
* [mythic_interiors](https://github.com/JustAnotherModder/mythic_interiors)
* An ESX server with [esx_addoninventory](https://github.com/esx-framework/esx_addoninventory) & [esx_datastore](https://github.com/esx-framework/esx_datastore)
* GlobalState, either use [loaf_globalstate](https://github.com/loaf-scripts/loaf_globalstate) or OneSync

## Installation
1. Install everything from requirements and add loaf_motel to your resource folder
2. Add the following to your server.cfg
    ```cfg
    ensure loaf_keysystem
    ensure mythic_interiors
    ensure loaf_globalstate #only if you aren't using OneSync
    ensure loaf_motel
    ```
3. Run the provided SQL file
4. Done!

## Configuration
* `Use3DText` if 3D text should be used, allowed values: [true](https://i.gyazo.com/29dbcb68efe6ecdbfa545cc073ab5b54.png), [false](https://i.gyazo.com/63cc5e9497ac86221611f98ce496b6fa.png) & [nil](https://i.gyazo.com/1a1fa9e5210c675bf625dced112ed1aa.png)
* `Markers`: 
    ```lua
    Enabled = true, -- if markers should be shown
    Colour = {r = 255, g = 240, b = 0, a = 200}, -- the RGBA (Red, Green, Blue, Alpha) colour of markers
    Owned = {r = 15, g = 255, b = 150, a = 200}, -- the RGBA colour of the marker for owned motel room
    ```
* `Options`:
    ```lua
    Align = "center", -- the default menu alignment
    Control = 51, -- the default control, 51 = E
    ```
* `Blips`:
    ```lua
    Enabled = true, -- should blips be enabled? (true or false)
    Sprite = 475, -- the blip sprite
    Colour = 0, -- the blip colour
    Scale = 0.6, -- the blip scale
    ```
* `Storage`:
    ```lua
    Limit = false, -- limit the amount/weight of items you can store?
    Limits = {
        500, -- 500 items/kg for instance 1
        1000, -- 1000 items/kg for instance 2
    },
    Weapons = true, -- allow people to store weapons?
    WeaponWeight = 10, -- how many slots/kg a weapon takes up
    ```
* `Prices`:
    ```lua
    500, -- rent for interior 1, if rent is enabled.
    1000, -- rent for interior 2, if rent is enabled.
    ```
That's the main things you should change, the other things aren't necessary to edit

Note: By default there's only 1 interior, more interiors will come in future updates, and will need to be purchased.
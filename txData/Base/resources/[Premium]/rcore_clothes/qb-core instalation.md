### i cant run it on qbcore, what am i missing???

First and last step is to add this code into "qb-clothing/client/main.lua"<br>
**Warning**: This event handler has to be on bottom of the file main.lua otherwise it wont work!
```LUA
AddEventHandler("skinchanger:getSkin",function(cb)
    cb(skinData)
end)
```
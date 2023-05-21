local blips = {
    { size = 0.7, title = "Esquadra da DPLS", colour = 29, id = 60,  x = 425.130,   y = -979.558, z = 30.711 },
    { size = 0.7, title = "Hospital",         colour = 2,  id = 61,  x = 312.22,    y = -592.88,  z = 43.28 },
    { size = 0.7, title = "Shisha Lounge",    colour = 76, id = 205, x = -428.8381, y = -24.2470, z = 46.2281 },
    { size = 0.7, title = "Benny's",    colour = 17, id = 446, x = -215.4908, y = -1326.3571, z = 31.2953 },
    { size = 0.7, title = "Redline",    colour = 1, id = 402, x = -582.2872, y = -930.7614, z = 36.8323 },
}

Citizen.CreateThread(function()
    for k, v in pairs(blips) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, v.id)
        SetBlipScale(blip, v.size)
        SetBlipColour(blip, v.colour)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.title)
        EndTextCommandSetBlipName(blip)
    end
end)

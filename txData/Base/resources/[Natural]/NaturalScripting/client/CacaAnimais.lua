local Animals = {
    "a_c_boar", "a_c_deer", "a_c_hen", "a_c_mtlion"
}

local animalModels = {}
local animalsSpawnedCount = 0
Citizen.CreateThread(function()
    for i, animal in pairs(Animals) do
        table.insert(animalModels, animal)
    end
    while true do
        Citizen.Wait(100)
        local pos = GetEntityCoords(PlayerPedId())
        local land = false
        local X, Y, ZLoc = 0, 0, 0

        if Vdist(pos.x, pos.y, pos.z, -720.4648, 5085.1392, 137.7326) < 100 then
            if animalsSpawnedCount < 75 then
                X = -720.4648
                Y = 5085.1392
                ZLoc = 137.7326
                local r = math.random(1, #animalModels)
                local pedModel = GetHashKey(animalModels[r])
                if not pedModel then return end
                RequestModel(pedModel)
                while not HasModelLoaded(pedModel) or not HasCollisionForModelLoaded(pedModel) do
                    Wait(100)
                end
                posX = X + math.random(-150, 150)
                posY = Y + math.random(-150, 150)
                Z = ZLoc + 999.0
                land, posZ = GetGroundZFor_3dCoord(posX + .0, posY + .0, Z, 1)
                if land then
                    entity = CreatePed(5, pedModel, posX, posY, posZ, 0.0, true, false)
                    animalsSpawnedCount = animalsSpawnedCount + 1
                    TaskWanderStandard(entity, true, true)
                    SetEntityAsMissionEntity(entity, true, true)
                    exports["core_job_hunter"]:AddToEntities(entity)
                end
            else
                Citizen.Wait(1000)
            end
        else
            Citizen.Wait(5000)
            animalsSpawnedCount = 0
        end
    end
end)

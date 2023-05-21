local _isCloseToCayo = false

local _isCayoMinimapLoaded = false

Citizen.CreateThread(function()
    while true do
        local isCloseToCayo = #(GetEntityCoords(PlayerPedId()) - vector3(4858.0, -5171.0, 2.0)) < 2200.0

        if _isCloseToCayo ~= isCloseToCayo then
            _isCloseToCayo = isCloseToCayo
            _isCayoMinimapLoaded = isCloseToCayo

            SetToggleMinimapHeistIsland(_isCloseToCayo)
        end

        Wait(5000)
    end
end)

CreateThread(function()
    while true do
        local wait = 1000

        if IsPauseMenuActive() and not IsMinimapInInterior() then
            if _isCayoMinimapLoaded then
                _isCayoMinimapLoaded = false
                SetToggleMinimapHeistIsland(false)
            end
            SetRadarAsExteriorThisFrame()
            SetRadarAsInteriorThisFrame(GetHashKey("h4_fake_islandx"), 4700.0, -5145.0, 0, 0)
            wait = 0

        elseif not _isCayoMinimapLoaded and _isCloseToCayo then
            _isCayoMinimapLoaded = true
            SetToggleMinimapHeistIsland(true)
        end
        Wait(wait)
    end
end)

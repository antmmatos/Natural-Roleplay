CurrentWeather = 'EXTRASUNNY'
local lastWeather = CurrentWeather
local baseTime = 8
local timeOffset = 0
local timer = 0
local blackout = false

RegisterNetEvent('vSync:updateWeather')
AddEventHandler('vSync:updateWeather', function(NewWeather, newblackout)
    CurrentWeather = NewWeather
    blackout = newblackout
end)

local weatherEnabled = true

Citizen.CreateThread(function()
    while true do
        if weatherEnabled then
            SetWeatherTypeOverTime("EXTRASUNNY", 15.0)
            Citizen.Wait(1000)
            SetArtificialLightsState(blackout)
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            SetWeatherTypePersist(lastWeather)
            SetWeatherTypeNow(lastWeather)
            SetWeatherTypeNowPersist(lastWeather)
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        else
            Citizen.Wait(1000)
        end
    end
end)

RegisterNetEvent('vSync:updateTime')
AddEventHandler('vSync:updateTime', function(base, offset, freeze)
    timeOffset = offset
    baseTime = base
end)

Citizen.CreateThread(function()
    local hour = 0
    local minute = 0
    while true do
        if weatherEnabled then
            Citizen.Wait(250)
            local newBaseTime = baseTime
            if GetGameTimer() - 500 > timer then
                newBaseTime = newBaseTime + 0.25
                timer = GetGameTimer()
            end
            baseTime = newBaseTime
            hour = math.floor(((baseTime + timeOffset) / 60) % 24)
            minute = math.floor((baseTime + timeOffset) % 60)
            NetworkOverrideClockTime(hour, minute, 0)
        else
            Citizen.Wait(1000)
        end
    end
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('vSync:requestSync')
end)

function ShowNotification(text, blink)
    if blink == nil then blink = false end
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(blink, false)
end

RegisterNetEvent('vSync:notify')
AddEventHandler('vSync:notify', function(message, blink)
    ShowNotification(message, blink)
end)

RegisterNetEvent("ToggleWeatherSync")
AddEventHandler("ToggleWeatherSync", function(toggle)
    weatherEnabled = toggle
end)

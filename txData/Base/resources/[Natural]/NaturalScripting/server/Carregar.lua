local carrying = {}
local carried = {}

RegisterServerEvent("Natural:Carregar:Server:Sync")
AddEventHandler("Natural:Carregar:Server:Sync", function(targetSrc)
    local source = source
    local sourcePed = GetPlayerPed(source)
    local sourceCoords = GetEntityCoords(sourcePed)
    local targetPed = GetPlayerPed(targetSrc)
    local targetCoords = GetEntityCoords(targetPed)
    if #(sourceCoords - targetCoords) <= 3.0 then
        TriggerClientEvent("Natural:Carregar:Client:Sync", targetSrc, source)
        carrying[source] = targetSrc
        carried[targetSrc] = source
    end
end)

RegisterServerEvent("Natural:Carregar:Server:Stop")
AddEventHandler("Natural:Carregar:Server:Stop", function(targetSrc)
    local source = source

    if carrying[source] then
        TriggerClientEvent("Natural:Carregar:Client:Stop", targetSrc)
        carrying[source] = nil
        carried[targetSrc] = nil
    elseif carried[source] then
        TriggerClientEvent("Natural:Carregar:Client:Stop", carried[source])
        carrying[carried[source]] = nil
        carried[source] = nil
    end
end)

AddEventHandler('playerDropped', function(reason)
    local source = source

    if carrying[source] then
        TriggerClientEvent("Natural:Carregar:Client:Stop", carrying[source])
        carried[carrying[source]] = nil
        carrying[source] = nil
    end

    if carried[source] then
        TriggerClientEvent("Natural:Carregar:Client:Stop", carried[source])
        carrying[carried[source]] = nil
        carried[source] = nil
    end
end)

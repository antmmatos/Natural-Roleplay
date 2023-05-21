RegisterServerEvent("Natural:Server:Desmanche:Sync")
AddEventHandler("Natural:Server:Desmanche:Sync", function (vehicle, state)
    TriggerClientEvent("Natural:Client:Desmanche:Sync", -1, vehicle, state)
end)

RegisterServerEvent("Natural:Server:Desmanche:Porta")
AddEventHandler("Natural:Server:Desmanche:Porta", function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem("arma_mola", math.random(2, 4))
    xPlayer.addInventoryItem("aluminio", math.random(5, 15))
    xPlayer.addInventoryItem("screw", math.random(10, 20))
end)

RegisterServerEvent("Natural:Server:Desmanche:Roda")
AddEventHandler("Natural:Server:Desmanche:Roda", function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem("screw", math.random(2, 5))
    xPlayer.addInventoryItem("aluminio", math.random(2, 4))
end)

RegisterServerEvent("Natural:Server:Desmanche:Other")
AddEventHandler("Natural:Server:Desmanche:Other", function ()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem("lithium", math.random(2, 4))
    xPlayer.addInventoryItem("acetone", math.random(2, 4))
    xPlayer.addInventoryItem("screw", math.random(10, 15))
    xPlayer.addInventoryItem("nail", math.random(5, 15))
end)

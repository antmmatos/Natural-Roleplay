function sendWebhookMessage(webhook, message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers)
        end, 'POST', json.encode({ content = message }), { ['Content-Type'] = 'application/json' })
    end
end

function canChopVehicleModel(model) -- checa se o veículo pode ser desmanchado pela hash
    if not cfg.prohibiteVehicles[model] then
        return true
    end
    return false
end

local vehicleGlobal = {}                                                         -- tabela global de veículos
local vehicleList = MySQL.query.await("SELECT * FROM okokvehicleshop_vehicles") -- tabela global de veículos
for k, v in pairs(vehicleList) do
    vehicleGlobal[GetHashKey(v.vehicle_id)] = { price = v.max_price, name = v.vehicle_name }
end

function getVehiclePrice(actualChop, model) -- função que checa o valor do veículo com base na hash
    for k, v in pairs(vehicleGlobal) do
        if vehicleGlobal[model] == model then
            return (vehicleGlobal[model].price or 0) * cfg.locs[actualChop].paymentMultiplier / 100
        end
    end
    return false
end

function hasPlayerPermission(source, actualChop)
    return true
end

function canChopVehiclePlate(source, model, plate) -- checagem se o usuário pode desmanchar o veículo com base na placa dele (não podendo se for dele mesmo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetIdentifier = MySQL.scalar.await("SELECT owner FROM owned_vehicles WHERE plate = ?", { plate })
    if not cfg.autoChop then
        if xPlayer.identifier == targetIdentifier.owner then
            xPlayer.showNotification('Você não pode desmanchar seu próprio veículo!')
            return false
        end
    end
    if xPlayer then
        local vehicle = MySQL.scalar.await("SELECT stored FROM owned_vehicles WHERE plate = ?", { plate })
        if vehicle then
            if parseInt(vehicle.stored) == 2 or parseInt(vehicle.stored) == 1 then
                TriggerClientEvent('suricato_desmanche:notify', source, 'negado', messages.thisVehicleIsAlreadyStopped)
                return false
            end
        end
    end
    return true
end

function givePayment(actualChop, source, vehicleModel) -- função chamada ao final do desmanche para pagar o usuário quem fez o desmanche
    bruteforceDeleteObjects(source)
    local price = getVehiclePrice(actualChop, vehicleModel)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney("black_money", price)
    if type(cfg.locs[actualChop].prizeItems) == 'table' then
        for item, quantity in pairs(cfg.locs[actualChop].prizeItems) do
            xPlayer.giveInventoryItem(item, quantity)
        end
    end
    TriggerClientEvent('suricato_desmanche:notify', source, 'sucesso',
        'Você recebeu €' .. format(price) .. ' por desmanchar o veículo!')
end

function setVehicleAsStopped(plate)
    MySQL.execute("UPDATE owned_vehicles SET stored = 2 WHERE plate = ?", { plate })
end

function getVehicleNameByModel(vehicleModel) -- função que retorna o nome do carro com base na hash
    for k, v in pairs(vehicleGlobal) do
        if vehicleGlobal[vehicleModel] then
            return vehicleGlobal[vehicleModel].name
        end
    end
    return false
end

function startChop(source, vehNet, model, plate, participants, actualChop)
    local participantsIds = {}
    for _, source in pairs(participants) do
        table.insert(participantsIds, source)
    end
    -- LOG
end

function deleteVehicle(vehNet)
    local vehicle = NetworkGetEntityFromNetworkId(vehNet)
    if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
    end
end

function deleteObject(objNet)
    TriggerClientEvent('suricato_desmanche:deleteObject', -1, objNet)
    SetTimeout(100, function()
        local object = NetworkGetEntityFromNetworkId(objNet)
        if DoesEntityExist(object) then
            DeleteEntity(object)
        end
    end)
end

local chopProps = {
    [`v_ind_cf_shelf2`] = true,
    [`imp_prop_impexp_car_door_01a`] = true,
    [`imp_prop_impexp_trunk_02a`] = true,
    [`imp_prop_impexp_trunk_01a`] = true,
    [`imp_prop_impexp_tyre_01a`] = true,
    [`prop_carjack`] = true
}

function bruteforceDeleteObjects(source)
    local ped = GetPlayerPed(source)
    local cds = GetEntityCoords(ped)
    local allObjects = GetAllObjects()
    for _, object in pairs(allObjects) do
        local objectCds = GetEntityCoords(object)
        local distance = #(cds - objectCds)
        if distance < 30 and chopProps[GetEntityModel(object)] then
            DeleteEntity(object)
            local objNet = NetworkGetNetworkIdFromEntity(object)
            TriggerClientEvent('suricato_desmanche:deleteObject', -1, objNet)
        end
    end
end

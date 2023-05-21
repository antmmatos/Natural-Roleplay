RegisterNetEvent('suricato_desmanche:notify', function(type, text)
    notify(type, text)
end)

function notify(type, text)
    if type == 'sucesso' then
        type = 'success'
    elseif type == 'negado' then
        type = 'error'
    elseif type == 'aviso' then
        type = 'warning'
    end
    ESX.ShowNotification(text)
end

RegisterNetEvent('suricato_desmanche:deleteVehicle', function(vehNet) -- sync para deletar veículo (não deletado pelo server por incompatibilidade com alguns anticheats)
    if NetworkDoesNetworkIdExist(vehNet) then
        local vehicle = NetToVeh(vehNet)
        if vehicle and DoesEntityExist(vehicle) then
            SetEntityAsMissionEntity(vehicle, true, true)
            NetworkRequestControlOfEntity(vehicle)
            DeleteEntity(vehicle)
        end
    end
end)

RegisterNetEvent("suricato_desmanche:deleteObject", function(objNet) -- sync para deletar veículo (não deletado pelo server por incompatibilidade com alguns anticheats)
    local object = NetToObj(objNet)
    
    SetEntityAsMissionEntity(object,true,true)
    NetworkRequestControlOfEntity(object)
    DeleteEntity(object)
end)
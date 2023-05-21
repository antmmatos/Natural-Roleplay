RegisterCommand('rebocar', function(source)
    local job = ESX.GetPlayerFromId(source).job.name
    if job ~= 'bennys' and job ~= 'redline' then
        return
    end
	TriggerClientEvent("Natural:Client:Tow", source)
end, false)
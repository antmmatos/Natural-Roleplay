ESX.RegisterUsableItem('handcuffs', function(source)
    if ESX.GetPlayerFromId(source).job.name == 'police' then
        TriggerClientEvent('jobs_creator:actions:hardHandcuff', source)
    else
        TriggerClientEvent("jobs_creator:actions:softHandcuff", source)
    end
end)
local sharedObject = GetSharedObject()
OnObjectLoaded(function()
    if Config.Framework.Active == FrameworkType.ESX then

        function GetPlayerId(source)
            local xPlayer = sharedObject.GetPlayerFromId(source)
            return xPlayer.identifier
        end

        function GetDataStore(source, dataStoreName, cb)
            local xPlayer = sharedObject.GetPlayerFromId(source)
            TriggerEvent(Config.ESXCallbacks['esx_datastore:getDataStore'] or "esx_datastore:getDataStore", dataStoreName, xPlayer.identifier, cb)
        end
    end

    if Config.Framework.Active == FrameworkType.QB_CORE then
        function GetPlayerId(source)
            local Player = sharedObject.Functions.GetPlayer(source)
            if not Player then
                return nil
            end
            return Player.PlayerData.citizenid
        end
    end
end)

if not Config.UseESXDataStore then
    function RewriteOldOutfitKey(identifier, debug)
        local oldId = identifier .. "_saved_ouftis"
        local id = "saved_ouftis:" .. identifier

        local oldOutfits = GetResourceKvpString(oldId)
        if oldOutfits ~= nil then
            SetResourceKvp(id, oldOutfits)
            DeleteResourceKvp(oldId)
            if debug then
                print("Converting an old KVP to new one for identifier: " .. identifier)
            end
        end
    end

    function DeleteOutfitsForUser(identifier)
        RewriteOldOutfitKey(identifier)
        DeleteResourceKvp("saved_ouftis:" .. identifier)
    end

    AddEventHandler(triggerName('clearSavedOutfits'), function(plId)
        local identifier = ""
        if tonumber(plId) > 0 then
            if Config.Framework.Active == FrameworkType.ESX then
                identifier = sharedObject.GetPlayerFromId(plId).identifier
            end

            if Config.Framework.Active == FrameworkType.QB_CORE then
                identifier = sharedObject.Functions.GetPlayer(plId).PlayerData.citizenid
            end

            DeleteOutfitsForUser(identifier)
        end
    end)

    RegisterCommand("convertkvp", function(source, args, raw)
        if source == 0 then
            print("starting the command")

            if Config.Framework.Active == FrameworkType.ESX then
                local result = MySQL.Sync.fetchAll("SELECT * FROM `users`", { })

                for k,v in pairs(result) do
                    RewriteOldOutfitKey(v.identifier, true)
                end
            end

            if Config.Framework.Active == FrameworkType.QB_CORE then
                local result = MySQL.Sync.fetchAll("SELECT * FROM `players`", { })

                for k,v in pairs(result) do
                    RewriteOldOutfitKey(v.citizenid, true)
                end
            end

            print("ending the command")
        end
    end)

    RegisterCommand('wipeclothesforuser', function(source, args, raw)
        if source == 0 then
            if args[1] == nil then
                print("You need to use /wipeclothesforuser identifier")
                return
            end

            if tonumber(args[1]) then
                local identifier = ""
                if Config.Framework.Active == FrameworkType.ESX then
                    identifier = sharedObject.GetPlayerFromId(tonumber(args[1])).identifier
                end

                if Config.Framework.Active == FrameworkType.QB_CORE then
                    identifier = sharedObject.Functions.GetPlayer(tonumber(args[1])).PlayerData.citizenid
                end

                DeleteOutfitsForUser(identifier)
                print("Deleted all clothes data for user: ", identifier)
                else
                DeleteOutfitsForUser(args[1])
                print("Deleted all clothes data for user: ", args[1])
            end
        end
    end, false)

    RegisterCommand('wipeallclothes', function(source, args, raw)
        if source == 0 then
            if args[1] == nil then
                print("Warning if you write this command all saved clothes will be deleted if you wish to stil continue type command /wipeallclothes yes")
                return
            end

            local kvpHandle = StartFindKvp('saved_ouftis:')

            if kvpHandle ~= -1 then
                local key

                repeat
                    Wait(0)
                    key = FindKvp(kvpHandle)

                    if key then
                        DeleteResourceKvp(key)
                    end
                until key

                EndFindKvp(kvpHandle)
            end

        end
    end, false)
end
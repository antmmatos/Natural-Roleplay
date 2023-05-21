local base = {}

function base.createScreenEmbed(source, settings)
    if source then
        local status = GetResourceState('discord-screenshot')
        if status == 'started' or status == 'starting' and source then
            local p = promise.new()

            exports['discord-screenshot']:requestCustomClientScreenshotUploadToDiscord(
                source,
                webhook,
                {
                    encoding = 'png',
                    quality = 1
                },
                {
                    username = settings.customization.username,
                    avatar_url = settings.customization.avatar
                },
                30000,
                function() 
                    p:resolve()
                end
            )

            return Citizen.Await(p)
        else
            print('[^1'..GetCurrentResourceName()..'^0] Falha ao capturar printscreen. O script "discord-screenshot" não foi encontrado ou o usuário não foi encontrado!')
        end
    end
end

-- local groupSpectate = ''

-- para os que usam mqcu e estão sendo banidos por spectador:

-- crie um grupo com a permissao de bypass para spectate:

-- ['Invasao'] = {
--     'player.spec'
-- },

-- coloque o nome do grupo na variável 'groupSpectate'
-- descomente os códigos dentro dos eventos

-- local Proxy = _G['lib/Proxy'..".lua"]()
-- local vRP = Proxy.getInterface('vRP')

RegisterNetEvent('invasao:onPlayerEnter', function(source, team)
    -- evento de entrada

    -- local user_id = vRP.getUserId(source)

    -- if user_id then 
    --     vRP.addUserGroup(user_id, groupSpectate)
    -- end 
end)

RegisterNetEvent('invasao:onPlayerLeave', function(source, team)
    -- evento de saída

    -- local user_id = vRP.getUserId(source)
    
    -- if user_id then 
    --     vRP.removeUserGroup(user_id, groupSpectate)
    -- end 
end)

return base
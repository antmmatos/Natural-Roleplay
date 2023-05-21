-- local Proxy = _G['lib/Proxy'..".lua"]()
-- local Tunnel = _G['lib/Tunnel'..".lua"]()
-- local vRP = Proxy.getInterface('vRP')
-- local vRPclient = Tunnel.getInterface('vRP')

local base = {}

function base.checkCommand(source, mode)
    -- coloque as verificações que quiser
    -- retorne falsy value para bloquear o jogador de participar 

    -- INSTALAÇÃO (OPCIONAL, SE O SCRIPT USAR DIMENSÕES, E TER POTENCIAL DE BUGS)
        -- Adicionar dependência de verificação do script de HOMES

    return true
end

function base.collectInfos(source, infos) 
    -- função com o conceito de:
    -- pegar o segundo argumento (type table) e adicionar todas as informações extras que você quiser de entrada do jogador
    -- também servirá para retirar tudo do jogador (que não servirá ou será perdido se ir pro jogo) 
    -- ou adicionar informações para a source do jogador. 
    -- Exemplo de como retirar armas:

    --[[
        infos.weapons = vRPclient.replaceWeapons(source, {}) 
    ]] 

    Player(source).state:set('inRoyale', true, true) -- State Bag para facilitar a intervenção nos scripts

    -- INSTALAÇÃO (OPCIONAL, SE TER MQCU)
        --[[
            -- Groups (vRPEX): 
            --  ['Royale'] = { 'player.spec' },

            vRP.addUserGroup(vRP.getUserId(source), 'Royale')
        ]]
end 

function base.restoreInfos(source, infos, dropped, stopped)
    -- função com o conceito de:
    -- pegar o segundo argumento (type table) com as mesmas infos colocadas no "collectInfos"
    -- e assim restaurar os itens retirados do jogador no início do jogo

    if not dropped then 
        Citizen.SetTimeout(1000, function()
            Player(source).state:set('inRoyale', false, true) -- State Bag para facilitar a intervenção nos scripts
            
            --[[
                vRPclient._giveWeapons(source, infos.weapons) 
        
                local userId = vRP.getUserId(source)
            
                if userId then 
                    vRP.removeUserGroup(userId, 'Royale')
                end 
            ]]
        end)
    end 

    -- INSTALAÇÃO (OPCIONAL, SE TER MQCU)
        --[[
            -- Esse id pode não existir, então a alternativa mais simples é adicionar esse código na função de deleção dos caches da framework: 

            if Player(source).state.inRoyale then 
                vRP.removeUserGroup(user_id, 'Royale')
            end 
        ]]
end

function base.createVehicle(modelHash, coordinates, heading)
    return Citizen.InvokeNative(GetHashKey('CREATE_AUTOMOBILE'), modelHash, coordinates, heading)
end

function base.deleteVehicle(entity)
    if DoesEntityExist(entity) then 
        DeleteEntity(entity)
    end
end

return base
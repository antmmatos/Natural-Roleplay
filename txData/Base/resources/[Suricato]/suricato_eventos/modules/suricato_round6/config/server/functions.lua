RegisterNetEvent('round6:onPlayerWin', function(source) -- Evento de vitória (source é do campeão)
end)

RegisterNetEvent('round6:onPlayerJoin', function() -- Atribua a ação a entrada no jogador no evento
    local source = source
end)

RegisterNetEvent('round6:onPlayerExit', function() -- Atribua a ação a saida no jogador no evento (lembre-se que se ele quitar, esse evento não será trigado)
    local source = source
end)

-- Descomente abaixo caso use vRP e comente acima;
-- Caso use MQCU, dê install no console quando iniciar o servidor e crie um grupo com a permissão spec.permissao ou player.spec (Depende da base)

--[[
local Proxy = _G['lib/Proxy'..".lua"]()
local vRP = Proxy.getInterface('vRP')

RegisterNetEvent('round6:onPlayerJoin', function() -- Atribua a ação a entrada no jogador no evento
    local source = source
    local user_id = vRP.getUserId(source)
    vRP.addUserGroup(user_id,'Round6')
end)

RegisterNetEvent('round6:onPlayerExit', function() -- Atribua a ação a saida no jogador no evento (lembre-se que se ele quitar, esse evento não será trigado)
    local source = source
    local user_id = vRP.getUserId(source)
    vRP.removeUserGroup(user_id,'Round6')
end)

RegisterNetEvent('round6:onPlayerWin', function(source) -- Evento de vitória (source é do campeão)
end)
]]
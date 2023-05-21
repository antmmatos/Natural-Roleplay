local Tunnel = _G["lib/Tunnel"..".lua"]()
local Proxy = _G["lib/Proxy"..".lua"]()
local vRP = Proxy.getInterface("vRP")
local fromServer = Tunnel.getInterface(GetCurrentResourceName())

function getPlayersOnline()
    return fromServer.getPlayersOnline()
end

function isPlayerReferenceOnline(playerId)
    return fromServer.isPlayerReferenceOnline(playerId)
end

function getPlayerServerReference()
    return fromServer.getPlayerServerReference()
end
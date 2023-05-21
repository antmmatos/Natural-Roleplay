----==={ CONEXÃO }===----

Resource = GetCurrentResourceName()
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

fServer = Tunnel.getInterface(Resource)

tServer = {}
Tunnel.bindInterface(Resource,tServer)

----==={ CONFIGURAÇÕES CLIENT-SIDE }===----
RegisterNetEvent('suricato_roubos:updateRobbery')

config = {
    executeHacking = function(self, minigame)
        if minigame == 1 then 
            local state = GetResourceState('mhacking')
            if state == 'started' or state == 'starting' then 
                local p = promise.new()
                local ped = PlayerPedId()
                FreezeEntityPosition(ped, true)
                self:blockControls(true)
                TriggerEvent('mhacking:seqstart', 4, 20, function(s, t)
                    p:resolve(s, t)
                end)
                FreezeEntityPosition(ped, false)
                self:blockControls(false)
                return Citizen.Await(p)
            end
            return true
        elseif minigame == 2 then 
            local state = GetResourceState('ultra-voltlab')
            if state == 'started' or state == 'starting' then 
                local p = promise.new()
                local ped = PlayerPedId()
                FreezeEntityPosition(ped, true)
                self:blockControls(true)
                TriggerEvent('ultra-voltlab', 30, function(s, r)
                    p:resolve(s == 1, r)
                end)
                FreezeEntityPosition(ped, false)
                self:blockControls(false)
                return Citizen.Await(p)
            end
            return true
        end
    end,
    getScaleform = function()
        if not isAlive and not spectating then -- tela preta
            AnimpostfxPlay("DeathFailOut")
        else
            AnimpostfxStop("DeathFailOut")
        end

        PlaySoundFrontend(-1, "Bed", "WastedSounds", 1) -- som
        ShakeGameplayCam("DEATH_FAIL_IN_EFFECT_SHAKE", 1.0) -- tela de lado

        local scaleform;
        
        RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
        
        while not HasScaleformMovieLoaded(scaleform) do
            scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
            Wait(0)
        end

        if HasScaleformMovieLoaded(scaleform) then
            Wait(0)
            PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
            BeginTextComponent("STRING")
            AddTextComponentString("~r~você morreu")
            EndTextComponent()
            PopScaleformMovieFunctionVoid()
            Wait(500)
            PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
        end

        return scaleform
    end,
    isAlive = function(entity)
        return GetEntityHealth(entity) > 101
    end,
    killEntity = function(entity) -- FUNÇÃO QUE MANTERÁ MORTO
        SetEntityHealth(entity, 101)
    end,
    setArmour = function(entity, armour) -- FUNÇÃO PARA SETAR O COLETE DO JOGADOR ( O ANTICHEAT PODE ACUSAR DE HACK O CLIENT QUE USE A NATIVA, ENTÃO SE SEU ANTICHEAT POSSUI UM ANATIVA PRÓPRIA PARA SETAR O ARMOUR DO JOGADOR, COLOQUE-A NA FUNÇÃO )
        if tonumber(armour) and DoesEntityExist(entity) then
            SetPedArmour(entity, parseInt(armour))
        end
    end,
    stopAnim = function() -- FUNÇÃO PARA PARAR A ANIMAÇÃO DE UM PLAYER
        ClearPedTasks(PlayerPedId())
    end,
    blockControls = function(self, status)
        self.blocked = status
        CreateThread(function()
            while self.blocked do 
                BlockWeaponWheelThisFrame()
                DisablePlayerFiring(PlayerId(), true)
                DisableControlAction(0,29,true)
                DisableControlAction(0,38,true)
                DisableControlAction(0,47,true)
                DisableControlAction(0,56,true)
                DisableControlAction(0,57,true)
                DisableControlAction(0,73,true)
                DisableControlAction(0,137,true)
                DisableControlAction(0,166,true)
                DisableControlAction(0,167,true)
                DisableControlAction(0,169,true)
                DisableControlAction(0,170,true)
                DisableControlAction(0,182,true)
                DisableControlAction(0,187,true)
                DisableControlAction(0,188,true)
                DisableControlAction(0,189,true)
                DisableControlAction(0,190,true)
                DisableControlAction(0,243,true)
                DisableControlAction(0,245,true)
                DisableControlAction(0,257,true)
                DisableControlAction(0,288,true)
                DisableControlAction(0,289,true)
                DisableControlAction(0,311,true)
                DisableControlAction(0,344,true)
                Wait(0)
            end
        end)
    end,
    setInvincible = function(entity,bool) -- FUNÇÃO PARA SETAR UM JOGADOR COMO INVENCÍVEL, ISSO PODE SER BARRADO EM ALGUNS ANTICHEAT, SE ACONTECER ALGO, É POSSÍVEL COMENTAR ESSA FUNÇÃO (NÃO COMENTE O NOME, E SIM O QUE ELA FARÁ, DEIXANDO ELA VAZIA)
        if entity and type(bool) == 'boolean' then
            SetEntityInvincible(entity, bool)
        end
    end,
    setVisible = function(entity, bool) -- FUNÇÃO PARA SETAR UM JOGADOR COMO VISÍVEL/INVISÍVEL, SE SEU ANTI-CHEAT ACUSA ISSO COMO HACK, E A PERMISSÃO PARA MECHER NOS MENUS DE ADMIN NÃO TEM IMUNIDADE, PODE COMENTAR. (SÓ A PERMISSAO PARA MEXER NO MENU ADMIN VAI UTILIZAR DISSO)
        if entity and type(bool) == 'boolean' then
            SetEntityVisible(entity, bool)
        end
    end,
    format = function(n)
        local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
        return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse())..right
    end,
    drawMarker = function(cds, distance) 
        DrawMarker(21,cds.x,cds.y,cds.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,100,0,0,0,1)
        if distance < 1.5 then
            DrawText3D(cds.x,cds.y,cds.z, 'PRESSIONE ~r~E ~w~PARA ROUBAR')
        end
    end,
    checkProximity = function(pedCoords, robCoords) 
        local distance = #( pedCoords - robCoords )
        if distance <= 150 then 
            TriggerServerEvent('suricato_roubos:warnProximityCops')

            return true 
        else
            return false
        end
    end
}

function tServer.killPlayer()
    config.killEntity(PlayerPedId())
end

function tServer.setPosition(vector)
    SetEntityCoords(PlayerPedId(),vector)
end

function tServer.isAlive()
    return config.isAlive(PlayerPedId())
end

RegisterCommand('roubos', function() 
    if type(RobberyPoints) == 'table' then 
        for k,v in ipairs(RobberyPoints) do 
            local blip = AddBlipForCoord(v.cds.x, v.cds.y, v.cds.z)

            if DoesBlipExist(blip) then
                SetBlipScale(blip,0.3)
                SetBlipSprite(blip,1)
                SetBlipColour(blip,1)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Roubo: ~r~"..tostring(v.preset))
                EndTextCommandSetBlipName(blip)
                SetBlipAsShortRange(blip,true)
            end

            SetTimeout(15 * 1000, function()
                RemoveBlip(blip)
            end)
        end 
    end 
end)

return config
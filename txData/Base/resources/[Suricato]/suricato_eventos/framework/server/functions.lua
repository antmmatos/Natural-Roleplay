local base = {}

local Proxy = _G['lib/Proxy'..".lua"]()
local vRP = Proxy.getInterface('vRP')
local cfg = require('config/config')

vRP._prepare('createInvasionDatabase', [==[CREATE TABLE IF NOT EXISTS `suricato_invasao_appointments` (`id` INT(11) NOT NULL AUTO_INCREMENT,`name` VARCHAR(50) NULL DEFAULT 'Invasão' COLLATE 'latin1_swedish_ci',`projection` LONGTEXT NULL DEFAULT '{}' COLLATE 'utf8mb4_bin',`object` LONGTEXT NULL DEFAULT '{}' COLLATE 'utf8mb4_bin',`date` TIMESTAMP NULL DEFAULT NULL,PRIMARY KEY (`id`) USING BTREE,CONSTRAINT `projection` CHECK (json_valid(`projection`)))COLLATE='latin1_swedish_ci'ENGINE=InnoDB;]==])
vRP._prepare('insertMarkedInvasion', 'INSERT INTO suricato_invasao_appointments (`name`, `projection`, `date`) VALUES (@name, @projection, @date)')
vRP._prepare('getInvasions', 'SELECT `id`, `name`, `object`, UNIX_TIMESTAMP(`date`) AS `date` FROM suricato_invasao_appointments ORDER BY UNIX_TIMESTAMP(`date`) DESC LIMIT 25')
vRP._prepare('selectLastInsert', 'SELECT `id` FROM suricato_invasao_appointments ORDER BY `id` DESC LIMIT 1')
vRP._prepare('updateInvasion', 'UPDATE suricato_invasao_appointments SET `object` = @object WHERE `id` = @id')
vRP._prepare('deleteInvasion', 'DELETE FROM suricato_invasao_appointments WHERE `id` = @id')
vRP._prepare('getMarkedInvasions', 'SELECT `id`, `name`, `projection`, UNIX_TIMESTAMP(`date`) AS `date` FROM suricato_invasao_appointments WHERE UNIX_TIMESTAMP(`date`) > @timestamp')

function base.createDatabase()
    return vRP.execute('createInvasionDatabase')
end

function base.getMarkedInvasions()
    local consult = vRP.query('getMarkedInvasions', { timestamp = os.time() })
    for i in ipairs(consult) do 
        consult[i].projection = json.decode(consult[i].projection)
    end
    return consult
end

function base.getInvasions()
    local consult = vRP.query('getInvasions', {})
    for i in ipairs(consult) do 
        consult[i].projection = json.decode(consult[i].projection)
        consult[i].object = json.decode(consult[i].object)

        if consult[i].date < os.time() then 
            if consult[i].object.finished then 
                consult[i].status = 'finished'
            elseif consult[i].object.canceled then 
                consult[i].status = 'canceled'
            else
                consult[i].status = 'started'
            end 
        else 
            consult[i].status = 'waiting'
        end 

        consult[i].invaders = parseInt(consult[i].object.invaders)
        consult[i].defenders = parseInt(consult[i].object.defenders)
    end
    return consult
end

function base.updateInvasionObject(id, jsonObject)
    local execute = vRP.execute('updateInvasion', { id = id, object = jsonObject })
    return type(execute) == 'table' and execute.affectedRows > 0 or parseInt(execute) > 0
end

function base.deleteInvasion(id)
    local execute = vRP.execute('deleteInvasion', { id = id })
    return type(execute) == 'table' and execute.affectedRows > 0 or parseInt(execute) > 0
end

function base.insertMarkedInvasion(name, projection, timestamp)
    local execute = vRP.execute('insertMarkedInvasion', { name = tostring(name), projection = json.encode(projection), date = os.date('%Y-%m-%d %H:%M:%S', timestamp) })
    if (type(execute) == 'table' and execute.affectedRows > 0) or parseInt(execute) > 0 then 
        if type(execute) == 'table' and execute.insertId then 
            return execute.insertId
        else 
            return (vRP.query('selectLastInsert', {})[1] or {}).id
        end     
    end
end

function base.getUserId(source)
    return vRP.getUserId(source) 
end 

function base.checkPermission(source)
    local user_id = vRP.getUserId(source)
    return vRP.hasPermission(user_id, cfg.permissionCommand) or vRP.terPemissao(user_id, cfg.permissionCommand)
end

function base.giveMoney(source,amount)
    local user_id = vRP.getUserId(source)
    return vRP.giveMoney(user_id,amount)
end

function base.getPlayerGroups(source) -- Retornar: {[group] = true, [otherGroup] = true}
    local user_id = vRP.getUserId(source)
    return vRP.getUserGroups(user_id)
end

function base.checkJoinInvasion(source)
    -- config para condições adicionais para o player entrar na invasao
    return true 
end

function base.getPlayerLabel(source) -- string retornada que irá aparecer como nome do player no killfeed
    local identity = vRP.getUserIdentity(vRP.getUserId(source))
    return tostring(identity.name)..' '..tostring(identity.firstname)
end

function base.royaleRewards(rewardPerPlayer, players)
    for _, source in ipairs(players) do 
        local user_id = vRP.getUserId(source) 

        if user_id then
            vRP._giveMoney(user_id, rewardPerPlayer)
        end
    end 
end

return base
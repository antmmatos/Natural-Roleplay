local SetTimeout = SetTimeout
local GetPlayerPed = GetPlayerPed
local DoesEntityExist = DoesEntityExist
local GetEntityCoords = GetEntityCoords
local GetEntityHeading = GetEntityHeading

function CreateExtendedPlayer(playerId, identifier, group, accounts, inventory, weight, job, name, coords,
                              metadata)
    local targetOverrides = Config.PlayerFunctionOverride and Core.PlayerFunctionOverrides
        [Config.PlayerFunctionOverride] or {}

    local self = {}

    self.accounts = accounts
    self.coords = coords
    self.group = group
    self.identifier = identifier
    self.inventory = inventory
    self.job = job
    self.name = name
    self.playerId = playerId
    self.source = playerId
    self.variables = {}
    self.weight = weight
    self.maxWeight = Config.MaxWeight
    self.metadata = metadata
    self.license =
        'license:' .. identifier

    ExecuteCommand(('add_principal identifier.%s group.%s'):format(self.license, self.group))

    local stateBag = Player(self.source).state
    stateBag:set("identifier", self.identifier, true)
    stateBag:set("license", self.license, true)
    stateBag:set("job", self.job, true)
    stateBag:set("group", self.group, true)
    stateBag:set("name", self.name, true)
    stateBag:set("metadata", self.metadata, true)

    function self.triggerEvent(eventName, ...)
        TriggerClientEvent(eventName, self.source, ...)
    end

    function self.setCoords(coords)
        local Ped = GetPlayerPed(self.source)
        local vector = type(coords) == "vector4" and coords or type(coords) == "vector3" and vector4(coords, 0.0) or
            vec(coords.x, coords.y, coords.z, coords.heading or 0.0)
        SetEntityCoords(Ped, vector.xyz, false, false, false, false)
        SetEntityHeading(Ped, vector.w)
    end

    function self.updateCoords()
        SetTimeout(1000, function()
            local Ped = GetPlayerPed(self.source)
            if DoesEntityExist(Ped) then
                local coords = GetEntityCoords(Ped)
                local distance = #(coords - vector3(self.coords.x, self.coords.y, self.coords.z))
                if distance > 1.5 then
                    local heading = GetEntityHeading(Ped)
                    self.coords = {
                        x = coords.x,
                        y = coords.y,
                        z = coords.z,
                        heading = heading or 0.0
                    }
                end
            end
            self.updateCoords()
        end)
    end

    function self.getCoords(vector)
        if vector then
            return vector3(self.coords.x, self.coords.y, self.coords.z)
        else
            return self.coords
        end
    end

    function self.kick(reason)
        DropPlayer(self.source, reason)
    end

    function self.setMoney(money)
        money = ESX.Math.Round(money)
        self.setAccountMoney('money', money)
    end

    function self.getMoney()
        return self.getAccount('money').money
    end

    function self.addMoney(money, reason)
        money = ESX.Math.Round(money)
        self.addAccountMoney('money', money, reason)
    end

    function self.removeMoney(money, reason)
        money = ESX.Math.Round(money)
        self.removeAccountMoney('money', money, reason)
    end

    function self.getIdentifier()
        return self.identifier
    end

    function self.setGroup(newGroup)
        ExecuteCommand(('remove_principal identifier.%s group.%s'):format(self.license, self.group))
        self.group = newGroup
        Player(self.source).state:set("group", self.group, true)
        ExecuteCommand(('add_principal identifier.%s group.%s'):format(self.license, self.group))
    end

    function self.getGroup()
        return self.group
    end

    function self.set(k, v)
        self.variables[k] = v
        Player(self.source).state:set(k, v, true)
    end

    function self.get(k)
        return self.variables[k]
    end

    function self.getAccounts(minimal)
        if not minimal then
            return self.accounts
        end

        local minimalAccounts = {}

        for i = 1, #self.accounts do
            minimalAccounts[self.accounts[i].name] = self.accounts[i].money
        end

        return minimalAccounts
    end

    function self.getAccount(account)
        for i = 1, #self.accounts do
            if self.accounts[i].name == account then
                return self.accounts[i]
            end
        end
    end

    function self.getInventory(minimal)
        local Inventory = exports['qs-core']:GetInventory(self.source)
        return Inventory
    end

    function self.getJob()
        return self.job
    end

    function self.getName()
        return self.name
    end

    function self.setName(newName)
        self.name = newName
        Player(self.source).state:set("name", self.name, true)
    end

    function self.setAccountMoney(accountName, money)
        if money >= 0 then
            local account = self.getAccount(accountName)
            if account then
                local newMoney = ESX.Math.Round(money)
                if newMoney ~= account.money then
                    account.money = newMoney
                    if accountName == 'money' then
                        local prevMoney = self.getInventoryItem('cash').count
                        if prevMoney and newMoney > prevMoney then
                            self.addAccountMoney('money', newMoney - prevMoney)
                        elseif prevMoney and newMoney < prevMoney then
                            self.removeAccountMoney('money', prevMoney - newMoney)
                        end
                        self.triggerEvent('esx:setAccountMoney', account)
                    elseif accountName == 'black_money' then
                        local prevMoney = self.getInventoryItem('black_money').count
                        if prevMoney and newMoney > prevMoney then
                            self.addAccountMoney('black_money', newMoney - prevMoney)
                        elseif prevMoney and newMoney < prevMoney then
                            self.removeAccountMoney('black_money', prevMoney - newMoney)
                        end
                        self.triggerEvent('esx:setAccountMoney', account)
                    else
                        self.triggerEvent('esx:setAccountMoney', account)
                    end
                end
            end
        end
    end

    function self.addAccountMoney(accountName, money)
        if money > 0 then
            local money = ESX.Math.Round(money)
            if accountName == 'money' then
                local cash = self.getInventoryItem('cash').count
                if cash then
                    self.addInventoryItem("cash", money)
                    self.setAccountMoney('money', cash + money)
                end
            elseif accountName == 'black_money' then
                local black_money = self.getInventoryItem('black_money').count
                if black_money then
                    self.addInventoryItem("black_money", money)
                    self.setAccountMoney('black_money', black_money + money)
                end
            else
                local account = self.getAccount(accountName)
                if account and account.money then
                    local newMoney = account.money + money
                    self.setAccountMoney(accountName, newMoney)
                end
            end
        end
    end

    function self.removeAccountMoney(accountName, money)
        if money > 0 then
            local money = ESX.Math.Round(money)
            if accountName == 'money' then
                local cash = self.getInventoryItem('cash').count
                if cash then
                    self.removeInventoryItem("cash", money)
                    local newMoney = cash - money
                    if newMoney >= 0 then
                        self.setAccountMoney('money', newMoney)
                    else
                        self.setAccountMoney('money', 0)
                    end
                end
            elseif accountName == 'black_money' then
                local black_money = self.getInventoryItem('black_money').count
                if black_money then
                    self.removeInventoryItem("black_money", money)
                    local newMoney = black_money - money
                    if newMoney >= 0 then
                        self.setAccountMoney('black_money', newMoney)
                    else
                        self.setAccountMoney('black_money', 0)
                    end
                end
            else
                local account = self.getAccount(accountName)
                if account and account.money then
                    local newMoney = account.money - money
                    if newMoney >= 0 then
                        self.setAccountMoney(accountName, newMoney)
                    else
                        self.setAccountMoney(accountName, 0)
                    end
                end
            end
        end
    end

    function self.getInventoryItem(name)
        local Item = exports['qs-core']:GetItem(self.source, name)
        return Item
    end

    function self.addInventoryItem(name, count)
        TriggerEvent('inventory:server:addItem', self.source, name, count)
    end

    function self.removeInventoryItem(name, count)
        TriggerEvent('inventory:server:removeItem', self.source, name, count)
    end

    function self.setInventoryItem(name, count)
        return true
    end

    function self.getWeight()
        return self.weight
    end

    function self.getMaxWeight()
        return self.maxWeight
    end

    function self.canCarryItem(name, count)
        local canCarry = exports['qs-core']:CanCarry(self.source, name, count)
        if canCarry then
            return true
        else
            return false
        end
    end

    function self.canSwapItem(firstItem, firstItemCount, testItem, testItemCount)
        --local firstItemObject = self.getInventoryItem(firstItem)
        --local testItemObject = self.getInventoryItem(testItem)

        --if firstItemObject.count >= firstItemCount then
        --    local weightWithoutFirstItem = ESX.Math.Round(self.weight - (firstItemObject.weight * firstItemCount))
        --    local weightWithTestItem = ESX.Math.Round(weightWithoutFirstItem + (testItemObject.weight * testItemCount))

        --    return weightWithTestItem <= self.maxWeight
        --end

        --return false
        return true
    end

    function self.setMaxWeight(newWeight)
        self.maxWeight = newWeight
        self.triggerEvent('esx:setMaxWeight', self.maxWeight)
    end

    function self.setJob(job, grade)
        grade = tostring(grade)
        local lastJob = json.decode(json.encode(self.job))

        if ESX.DoesJobExist(job, grade) then
            local jobObject, gradeObject = ESX.Jobs[job], ESX.Jobs[job].grades[grade]

            self.job.id                  = jobObject.id
            self.job.name                = jobObject.name
            self.job.label               = jobObject.label

            self.job.grade               = tonumber(grade)
            self.job.grade_name          = gradeObject.name
            self.job.grade_label         = gradeObject.label
            self.job.grade_salary        = gradeObject.salary

            if gradeObject.skin_male then
                self.job.skin_male = json.decode(gradeObject.skin_male)
            else
                self.job.skin_male = {}
            end

            if gradeObject.skin_female then
                self.job.skin_female = json.decode(gradeObject.skin_female)
            else
                self.job.skin_female = {}
            end

            TriggerEvent('esx:setJob', self.source, self.job, lastJob)
            self.triggerEvent('esx:setJob', self.job, lastJob)
            Player(self.source).state:set("job", self.job, true)
        else
            print(('[es_extended] [^3WARNING^7] Ignoring invalid ^5.setJob()^7 usage for ID: ^5%s^7, Job: ^5%s^7')
                :format(self.source, job))
        end
    end

    function self.hasItem(item, metadata)
        for k, v in ipairs(self.inventory) do
            if (v.name == item) and (v.count >= 1) then
                return v, v.count
            end
        end

        return false
    end

    function self.showNotification(msg, type)
        self.triggerEvent('esx:showNotification', msg, type)
    end

    function self.showHelpNotification(msg, thisFrame, beep, duration)
        self.triggerEvent('esx:showHelpNotification', msg, thisFrame, beep, duration)
    end

    function self.getMeta(index, subIndex)
        if index then
            if type(index) ~= "string" then
                return print("[^1ERROR^7] xPlayer.getMeta ^5index^7 should be ^5string^7!")
            end

            if self.metadata[index] then
                if subIndex and type(self.metadata[index]) == "table" then
                    local _type = type(subIndex)

                    if _type == "string" then
                        if self.metadata[index][subIndex] then
                            return self.metadata[index][subIndex]
                        end
                        return
                    end

                    if _type == "table" then
                        local returnValues = {}
                        for i = 1, #subIndex do
                            if self.metadata[index][subIndex[i]] then
                                returnValues[subIndex[i]] = self.metadata[index][subIndex[i]]
                            else
                                print(("[^1ERROR^7] xPlayer.getMeta ^5%s^7 not esxist on ^5%s^7!"):format(subIndex[i],
                                    index))
                            end
                        end

                        return returnValues
                    end
                end

                return self.metadata[index]
            else
                return print(("[^1ERROR^7] xPlayer.getMeta ^5%s^7 not exist!"):format(index))
            end
        end

        return self.metadata
    end

    function self.setMeta(index, value, subValue)
        if not index then
            return print("[^1ERROR^7] xPlayer.setMeta ^5index^7 is Missing!")
        end

        if type(index) ~= "string" then
            return print("[^1ERROR^7] xPlayer.setMeta ^5index^7 should be ^5string^7!")
        end

        if not value then
            return print(("[^1ERROR^7] xPlayer.setMeta ^5%s^7 is Missing!"):format(value))
        end

        local _type = type(value)

        if not subValue then
            if _type ~= "number" and _type ~= "string" and _type ~= "table" then
                return print(("[^1ERROR^7] xPlayer.setMeta ^5%s^7 should be ^5number^7 or ^5string^7 or ^5table^7!")
                    :format(value))
            end

            self.metadata[index] = value
        else
            if _type ~= "string" then
                return print(("[^1ERROR^7] xPlayer.setMeta ^5value^7 should be ^5string^7 as a subIndex!"):format(value))
            end

            self.metadata[index][value] = subValue
        end


        self.triggerEvent('esx:updatePlayerData', 'metadata', self.metadata)
        Player(self.source).state:set('metadata', self.metadata, true)
    end

    function self.clearMeta(index)
        if not index then
            return print(("[^1ERROR^7] xPlayer.clearMeta ^5%s^7 is Missing!"):format(index))
        end

        if type(index) == 'table' then
            for _, val in pairs(index) do
                self.clearMeta(val)
            end

            return
        end

        if not self.metadata[index] then
            return print(("[^1ERROR^7] xPlayer.clearMeta ^5%s^7 not exist!"):format(index))
        end

        self.metadata[index] = nil
        self.triggerEvent('esx:updatePlayerData', 'metadata', self.metadata)
        Player(self.source).state:set('metadata', self.metadata, true)
    end

    for fnName, fn in pairs(targetOverrides) do
        self[fnName] = fn(self)
    end

    return self
end

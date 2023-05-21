local loadedObject = false
OnObjectLoadedVariable = {}

function OnObjectLoaded(cb)
    if loadedObject then
        cb()
    end
    table.insert(OnObjectLoadedVariable, cb)
end

function GetFrameworkName()
    local type = Config.Framework.Active
    if type == FrameworkType.ESX then
        return Config.Framework.ES_EXTENDED_NAME
    end
    if type == FrameworkType.QB_CORE then
        return Config.Framework.QB_CORE_NAME
    end
end

local function IsResourceOnServer(resourceName)
    if GetResourceState(resourceName) == "started" or GetResourceState(resourceName) == "starting" then
        return true
    end
    return false
end

function GetSharedObject()
    local promise_ = promise:new()
    local object = nil

    if not Config.Framework then
        Config.Framework = {
            -- 1 = esx
            -- 2 = qbcore
            Active = 1,

            -- esx
            ESX_SHARED_OBJECT = Config.ESX or "esx:getSharedObject",

            -- es_extended resource name
            ES_EXTENDED_NAME = "es_extended",

            -- qbcore
            QBCORE_SHARED_OBJECT = "QBCore:GetObject",

            -- qb-core resource name
            QB_CORE_NAME = "qb-core",
        }
    end

    local framework = Config.Framework.Active

    if IsResourceOnServer(Config.Framework.ES_EXTENDED_NAME) then
        framework = FrameworkType.ESX
    end

    if IsResourceOnServer(Config.Framework.QB_CORE_NAME) then
        framework = FrameworkType.QB_CORE
    end

    local resourceName = GetFrameworkName()

    -- ES_EXTENDED
    if Config.Framework.Active == FrameworkType.ESX then
        xpcall(function()
            object = exports[resourceName or 'es_extended']['getSharedObject']()
            promise_:resolve(object)
        end, function(error)
            local ESX = nil
            local tries = 10
            LoadEsx = function()
                if tries == 0 then
                    print("Could not load any Es_extended object you need to correct the event name or change export name!")
                    return
                end

                tries = tries - 1

                if ESX == nil then
                    SetTimeout(100, LoadEsx)
                end

                TriggerEvent(Config.Framework.ESX_SHARED_OBJECT, function(obj)
                    ESX = obj
                end)
            end

            LoadEsx()

            object = ESX
            promise_:resolve(object)
        end)
    end

    -- QBCORE
    if Config.Framework.Active == FrameworkType.QB_CORE then
        xpcall(function()
            object = exports[resourceName or 'qb-core']['GetCoreObject']()
            promise_:resolve(object)
        end, function(error)
            xpcall(function()
                object = exports[resourceName or 'qb-core']['GetSharedObject']()
                promise_:resolve(object)
            end, function(error)

                local QBCore = nil
                local tries = 10
                LoadQBCore = function()
                    if tries == 0 then
                        print("Could not load any QB-Core object you need to correct the event name or change export name!")
                        return
                    end

                    tries = tries - 1

                    if QBCore == nil then
                        SetTimeout(100, LoadQBCore)
                    end

                    TriggerEvent(Config.Framework.QBCORE_SHARED_OBJECT, function(obj)
                        QBCore = obj
                    end)
                end

                LoadQBCore()

                object = QBCore
                promise_:resolve(object)
            end)
        end)
    end

    Citizen.Await(object)

    loadedObject = true
    for _, fun in pairs(OnObjectLoadedVariable) do
        fun()
    end

    return object
end

function triggerName(event)
    return string.format('%s:%s', GetCurrentResourceName(), event)
end

function dprint(str, ...)
    if Config.Debug then
        print('[rcore_clothes] ' .. string.format(str, ...))
    end
end

Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

-- Stolen from: https://rosettacode.org/wiki/Strip_control_codes_and_extended_characters_from_a_string
function normalizeString(str)

    local s = ""
    for i = 1, str:len() do
        if str:byte(i) >= 32 and str:byte(i) <= 126 then
            s = s .. str:sub(i, i)
        end
    end
    return s
end

-- Stolen from: https://forums.coronalabs.com/topic/43048-remove-special-characters-from-string/
function urlencode(str)
    if (str) then
        str = string.gsub(str, "\n", "\r\n")
        str = string.gsub(str, "([^%w ])",
            function()
                return string.format("%%%02X", string.byte)
            end)
        str = string.gsub(str, " ", "+")
    end
    return str
end

function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

--- @param object object
--- stolen: https://forums.coronalabs.com/topic/27482-copy-not-direct-reference-of-table/
function deepCopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end

    return _copy(object)
end

--- @param sourceTable table
--- @param targetTable table
--- @return table
--- stolen: https://stackoverflow.com/questions/1283388/lua-merge-tables
function mergeTables(t1, t2)
    local target = deepCopy(t1)
    local source = deepCopy(t2)
    for k, v in pairs(source) do
        if (type(v) == "table") and (type(target[k] or false) == "table") then
            mergeTables(target[k], source[k])
        else
            target[k] = v
        end
    end
    return target
end

function mergeParams(options, defaults)
    local target = deepCopy(defaults)
    local source = deepCopy(options)
    for k, v in pairs(source) do
        target[k] = v
    end
    return target
end

--- @param table table
--- @return boolean
function emptyTable(table)
    local count = 0
    if type(table) == "table" then
        for k, v in pairs(table) do
            count = count + 1
        end
    end
    return count == 0
end

--- @param table table
--- @return object
function next(table)
    local result = nil
    for k, v in pairs(table) do
        result = v
        break
    end
    return result
end

--- @param table table
--- @return boolean
function isTable(table)
    if table ~= nil then
        if type(table) == "table" then
            return true
        end
        return false
    else
        return false
    end
end

--- @param func function
--- @return boolean
function isFunction(func)
    if table ~= nil then
        if type(func) == "function" then
            return true
        end
        return false
    else
        return false
    end
end

function getKeys()
    return Keys
end

--- @param table table
--- @return number
function tableLength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

--- @param table table
--- @return number
function tableLastIterator(table)
    local last = 0
    for i, v in pairs(table) do
        last = i
    end
    return last
end

function getConfig()
    return Config
end

function dump(node, printing)
    local cache, stack, output = {}, {}, {}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k, v in pairs(node) do
            size = size + 1
        end

        local cur_index = 1
        for k, v in pairs(node) do
            if (cache[node] == nil) or (cur_index >= cache[node]) then

                if (string.find(output_str, "}", output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str, "\n", output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output, output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "[" .. tostring(k) .. "]"
                else
                    key = "['" .. tostring(k) .. "']"
                end

                print(type(v))

                if (type(v) == "number" or type(v) == "boolean" or type(v) == "vector3" or type(v) == "vector4") then
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = " .. tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = {\n"
                    table.insert(stack, node)
                    table.insert(stack, v)
                    cache[node] = cur_index + 1
                    break
                else
                    output_str = output_str .. string.rep('\t', depth) .. key .. " = '" .. tostring(v) .. "'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t', depth - 1) .. "}"
        end

        if (#stack > 0) then
            node = stack[#stack]
            stack[#stack] = nil
            depth = cache[node] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output, output_str)
    output_str = table.concat(output)
    if not printing then
        print(output_str)
    end
    return output_str
end

Dump = dump
dumpTable = dump
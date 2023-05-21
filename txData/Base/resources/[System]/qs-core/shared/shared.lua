local StringCharset = {}
local NumberCharset = {}

for i = 48, 57 do
    table.insert(NumberCharset, string.char(i))
end
for i = 65, 90 do
    table.insert(StringCharset, string.char(i))
end
for i = 97, 122 do
    table.insert(StringCharset, string.char(i))
end

QSShared.RandomStr = function(length)
    if length > 0 then
        return QSShared.RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
    else
        return ""
    end
end

QSShared.DumpTable = function(table, nb)
    if nb == nil then
        nb = 0
    end

    if type(table) == "table" then
        local s = ""
        for i = 1, nb + 1, 1 do
            s = s .. "    "
        end

        s = "{\n"
        for k, v in pairs(table) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            for i = 1, nb, 1 do
                s = s .. "    "
            end
            s = s .. "[" .. k .. "] = " .. QSShared.DumpTable(v, nb + 1) .. ",\n"
        end

        for i = 1, nb, 1 do
            s = s .. "    "
        end

        return s .. "}"
    else
        return tostring(table)
    end
end

QSShared.RandomInt = function(length)
    if length > 0 then
        return QSShared.RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
    else
        return ""
    end
end

QSShared.SplitStr = function(str, delimiter)
    local result = {}
    local from = 1
    local delim_from, delim_to = string.find(str, delimiter, from)
    while delim_from do
        table.insert(result, string.sub(str, from, delim_from - 1))
        from = delim_to + 1
        delim_from, delim_to = string.find(str, delimiter, from)
    end
    table.insert(result, string.sub(str, from))
    return result
end

function DebugPrint(...)
    if QSConfig.Debug then
        local data = {...}
        local str = ""
        for i = 1, #data do
            if type(data[i]) == "table" then
                str = str .. json.encode(data[i])
            elseif type(data[i]) ~= "string" then
                str = str .. tostring(data[i])
            else
                str = str .. data[i]
            end
            if i ~= #data then
                str = str .. " "
            end
        end
    
        print("^4[QS Core] ^3[Debug]^0: " .. str)
    end
end
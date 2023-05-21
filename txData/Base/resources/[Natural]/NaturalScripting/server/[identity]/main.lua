local playerIdentity = {}

local function saveIdentityToDatabase(identifier, identity)
    MySQL.update.await(
        'UPDATE users SET firstname = ?, lastname = ?, dateofbirth = ?, sex = ?, height = ? WHERE identifier = ?',
        { identity.firstName, identity.lastName, identity.dateOfBirth, identity.sex, identity.height, identifier })
end

local function checkDOBFormat(str)
    str = tostring(str)
    if not string.match(str, '(%d%d)/(%d%d)/(%d%d%d%d)') then
        return false
    end

    local d, m, y = string.match(str, '(%d+)/(%d+)/(%d+)')

    d = tonumber(d)
    m = tonumber(m)
    y = tonumber(y)

    if ((d <= 0) or (d > 31)) or ((m <= 0) or (m > 12)) or ((y <= 1900) or (y > 2015)) then
        return false
    elseif m == 4 or m == 6 or m == 9 or m == 11 then
        return d < 30
    elseif m == 2 then
        if y % 400 == 0 or (y % 100 ~= 0 and y % 4 == 0) then
            return d < 29
        else
            return d < 28
        end
    else
        return d < 31
    end
end

local function formatDate(str)
    local d, m, y = string.match(str, '(%d+)/(%d+)/(%d+)')
    local date = str

    date = d .. "/" .. m .. "/" .. y

    return date
end

local function checkAlphanumeric(str)
    return (string.match(str, "%W"))
end

local function checkForNumbers(str)
    return (string.match(str, "%d"))
end

local function checkNameFormat(name)
    if not checkAlphanumeric(name) and not checkForNumbers(name) then
        local stringLength = string.len(name)
        return stringLength > 0 and stringLength < 30
    end

    return false
end

local function checkSexFormat(sex)
    if not sex then
        return false
    end
    return sex == "m" or sex == "M" or sex == "f" or sex == "F"
end

local function checkHeightFormat(height)
    local numHeight = tonumber(height) or 0
    return numHeight >= 150 and numHeight <= 200
end

local function convertToLowerCase(str)
    return string.lower(str)
end

local function convertFirstLetterToUpper(str)
    return str:gsub("^%l", string.upper)
end

local function formatName(name)
    local loweredName = convertToLowerCase(name)
    return convertFirstLetterToUpper(loweredName)
end

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    deferrals.defer()
    local identifier = ESX.GetIdentifier(source)
    Wait(100)

    if identifier then
        MySQL.single('SELECT firstname, lastname, dateofbirth, sex, height FROM users WHERE identifier = ?',
            { identifier }, function(result)
                if result then
                    if result.firstname then
                        playerIdentity[identifier] = {
                            firstName = result.firstname,
                            lastName = result.lastname,
                            dateOfBirth = result.dateofbirth,
                            sex = result.sex,
                            height = result.height
                        }

                        deferrals.done()
                    else
                        deferrals.presentCard(
                            [==[{"type": "AdaptiveCard","body":[{"type":"Container","items":[{"type":"ColumnSet",
                                "columns":[{"type":"Column","items":[{"type":"Input.Text","placeholder":"Primeiro nome",
                                "id":"firstname","maxLength":15},{"type":"Input.Text","placeholder":"Data de Nascimento (DD/MM/YYYY)",
                                "id":"dateofbirth","maxLength":10}],"width":"stretch"},{"type":"Column","width":"stretch",
                                "items":[{"type":"Input.Text","placeholder":"Último nome","id":"lastname","maxLength":15},
                                {"type":"Input.Text","placeholder":"Altura (150cm - 200cm)","id":"height","maxLength":3}]}]},
                                {"type":"Input.ChoiceSet","placeholder":"Sexo","choices":[{"title":"Masculino","value":"m"},
                                {"title":"Feminino","value":"f"}],"style":"expanded","id":"sex"}]},{"type": "ActionSet",
                                "actions": [{"type":"Action.Submit","title":"Submeter"}]}],
                                "$schema": "http://adaptivecards.io/schemas/adaptive-card.json","version":"1.0"}]==],
                            function(data)
                                if data.firstname == '' or data.lastname == '' or data.dateofbirth == '' or data.sex ==
                                    '' or data.height == '' then
                                    deferrals.done("Dados inválidos")
                                else
                                    if checkNameFormat(data.firstname) and checkNameFormat(data.lastname) and
                                        checkDOBFormat(data.dateofbirth) and checkSexFormat(data.sex) and
                                        checkHeightFormat(data.height) then
                                        playerIdentity[identifier] = {
                                            firstName = formatName(data.firstname),
                                            lastName = formatName(data.lastname),
                                            dateOfBirth = data.dateofbirth,
                                            sex = data.sex,
                                            height = tonumber(data.height),
                                            saveToDatabase = true
                                        }

                                        deferrals.done()
                                    else
                                        deferrals.done("Formato inválido")
                                    end
                                end
                            end)
                    end
                else
                    deferrals.presentCard(
                        [==[{"type": "AdaptiveCard","body":[{"type":"Container","items":[{"type":"ColumnSet","columns":[{
                            "type":"Column","items":[{"type":"Input.Text","placeholder":"Primeiro nome","id":"firstname",
                            "maxLength":15},{"type":"Input.Text","placeholder":"Data de Nascimento (DD/MM/YYYY)","id":"dateofbirth",
                            "maxLength":10}],"width":"stretch"},{"type":"Column","width":"stretch","items":[{"type":"Input.Text",
                            "placeholder":"Último Nome","id":"lastname","maxLength":15},{"type":"Input.Text",
                            "placeholder":"Altura (150cm - 200cm)","id":"height","maxLength":3}]}]},{"type":"Input.ChoiceSet",
                            "placeholder":"Sexo","choices":[{"title":"Masculino","value":"m"},{"title":"Feminino","value":"f"}],
                            "style":"expanded","id":"sex"}]},{"type": "ActionSet","actions": [{"type":"Action.Submit",
                            "title":"Submeter"}]}],"$schema": "http://adaptivecards.io/schemas/adaptive-card.json","version":"1.0"}]==],
                        function(data)
                            if data.firstname == '' or data.lastname == '' or data.dateofbirth == '' or data.sex == '' or data.height == '' then
                                return deferrals.done("Dados inválidos")
                            end
                            if not checkNameFormat(data.firstname) then
                                return deferrals.done("Formato do primeiro nome inválido")
                            end
                            if not checkNameFormat(data.lastname) then
                                return deferrals.done("Formato do último nome inválido")
                            end
                            if not checkDOBFormat(data.dateofbirth) then
                                return deferrals.done("Formato da data de nascimento inválido")
                            end
                            if not checkSexFormat(data.sex) then
                                return deferrals.done("Formato do sexo inválido")
                            end
                            if not checkHeightFormat(data.height) then
                                return deferrals.done("Formato da altura inválido")
                            end

                            playerIdentity[identifier] = {
                                firstName = formatName(data.firstname),
                                lastName = formatName(data.lastname),
                                dateOfBirth = formatDate(data.dateofbirth),
                                sex = data.sex,
                                height = tonumber(data.height),
                                saveToDatabase = true
                            }

                            deferrals.done()
                        end)
                end
            end)
    else
        deferrals.done("Não foi possível obter a licença do FiveM")
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    if not playerIdentity[xPlayer.identifier] then
        return xPlayer.kick('Não foi possível obter a identidade do jogador')
    end

    local currentIdentity = playerIdentity[xPlayer.identifier]
    xPlayer.setName(('%s %s'):format(currentIdentity.firstName, currentIdentity.lastName))
    xPlayer.set('firstName', currentIdentity.firstName)
    xPlayer.set('lastName', currentIdentity.lastName)
    xPlayer.set('dateofbirth', currentIdentity.dateOfBirth)
    xPlayer.set('sex', currentIdentity.sex)
    xPlayer.set('height', currentIdentity.height)
    if currentIdentity.saveToDatabase then
        saveIdentityToDatabase(xPlayer.identifier, currentIdentity)
    end

    Wait(0)
    TriggerClientEvent('esx_identity:alreadyRegistered', xPlayer.source)
    playerIdentity[xPlayer.identifier] = nil
end)

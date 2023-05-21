
--███████╗██████╗░░█████╗░███╗░░░███╗███████╗░██╗░░░░░░░██╗░█████╗░██████╗░██╗░░██╗
--██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝░██║░░██╗░░██║██╔══██╗██╔══██╗██║░██╔╝
--█████╗░░██████╔╝███████║██╔████╔██║█████╗░░░╚██╗████╗██╔╝██║░░██║██████╔╝█████═╝░
--██╔══╝░░██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝░░░░████╔═████║░██║░░██║██╔══██╗██╔═██╗░
--██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║███████╗░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║██║░╚██╗
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝

Config.Framework = 'ESX'                --- @param Set 'ESX' if you use es_extended or 'QBCore' if you use qb-core.
Config.CustomFrameworkExport = true    --- @param Do you want to add your own export?

--- @param If your are using ESX 1.8.5 or higher put in true 'Config.CustomFrameworkExport' and uncomment the ESX function from line 14 
function CustomFrameworkExport() -- Add the export here, as in the following example.
    ESX = exports["es_extended"]:getSharedObject()
    -- QBCore = exports['qb-core']:GetCoreObject()
end

--█▀▀ █▀▀ █─█ 
--█▀▀ ▀▀█ ▄▀▄ 
--▀▀▀ ▀▀▀ ▀─▀

Config.getSharedObject = "esx:getSharedObject"  --- @param Modify it if you use an ESX Custom.
Config.setJob = "esx:setJob"                    --- @param Modify it if you use an ESX Custom.
Config.playerLoaded = "esx:playerLoaded"        --- @param Modify it if you use an ESX Custom.

Config.ESXFrameworkPlayersTable = 'users' -- Name of the table where the data of the players its stored
Config.ESXFrameworkIdentifierTable = 'identifier'  -- Name of the table where the data of the players its stored


--▒█▀▀█ ▒█▀▀█ ▒█▀▀█ █▀▀█ █▀▀█ █▀▀ 
--▒█░▒█ ▒█▀▀▄ ▒█░░░ █░░█ █▄▄▀ █▀▀ 
--░▀▀█▄ ▒█▄▄█ ▒█▄▄█ ▀▀▀▀ ▀░▀▀ ▀▀▀

Config.QBCoreGetCoreObject = 'qb-core'  --- @param Modify it if you use an QBCore Custom.
Config.QBTraphouseName = 'qb-traphouse' --- @param Traphouse script name for QBCore, only compatible with the latest version of qb-traphouse.
Config.QBCoreLastFunctions = true       --- @param Select this if you are using the latest version of QBCore only.

Config.QBCoreFrameworkPlayersTable = 'players' -- Name of the table where the data of the players its stored
Config.QBCoreFrameworkIdentifierTable = 'citizenid'  -- Name of the table where the data of the players its stored
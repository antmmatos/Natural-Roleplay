
--███████╗██████╗░░█████╗░███╗░░░███╗███████╗░██╗░░░░░░░██╗░█████╗░██████╗░██╗░░██╗
--██╔════╝██╔══██╗██╔══██╗████╗░████║██╔════╝░██║░░██╗░░██║██╔══██╗██╔══██╗██║░██╔╝
--█████╗░░██████╔╝███████║██╔████╔██║█████╗░░░╚██╗████╗██╔╝██║░░██║██████╔╝█████═╝░
--██╔══╝░░██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝░░░░████╔═████║░██║░░██║██╔══██╗██╔═██╗░
--██║░░░░░██║░░██║██║░░██║██║░╚═╝░██║███████╗░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║██║░╚██╗
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝

--[[ 
    IMPORTANT
    This resource is exclusively for ESX, if you use QBCore, it will not start
    Please delete it if you are not using ESX
]]

QSConfig.CustomFrameworkExport = true -- Do you want to add your own export?
function CustomFrameworkExport() -- Add the export here, as in the following example.
    ESX = exports["es_extended"]:getSharedObject()
end

--█▀▀ █▀▀ █─█ 
--█▀▀ ▀▀█ ▄▀▄ 
--▀▀▀ ▀▀▀ ▀─▀

QSConfig.getSharedObject = "esx:getSharedObject" -- Modify it if you use an ESX Custom
QSConfig.playerLoaded = "esx:playerLoaded" -- Modify it if you use an ESX Custom
QSConfig.playerLogout = "esx:playerLogout" -- Modify it if you use an ESX Custom

QSConfig.onAddInventoryItem = "esx:onAddInventoryItem" -- Modify it if you use an ESX Custom
QSConfig.onRemoveInventoryItem = "esx:onRemoveInventoryItem" -- Modify it if you use an ESX Custom

--[[ 
    Important information, since it depends on whether your package will work or not
    Remember to set Multicharacter = true if you use ESX Legacy
]]

QSConfig.IdentifierType = "license" -- Set the identifier type (can be: steam, license)
QSConfig.Multicharacter = false -- Activate this function in case of using ESX Legacy or Multicharacter
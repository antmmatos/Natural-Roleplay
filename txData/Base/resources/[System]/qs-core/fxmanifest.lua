fx_version 'bodacious'

game 'gta5'

version '1.7.5'

lua54 'yes'

shared_scripts {
    'shared/items.lua',
    'shared/weapons.lua',
    'shared/shared.lua',
}

client_scripts {
    'config/config.lua',
    'config/config_framework.lua',
    'config/translations.lua',
    'client/main.lua',
    'client/functions.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config/config.lua',
    'config/config_framework.lua',
    'config/translations.lua',
    'server/main.lua',
    'server/functions.lua',
}

ui_page {
    'html/index.html'
}

files {
	'html/index.html',
	'html/style.css',
	'html/*.js'
}

escrow_ignore {
    'config/*.lua',
    'shared/*.lua',
}

exports  {
    'GetItem',
    'CanCarry',
    'Notify',
    'Teleport',
    'SpawnVehicle',
    'ShowHelpNotification',
    'DrawSubtitle',
    'DrawText3D',
    'GetInventory',
    'GetItemLabel',
} 

dependencies {
    'progressbar', -- Required.
    '/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
}

dependency '/assetpacks'
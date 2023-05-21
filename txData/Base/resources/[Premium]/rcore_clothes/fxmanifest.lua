fx_version 'bodacious' 
games { 'gta5' }

author 'Isigar <info@rcore.cz>'
description 'rcore.cz new clothing'
version '1.7.0'

ui_page 'client/html/index.html'
--ui_page 'client/html/index-classic.html'

files {
    'client/html/*.js',
    'client/html/*.css',
    'client/html/index.html',
    'client/html/icons/*.png',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'locales.lua',
    'locales/*.lua',
    'server/extend/*.lua',
    'server/lib/*.lua',
    'server/main.lua',
}

client_scripts {
    'locales.lua',
    'locales/*.lua',
    'client/lib/*.lua',
    'client/extend/*.lua',
    'client/main.lua',
}

shared_scripts {
    "const.lua",
    'config.lua',
    'utils.lua',
    'common.lua',
    'validate.lua',
}

dependencies {
    '/server:4752',
}

escrow_ignore {
    "const.lua",
    'config.lua',
    'common.lua',
    'validate.lua',
    'locales.lua',
    'locales/*.lua',	
    'client/lib/*.lua',
    'client/extend/*.lua',	
    'server/extend/*.lua',
    'server/lib/*.lua',	
}

lua54 "yes"

dependency '/assetpacks'
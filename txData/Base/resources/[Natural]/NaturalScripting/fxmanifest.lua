fx_version 'cerulean'
game 'gta5'

author ''
description ''
version '1.0.0'
lua54 'yes'

ui_page 'UI/index.html'

files {
    "UI/index.html",
    "UI/*.js",
    "UI/*.css",
    "UI/*.png",
    "UI/*.jpg",
    "UI/*.ttf",
    "UI/*.svg",
    "UI/*.eot",
    "UI/*.woff",
    "UI/*.woff2",
    'UI/sounds/On.ogg',
    'UI/sounds/Upgrade.ogg',
    'UI/sounds/Off.ogg',
    'UI/sounds/Downgrade.ogg'
}

client_script 'client/*.lua'
client_script 'client/**/*.lua'
shared_script '@es_extended/imports.lua'
shared_script '@ox_lib/init.lua'
shared_script 'shared/*.lua'
shared_script 'shared/**/*.lua'
server_script '@oxmysql/lib/MySQL.lua'
server_script 'server/*.lua'
server_script 'server/**/*.lua'
server_script 'server/*.js'

server_export 'LogToDiscord'
server_export 'isAllowedTo'

export 'GetSkillbarObject'

provide 'xsound'
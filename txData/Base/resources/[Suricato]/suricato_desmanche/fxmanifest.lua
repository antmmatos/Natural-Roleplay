fx_version "bodacious"
game "gta5"

shared_script '@es_extended/imports.lua'
server_script '@oxmysql/lib/MySQL.lua'

server_scripts {
    "token.lua",
}

files {
    "img/drill.png",
    "config/config.lua",
    "config/messages.lua",
    "config/server/functions.lua",
    "config/client/functions.lua",
}

server_script "_server.lua"

client_script "_client.lua"
fx_version 'cerulean'
game 'gta5'

author 'Legendary45'
version '1.0.0'

ui_page 'html/index.html'

shared_script '@es_extended/imports.lua'

client_scripts {
    'Client/*.lua'
}

server_scripts{
    'Server/*.lua',
    "@mysql-async/lib/MySQL.lua"
}

files {
    'html/index.html',
    'html/css/*.css',
    'html/*.css',
    'html/js/*.js',
    'html/js/*.js.map',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/img/*.gif',
}

lua54 'yes'
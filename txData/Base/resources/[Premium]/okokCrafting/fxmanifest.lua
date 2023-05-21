fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokCrafting'

ui_page 'web/ui.html'

files {
	'web/*.*',
	'web/icons/*.png'
}

shared_script 'config.lua'

client_scripts {
	'locales/*.lua',
	'cl_utils.lua',
	'client.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'locales/*.lua',
	'sv_utils.lua',
	'server.lua'
}

lua54 'yes'

escrow_ignore {
	'config.lua',
	'cl_utils.lua',
	'sv_utils.lua',
	'locales/*.lua',
}
dependency '/assetpacks'
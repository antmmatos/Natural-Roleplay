fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokGarage'

ui_page 'web/ui.html'

files {
	'web/*.*',
	'web/img/*.png',
	'web/audio/*.*',
	'web/img/vehicles/*.png',
	'jsonFiles/*.json'
}

shared_script 'config.lua'

client_scripts {
	'locales/*.lua',
	'cl_utils.lua',
	'client.lua'
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
	'sv_utils.lua',
	'cl_utils.lua',
	'jsonFiles/*.json',
	'locales/*.lua',
}

dependency '/assetpacks'
fx_version 'adamant'
game 'gta5'
name "ak47_druglabs"
author "MenanAk47 (MenanAk47#3129)"
description "MenanAk47 - Optimized Drug Labs"
version "1.0"

shared_script '@es_extended/imports.lua'

server_scripts {
	'locales/en.lua',
	'config.lua',
	'server/main.lua',
}

client_scripts {
	'locales/en.lua',
	'config.lua',
	'client/editable.lua',
	'client/main.lua'
}
fx_version 'adamant'
games { 'gta5' }

lua54 'yes'

client_scripts { 
	"cfg/*",
	"client/*"
}
server_scripts { 
	"cfg/*",
	"server/*"
}

escrow_ignore {
	'server/functions.lua',
	'client/functions.lua',
	'cfg/config.lua',
	'stream/w_me_battleaxe.ydr',
	'stream/w_me_battleaxe.ytd',
}
dependency '/assetpacks'
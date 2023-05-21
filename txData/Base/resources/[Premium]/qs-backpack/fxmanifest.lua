fx_version 'adamant'

game 'gta5'

version '1.0.6'

author 'quasar-store.com'

lua54 'yes'

client_scripts {	
	'config/config.lua',
	'client/main.lua',
}

server_scripts {	
	'config/config.lua',
	'server/main.lua',
}

escrow_ignore {
	'config/config.lua',
}

dependencies {
	'progressbar', -- Required.
	'/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
}
dependency '/assetpacks'
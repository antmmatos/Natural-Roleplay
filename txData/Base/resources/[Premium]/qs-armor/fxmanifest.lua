fx_version 'adamant'

game 'gta5'

version '1.0.1'

author 'quasar-store.com'

lua54 'yes'

server_scripts {
	'config/config.lua',
	'config/translations.lua',
	'server/main.lua',
	'server/version_check.lua',
}

client_scripts {
    'TriggerEventReplacer.lua',
	'config/config.lua',
	'config/translations.lua',
    'client/main.lua',
}

escrow_ignore {
	'config/config.lua',
	'config/translations.lua',
	'server/version_check.lua',
}

dependencies {
	'qs-core', -- Required.
	'progressbar', -- Required.
	'/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
}
dependency '/assetpacks'
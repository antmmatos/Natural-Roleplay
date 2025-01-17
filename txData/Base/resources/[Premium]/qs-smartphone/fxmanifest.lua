fx_version 'bodacious'

game 'gta5'

lua54 'yes'

version '2.4.3'

ui_page "html/index.html"

shared_scripts {
    'config/*.lua',
    'locales/*.lua',
    'utils/*.lua',
}

client_scripts {
	'client/custom/framework/*.lua',
    'client/*.lua',
    'client/modules/*.lua',
    'client/apps/*.lua',
    'client/custom/**/*.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/custom/framework/*.lua',
    'server/*.lua',
    'server/apps/*.lua',
    'server/modules/*.lua',
    'server/custom/**/*.lua'
}

files {
    'html/index.html',
    'html/js/*.js',
    'html/js/modules/*.js',
    'html/js/apps/*.js',
    'html/apps/*.js',
    'html/apps/*.html',
    'config/*.js',
    'locales/*.js',
    'html/img/*.png',
    'html/sounds/*.mp3',
    'html/css/*.css',
    'html/fonts/*.ttf',
    'html/fonts/*.otf',
    'html/fonts/*.woff',
    'html/img/garage/*.jpg',
    'html/img/backgrounds/*.png',
    'html/img/apps/*.png',
	'html/img/app_details/*.png',
    'html/img/zoo/*.gif',
    'html/img/zoo/*.png',
    'html/img/business/*.png',
    'html/img/darkweb_items/*.png',
}

escrow_ignore {
    'config/*.lua',
    'locales/*.lua',
    'client/custom/**/*.lua',
    'server/custom/**/*.lua',
}

dependencies {
    '/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
    'xsound', -- Required.
	'screenshot-basic', -- Required.
}

dependency '/assetpacks'

exports {
    'isPhoneOpen'
}

dependency '/assetpacks'
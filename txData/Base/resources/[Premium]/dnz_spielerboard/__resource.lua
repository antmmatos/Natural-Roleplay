resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

shared_script '@es_extended/imports.lua'

server_script 'server/main.lua'

client_script 'client/main.lua'

ui_page 'html/scoreboard.html'

files {
	'html/scoreboard.html',
	'html/style.css',
	'html/listener.js',
	'html/psp.png',
	'html/logo.png',
	'html/inem.png',
	'html/lossantos.png',
	'html/crown.png',
	'html/reset.css',
    'html/*.png',
}
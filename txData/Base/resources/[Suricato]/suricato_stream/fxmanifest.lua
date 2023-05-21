fx_version "cerulean"

game "common"

ui_page 'nui/index.html'

shared_script '@es_extended/imports.lua'
dependencies {
	'es_extended'
}

server_script 'token.lua'

server_script '_server.lua'

client_script '_client.lua'

files {
    'nui/*.*',
    "nui/module/*.js",
    "nui/module/animation/tracks/*.js",
    "nui/module/animation/*.js",
    "nui/module/audio/*js",
    "nui/module/cameras/*.js",
    "nui/module/core/*.js",
    "nui/module/extras/core/*.js",
    "nui/module/extras/curves/*.js",
    "nui/module/extras/objects/*.js",
    "nui/module/extras/*.js",
    "nui/module/geometries/*.js",
    "nui/module/helpers/*.js",
    "nui/module/lights/*.js",
    "nui/module/loaders/*.js",
    "nui/module/materials/*.js",
    "nui/module/math/interpolants/*.js",
    "nui/module/math/*.js",
    "nui/module/objects/*.js",
    "nui/module/renderers/shaders/*.js",
    "nui/module/renderers/shaders/ShaderChunk/*.js",
    "nui/module/renderers/shaders/ShaderLib/*.js",
    "nui/module/renderers/webgl/*.js",
    "nui/module/renderers/webxr/*.js",
    "nui/module/renderers/webvr/*.js",
    "nui/module/renderers/*.js",
    "nui/module/scenes/*.js",
    "nui/module/textures/*.js",
    "nui/webgl.js",
    'config/client/*.*'
}
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
this_is_a_map 'yes'

shared_script '@es_extended/imports.lua'

ui_page 'index.html'

client_script 'client.lua'
server_script 'server.lua'
client_script 'safeCracking.lua'


data_file 'DLC_ITYP_REQUEST' 'stream/v_int_shop.ytyp'

files {
  "index.html",
  "scripts.js",
  "css/style.css",
  'stream/v_int_shop.ytyp'
}

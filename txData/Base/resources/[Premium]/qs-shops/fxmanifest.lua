fx_version "adamant"

game "gta5"

version '1.7.6'

lua54 'yes'

shared_scripts {
    'utils/utils.lua',
}

client_script {
    'modules/cl_framework.lua',
    "config/*.lua",
    "client/*.lua"
}

escrow_ignore {
    "config/*.lua",
    "modules/*.lua"
}

dependencies {
    'progressbar', -- Required.
    '/server:4752', -- ⚠️PLEASE READ⚠️ This requires at least server build 4700 or higher
}
dependency '/assetpacks'
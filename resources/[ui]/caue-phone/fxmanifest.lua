fx_version "cerulean"
games { "gta5" }

ui_page "html/index.html"

files {
    "html/*.html",
    "html/js/*.js",
    "html/js/libs/*.js",
    "html/css/*.css",
    "html/css/libs/*.css",
    "html/images/*.*",
    "html/webfonts/*.*",
}

shared_scripts {
    "@caue-lib/shared/sh_util.lua",
    "shared/sh_*.lua",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@caue-lib/server/sv_rpc.lua",
    "@caue-lib/server/sv_character.lua",
    "server/sv_*.lua",
}

client_scripts {
    "@caue-lib/client/cl_rpc.lua",
    "@caue-lib/client/cl_state.lua",
    "client/cl_*.lua",
}
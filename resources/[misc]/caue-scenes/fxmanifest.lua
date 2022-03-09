fx_version "cerulean"
games { "gta5" }

lua54 "yes"

ui_page "html/index.html"

files {
	"html/*",
    "html/index.html",
	"html/app.js",
	"html/styles.css",
}

shared_scripts {
    "@caue-lib/shared/sh_util.lua",
    "shared/*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@caue-lib/server/sv_rpc.lua",
    "server/*",
}

client_scripts {
    "@caue-lib/client/cl_rpc.lua",
    "client/*",
}
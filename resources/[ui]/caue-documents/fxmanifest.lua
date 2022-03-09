fx_version "cerulean"
games { "gta5" }

ui_page "html/index.html"

files {
	"html/*.html",
	"html/*.css",
	"html/*.js",
	"html/img/*",
}

shared_scripts {
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
	"client/documents/*",
}
fx_version "cerulean"
games { "gta5" }

ui_page "nui/dist/index.html"

files {
    "nui/dist/index.html",
    "nui/dist/main.js",
    "nui/src/assets/seatbelt.svg"
}

shared_scripts {
	"@caue-lib/shared/sh_util.lua",
	"shared/*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/*",
}

client_scripts {
	"client/*",
}
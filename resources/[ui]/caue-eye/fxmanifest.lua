fx_version "cerulean"
games { "gta5" }

ui_page "html/index.html"

files {
	"html/*.html",
	"html/*.css",
	"html/*.js",
	"html/*.png",
}

shared_scripts {
	"@caue-lib/shared/sh_models.lua",
	"shared/sh_*.lua",
}

server_scripts {
	"server/sv_*.lua",
}

client_scripts {
	"@caue-array/Array.lua",
	"@caue-lib/client/cl_state.lua",
	"client/cl_*.lua",
	"client/entries/cl_*.lua",
}
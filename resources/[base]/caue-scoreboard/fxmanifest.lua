fx_version "cerulean"
games { "gta5" }

shared_scripts {
    "@caue-lib/shared/sh_ids.lua",
    "shared/*",
}

server_scripts {
    "@caue-lib/server/sv_infinity.lua",
    "server/*",
}

client_scripts {
    "@warmenu/warmenu.lua",
    "@caue-lib/client/cl_infinity.lua",
    "client/*",
}
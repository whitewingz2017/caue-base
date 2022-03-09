fx_version "cerulean"
games { "gta5" }

shared_scripts {
    "shared/*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@caue-lib/server/sv_rpc.lua",
    "@caue-lib/server/sv_character.lua",
    "server/*",
}

client_scripts {
    "@caue-lib/client/cl_rpc.lua",
    "client/*",
}
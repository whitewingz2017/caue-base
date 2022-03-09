fx_version "cerulean"
games { "gta5" }

shared_script {
    "@caue-lib/shared/sh_util.lua",
    "shared/*",
}

server_scripts {
    "@caue-lib/server/sv_rpc.lua",
    "server/doors/*",
    "server/elevators/*",
    "server/*",
}

client_scripts {
    "@caue-lib/client/cl_rpc.lua",
    "@caue-lib/client/cl_polyhooks.lua",
    "client/*",
}
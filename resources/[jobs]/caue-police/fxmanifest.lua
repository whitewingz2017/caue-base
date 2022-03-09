fx_version "cerulean"
games { "gta5" }

shared_script {
    "@caue-lib/shared/sh_util.lua",
    "shared/*",
}

server_scripts {
    "@caue-lib/server/sv_rpc.lua",
    "server/*",
}

client_scripts {
    "@caue-sync/client/cl_lib.lua",
    "@caue-lib/client/cl_rpc.lua",
    "@caue-lib/client/cl_state.lua",
    "client/*",
}
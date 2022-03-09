fx_version "cerulean"
games { "gta5" }

shared_script {
    "shared/*",
}

server_scripts {
    "@caue-lib/server/sv_rpc.lua",
    "server/*",
}

client_scripts {
    "@caue-lib/client/cl_rpc.lua",
    "client/*",
}
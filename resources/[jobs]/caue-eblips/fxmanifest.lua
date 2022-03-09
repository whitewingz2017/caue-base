fx_version "cerulean"
games { "gta5" }

shared_script {
    "shared/*",
}

server_scripts {
    "@caue-lib/server/sv_rpc.lua",
    "@caue-lib/server/sv_infinity.lua",
    "server/*",
}

client_scripts {
    "@caue-lib/client/cl_rpc.lua",
    "@caue-infinity/client/classes/blip.lua",
    "@caue-lib/client/cl_infinity.lua",
    "client/*",
}
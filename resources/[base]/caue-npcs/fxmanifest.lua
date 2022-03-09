fx_version "cerulean"
games { "gta5" }

shared_scripts {
    "@caue-lib/shared/sh_util.lua",
    "shared/*.*"
}

server_scripts {
    "server/*.*"
}

client_scripts {
    "@caue-lib/client/cl_flags.lua",
    "@caue-lib/client/cl_rpc.lua",
    "client/classes/*.*",
    "client/*.*",
}
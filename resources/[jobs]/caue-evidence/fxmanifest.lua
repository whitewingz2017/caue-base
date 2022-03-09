fx_version "cerulean"
games { "gta5" }

shared_script {
    "@caue-lib/shared/sh_util.lua",
    "@caue-lib/shared/sh_cacheable.lua",
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
}
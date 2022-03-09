fx_version "cerulean"
games { "gta5" }

dependencies {
    "PolyZone"
}

shared_script {
    "shared/*",
}

server_scripts {
    "@caue-lib/server/sv_rpc.lua",
    "server/*",
}

client_scripts {
    "config.lua",
    "@PolyZone/client.lua",
    "@PolyZone/BoxZone.lua",
    "@PolyZone/CircleZone.lua",
    "@PolyZone/ComboZone.lua",
    "@PolyZone/EntityZone.lua",
    "@caue-lib/client/cl_rpc.lua",
    "client/*",
}

export "getModule"
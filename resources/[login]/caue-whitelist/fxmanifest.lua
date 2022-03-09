fx_version "cerulean"
games { "gta5" }

dependency "connectqueue"
dependency "oxmysql"

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@connectqueue/connectqueue.lua",
    "@caue-lib/shared/sh_ids.lua",
    "sv_whitelist.lua"
}
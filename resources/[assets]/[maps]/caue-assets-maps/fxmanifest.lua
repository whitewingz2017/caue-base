fx_version "cerulean"
games { "gta5" }

this_is_a_map "yes"

files {
	"interiorproxies.meta",
	"timecycle_mods",
	"timecycle_mods2",
    "popcycle.dat",
    "popcycle2.dat",
}

data_file "INTERIOR_PROXY_ORDER_FILE" "interiorproxies.meta"
data_file "TIMECYCLEMOD_FILE" "timecycle_mods"
data_file "TIMECYCLEMOD_FILE" "timecycle_mods2"
data_file "POPSCHED_FILE" "popcycle.dat"
data_file "POPSCHED_FILE" "popcycle2.dat"
data_file "DLC_ITYP_REQUEST" "stream/misc/np_misc_load.ytyp"

client_scripts {
	"scripts/*",
}
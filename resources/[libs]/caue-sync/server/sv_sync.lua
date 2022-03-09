local readyPlayers = {}

RegisterNetEvent("caue-sync:playerReady")
AddEventHandler("caue-sync:playerReady", function()
    local src = source

    readyPlayers[src] = true
end)

RegisterNetEvent("caue-sync:request")
AddEventHandler("caue-sync:request", function(native, playerid, entityid, args)
    local src = source

    if readyPlayers[playerid] then
        TriggerClientEvent("caue-sync:execute", playerid, native, entityid, args)
    end
end)

RegisterNetEvent("caue-sync:executeSyncNative")
AddEventHandler("caue-sync:executeSyncNative", function(native, netEntity, options, args)
    local src = source

    TriggerClientEvent("caue-sync:clientExecuteSyncNative", -1, native, netEntity, options, args)
end)
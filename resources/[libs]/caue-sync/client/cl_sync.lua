TriggerServerEvent("caue-sync:playerReady")

RegisterNetEvent("caue-sync:execute")
AddEventHandler("caue-sync:execute", function(native, netID, ...)
    local entity = NetworkGetEntityFromNetworkId(netID)

    if Sync[native] then
        Sync[native](entity, ...)
    end
end)

function SyncedExecution(native, entity, ...)
    if NetworkHasControlOfEntity(entity) then
        Sync[native](entity, ...)
    else
        RequestSyncExecution(native, entity, ...)
    end
end

exports("SyncedExecution", SyncedExecution)

--
-- better sync method
-- prob wanna use this instead
-- onesync needs to be better
--
-- options table:
-- - entity = { 1, 2, 4 }
-- - - table key IDs for network conversion

function syncNative(native, netEntity, options, ...)
    TriggerServerEvent("caue-sync:executeSyncNative", native, netEntity, options, table.pack(...))
end
exports("syncNative", syncNative)

RegisterNetEvent("caue-sync:clientExecuteSyncNative")
AddEventHandler("caue-sync:clientExecuteSyncNative", function(native, netEntity, options, args)
    if options and options.entity then
        for _, v in pairs(options.entity) do
            args[v] = NetworkGetEntityFromNetworkId(args[v])
        end
    end
    if native == "0xB736A491E64A32CF" then
        SetEntityAsNoLongerNeeded(args[1])
        return
    end
    local result = Citizen.InvokeNative(native, table.unpack(args))
end)

RegisterNetEvent("caue-vehicleSync:updateSyncState")
AddEventHandler("caue-vehicleSync:updateSyncState", function(pNetId, pSyncState)
    TriggerClientEvent("caue-vehicleSync:updateSyncState", -1, pNetId, pSyncState)
end)
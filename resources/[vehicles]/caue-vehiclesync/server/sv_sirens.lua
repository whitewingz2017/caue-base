RegisterNetEvent("caue-vehicleSync:updateSirenState")
AddEventHandler("caue-vehicleSync:updateSirenState", function(pNetId, pSirenState, pSirenPreset)
    TriggerClientEvent("caue-vehicleSync:updateSirenState", -1, pNetId, pSirenState, pSirenPreset)
end)
local HotZones = {}

RegisterNetEvent("caue-infinity:hotzones:requestList")
AddEventHandler("caue-infinity:hotzones:requestList", function()
    local src = source

    TriggerClientEvent("caue-infinity:hotzones:updateList", src, HotZones)
end)

RegisterNetEvent("caue-infinity:hotzones:enteredZone")
AddEventHandler("caue-infinity:hotzones:enteredZone", function(zoneId)
    local src = source

end)

RegisterNetEvent("caue-infinity:hotzones:exitZone")
AddEventHandler("caue-infinity:hotzones:exitZone", function(zoneId)
    local src = source

end)
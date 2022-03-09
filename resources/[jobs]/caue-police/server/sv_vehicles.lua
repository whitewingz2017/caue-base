RegisterNetEvent("caue-police:purchaseVehicle")
AddEventHandler("caue-police:purchaseVehicle", function(params)
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local accountId = exports["caue-base"]:getChar(src, "bankid")
    local bank = exports["caue-financials"]:getBalance(accountId)

    if params.price > bank then
        TriggerClientEvent("caue-phone:notification", src, "fas fa-exclamation-circle", "Error", "You dont $" .. params.price .. " in your bank account", 5000)
        return
    end

    local comment = "Brought " .. params.name
    local success, message = exports["caue-financials"]:transaction(accountId, 1, params.price, comment, cid, 5)
    if not success then
        TriggerClientEvent("caue-phone:notification", src, "fas fa-exclamation-circle", "Error", message, 5000)
        return
    end

    local vid = exports["caue-vehicles"]:insertVehicle(src, params.model, params.job, params.price, false, true)
    if not vid then
        TriggerClientEvent("DoLongHudText", src, "Error??", 2)
        return
    end

    exports["caue-vehicles"]:updateVehicle(vid, "garage", "garage", params.garage)

    local vehicle = exports["caue-vehicles"]:getVehicle(vid)

    TriggerClientEvent("caue-vehicles:spawnVehicle", src, params.model, params.spawn, vehicle.id, vehicle.plate, 100, false, false, false, false, false, true)
end)
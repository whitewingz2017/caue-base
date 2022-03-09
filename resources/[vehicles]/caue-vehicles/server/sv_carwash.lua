RPC.register("caue-carwash:cleanVehicle", function(src)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return false end

    local cash = exports["caue-financials"]:getCash(src)
    if cash < 100 then
        TriggerClientEvent("DoLongHudText", src, "You dont have $100 with you", 2)
        return false
    end

    if not exports["caue-financials"]:updateCash(src, "-", 100) then
        return false
    end

    exports["caue-financials"]:updateBalance(11, "+", 100)
    exports["caue-financials"]:transactionLog(11, 11, 100, "", cid, 7)

    return true
end)
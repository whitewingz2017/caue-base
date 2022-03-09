RPC.register("caue-vehicles:refuel", function(src, price, tax)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return false end

    local cash = exports["caue-financials"]:getCash(src)
    if cash < price then
        TriggerClientEvent("DoLongHudText", src, "You dont have $" .. price .. " with you", 2)
        return false
    end

    if not exports["caue-financials"]:updateCash(src, "-", price) then
        return false
    end

    exports["caue-financials"]:updateBalance(12, "+", price)
    exports["caue-financials"]:transactionLog(12, 12, price, "", cid, 7)
    exports["caue-financials"]:addTax("Services", tax)

    return true
end)
RPC.register("caue-death:illegal", function(src, pPrice)
    local cash = exports["caue-financials"]:getCash(src)
    if cash < pPrice then
        TriggerClientEvent("DoLongHudText", src, "Você não tem $" .. pPrice .. " com você", 2)
        return false
    end

    if not exports["caue-financials"]:updateCash(src, "-", pPrice) then
        TriggerClientEvent("DoLongHudText", src, "Error in updateCash function")
        return false
    end

    return true
end)
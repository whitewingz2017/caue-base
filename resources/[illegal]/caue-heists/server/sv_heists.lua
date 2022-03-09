RegisterNetEvent("caue-heists:complete")
AddEventHandler("caue-heists:complete", function(pValue)
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    exports["caue-financials"]:updateCash(src, "+", pValue)
end)
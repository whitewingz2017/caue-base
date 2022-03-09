RegisterNetEvent("reviveGranted")
AddEventHandler("reviveGranted", function(_src)
    local src = source
    if _src then src = _src end

    TriggerClientEvent("reviveFunction", src)
end)

RegisterNetEvent("caue-death:characterKill")
AddEventHandler("caue-death:characterKill", function(_src)
    local src = source
    if _src then src = _src end

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    MySQL.update.await([[
        UPDATE characters
        SET deleted = 1
        WHERE id = ?
    ]],
    { cid })
end)
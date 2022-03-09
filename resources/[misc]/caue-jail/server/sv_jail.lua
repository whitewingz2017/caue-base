RegisterNetEvent("caue-jail:sendToJail", function(pTarget, pTime)
    local src = source

    local cid = exports["caue-base"]:getChar(pTarget, "id")
    if not cid then return end

    local affectedRows = MySQL.update.await([[
        UPDATE characters
        SET jail = ?
        WHERE id = ?
    ]],
    { pTime, cid })

    if not affectedRows or affectedRows < 1 then return end

    exports["caue-base"]:setChar(pTarget, "jail", pTime)
    TriggerClientEvent("caue-base:setChar", pTarget, "jail", pTime)

    local date = os.date("%d/%m/%Y %H:%M:%S", os.time())
	local name = exports["caue-base"]:getChar(pTarget, "first_name") .. " " .. exports["caue-base"]:getChar(pTarget, "last_name")

    TriggerClientEvent("caue-jail:begInJail", pTarget, false, pTime, name, cid, date)
    TriggerClientEvent("chatMessage", src, "DOC: " , { 33, 118, 255 }, name .. " foi preso por " .. pTime .. " meses")
end)

RegisterNetEvent("caue-jail:updateJailTime", function(pTime)
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local affectedRows = MySQL.update.await([[
        UPDATE characters
        SET jail = ?
        WHERE id = ?
    ]],
    { pTime, cid })

    if not affectedRows or affectedRows < 1 then return end

    exports["caue-base"]:setChar(src, "jail", tonumber(pTime))
    TriggerClientEvent("caue-base:setChar", src, "jail", tonumber(pTime))
end)

RegisterNetEvent("caue-jail:claimPossessions", function()
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local name = "ply-" .. cid
    local jail = "jail-" .. cid

    MySQL.update.await([[
        DELETE FROM inventory
        WHERE name = ?
    ]],
    { jail })

    MySQL.update.await([[
        UPDATE inventory
        SET name = ?
        WHERE name = ?
    ]],
    { jail, name })
end)
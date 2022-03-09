RegisterNetEvent("SpawnEventsServer")
AddEventHandler("SpawnEventsServer", function()
    local src = source

    TriggerEvent("caue-hud:getData", src)
end)

RegisterNetEvent("caue-hud:getData")
AddEventHandler("caue-hud:getData", function(_src)
    local src = source
    if _src then src = _src end

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local data = MySQL.single.await([[
        SELECT health, armour, hunger, thirst
        FROM characters
        WHERE id = ?
    ]],
    { cid })

    if data then
        TriggerClientEvent("caue-hud:setData", src, data)
    end
end)

RegisterNetEvent("caue-hud:updateData")
AddEventHandler("caue-hud:updateData", function(health, armour, hunger, thirst, _src)
    local src = source
    if _src then src = _src end

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    if health > 200 then
        health = 200
    end

    MySQL.update([[
        UPDATE characters
        SET health = ?, armour = ?, hunger = ?, thirst = ?
        WHERE id = ?
    ]],
    { health, armour, hunger, thirst, cid })
end)
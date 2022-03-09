RegisterNetEvent("SpawnEventsServer")
AddEventHandler("SpawnEventsServer", function()
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local bones = MySQL.scalar.await([[
        SELECT bones
        FROM characters
        WHERE id = ?
    ]],
    { cid })

    if bones then
        TriggerClientEvent("bones:client:updatefromDB", src, json.decode(bones))
    end
end)

RegisterNetEvent("bones:server:updateServer")
AddEventHandler("bones:server:updateServer", function(bones)
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    MySQL.update.await([[
        UPDATE characters
        SET bones = ?
        WHERE id = ?
    ]],
    { json.encode(bones), cid })
end)

RegisterNetEvent("Evidence:GetWounds")
AddEventHandler("Evidence:GetWounds", function(target)
    local src = source
    TriggerClientEvent("Evidence:GiveWounds", target, src)
end)

RegisterNetEvent("Evidence:GiveWoundsFinish")
AddEventHandler("Evidence:GiveWoundsFinish", function(damage, target, bones)
    local src = source
    TriggerClientEvent("Evidence:CurrentDamageListTarget", target, damage, bones, src)
end)

RegisterNetEvent("updateHealLocation")
AddEventHandler("updateHealLocation", function(bonestarget, targetid)
    TriggerClientEvent("updateHealLocation:client", targetid, bonestarget)
end)

RPC.register("caue-evidence:canHeal", function(src)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return false end

    local accountId = exports["caue-base"]:getChar(src, "bankid")
    local bank = exports["caue-financials"]:getBalance(accountId)

    if bank < 200 then
        TriggerClientEvent("DoLongHudText", src, "Você não tem $" .. 200 .. " na sua conta do banco", 2)
        return false
    end

    return true
end)
RegisterNetEvent("caue-evidence:hospitalHeal")
AddEventHandler("caue-evidence:hospitalHeal", function()
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local accountId = exports["caue-base"]:getChar(src, "bankid")
    local bank = exports["caue-financials"]:getBalance(accountId)

    local groupBank = exports["caue-groups"]:groupBank("ems")

    local comment = "Despesas com assistência médica"
    exports["caue-financials"]:transaction(accountId, groupBank, 200, comment, cid, 1)
end)

RegisterNetEvent("caue-death:medicNPC")
AddEventHandler("caue-death:medicNPC", function()
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local accountId = exports["caue-base"]:getChar(src, "bankid")
    local bank = exports["caue-financials"]:getBalance(accountId)

    local groupBank = exports["caue-groups"]:groupBank("ems")

    local comment = "Despesas com assistência médica"
    exports["caue-financials"]:transaction(accountId, groupBank, 500, comment, cid, 1)

    TriggerClientEvent("caue-death:medicNPC", src)
end)

RPC.register("caue-death:canCallMedicNPC", function(src)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return false end

    local accountId = exports["caue-base"]:getChar(src, "bankid")
    local bank = exports["caue-financials"]:getBalance(accountId)

    if bank >= 500 then
        return true
    else
        return false
    end
end)
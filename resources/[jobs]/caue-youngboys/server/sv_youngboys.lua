--[[

    Variables

]]

local activePurchases = {}

--[[

    Events

]]

RegisterNetEvent("caue-youngboys:orderFood")
AddEventHandler("caue-youngboys:orderFood", function(pData)
    local src = source

    local params = pData
    params.charger = src

    activePurchases[params.registerId] = params
    TriggerClientEvent("caue-youngboys:activePurchase", -1, params, false)

    Citizen.Wait(60000)

    if activePurchases[params.registerId] ~= nil then
        activePurchases[params.registerId] = nil
        TriggerClientEvent("caue-youngboys:activePurchase", -1, params, true)
    end
end)

RegisterNetEvent("caue-youngboys:completePurchase")
AddEventHandler("caue-youngboys:completePurchase", function(pParams)
    if not pParams then return end

    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local accountId = exports["caue-base"]:getChar(src, "bankid")
    local groupBank = exports["caue-groups"]:groupBank("yb14")

    if not accountId or not groupBank then return end

    local bank = exports["caue-financials"]:getBalance(accountId)
    if bank < pParams.cost then
        TriggerClientEvent("DoLongHudText", src, "You do not have $" .. pParams.cost .. " in your account.", 2)
        return
    end

    local comment = pParams.comment
    local success, message = exports["caue-financials"]:transaction(accountId, groupBank, pParams.cost, comment, cid, 5)
    if not success then
        TriggerClientEvent("DoLongHudText", src, message)
        return
    end

    exports["caue-financials"]:updateBalance(accountId, "-", pParams.tax)
    exports["caue-financials"]:addTax("Goods", pParams.tax)

    local buyer = exports["caue-base"]:getChar(src, "first_name") .. " " .. exports["caue-base"]:getChar(src, "last_name")
    local seller = exports["caue-base"]:getChar(pParams.charger, "first_name") .. " " .. exports["caue-base"]:getChar(pParams.charger, "last_name")
    exports["caue-groups"]:groupLog("taco_shop", "Sale", seller .. " | $" .. pParams.cost .. " | " .. pParams.comment)

    TriggerClientEvent("DoLongHudText", pParams.charger, buyer .. " paid $" .. pParams.cost)
end)
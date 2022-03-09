--[[

    Variables

]]

local activePurchases = {}



--[[

    Events

]]

RegisterNetEvent("caue-tacoshop:orderFood")
AddEventHandler("caue-tacoshop:orderFood", function(pData)
    local src = source

    local params = pData
    params.charger = src

    activePurchases[params.registerId] = params
    TriggerClientEvent("caue-tacoshop:activePurchase", -1, params, false)

    Citizen.Wait(60000)

    if activePurchases[params.registerId] ~= nil then
        activePurchases[params.registerId] = nil
        TriggerClientEvent("caue-tacoshop:activePurchase", -1, params, true)
    end
end)

RegisterNetEvent("caue-tacoshop:completePurchase")
AddEventHandler("caue-tacoshop:completePurchase", function(pParams)
    if not pParams then return end

    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local accountId = exports["caue-base"]:getChar(src, "bankid")
    local groupBank = exports["caue-groups"]:groupBank("taco_shop")

    if not accountId or not groupBank then return end

    local bank = exports["caue-financials"]:getBalance(accountId)
    if bank < pParams.cost then
        TriggerClientEvent("DoLongHudText", src, "Você não tem $" .. pParams.cost .. " na sua conta.", 2)
        return
    end

    local comment = pParams.comment
    local success, message = exports["caue-financials"]:transaction(accountId, groupBank, pParams.cost, comment, cid, 5)
    if not success then
        TriggerClientEvent("DoLongHudText", src, message)
        return
    end

    exports["caue-financials"]:addTax("Goods", pParams.tax)

    local buyer = exports["caue-base"]:getChar(src, "first_name") .. " " .. exports["caue-base"]:getChar(src, "last_name")
    local seller = exports["caue-base"]:getChar(pParams.charger, "first_name") .. " " .. exports["caue-base"]:getChar(pParams.charger, "last_name")
    exports["caue-groups"]:groupLog("taco_shop", "Sell", seller .. " | $" .. pParams.cost .. " | " .. pParams.comment)

    TriggerClientEvent("DoLongHudText", pParams.charger, buyer .. " payed $" .. pParams.cost)
end)
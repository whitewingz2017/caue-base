--[[

    Variables

]]

Housing.currentHousingLocks = {}
Housing.currentHousingLockdown = {}
Housing.BuisnessLocations = {}
Housing.Players = {}

--[[

    Functions

]]

function getCurrentOwned(src)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return {} end

    local result = MySQL.query.await([[
        SELECT hid, DATEDIFF(FROM_UNIXTIME(UNIX_TIMESTAMP()), FROM_UNIXTIME(last_payment)) AS last_payment
        FROM housing
        WHERE cid = ?
    ]],
    { cid })

    local owned = {}

    for i, v in ipairs(result) do
        local tax = exports["caue-financials"]:priceWithTax(Housing.info[v.hid]["price"], "Propertys")

        owned[v.hid] = {
            house_id = v.hid,
            house_name = Housing.info[v.hid]["street"],
            house_price = tax.total,
            last_payment = v.last_payment
        }
    end

    return owned
end

function currentKeys(src)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return {} end

    local result = MySQL.query.await([[
        SELECT k.hid, DATEDIFF(FROM_UNIXTIME(UNIX_TIMESTAMP()), FROM_UNIXTIME(h.last_payment)) AS last_payment
        FROM housing_keys k
        INNER JOIN housing h ON h.hid = k.hid
        WHERE k.cid = ?
    ]],
    { cid })

    local owned = {}

    for i, v in ipairs(result) do
        local tax = exports["caue-financials"]:priceWithTax(Housing.info[v.hid]["price"], "Propertys")

        owned[v.hid] = {
            house_id = v.hid,
            house_name = Housing.info[v.hid]["street"],
            house_price = tax.total,
            last_payment = v.last_payment
        }
    end

    return owned
end

--[[

    Exports

]]

exports("getCurrentOwned", getCurrentOwned)
exports("currentKeys", currentKeys)

--[[

    Events

]]

RegisterNetEvent("caue-housing:enterHouse")
AddEventHandler("caue-housing:enterHouse", function(pPropertyId)
    local src = source
    Housing.Players[src] = pPropertyId
end)

RegisterNetEvent("caue-housing:leftHouse")
AddEventHandler("caue-housing:leftHouse", function(pPropertyId)
    local src = source
    Housing.Players[src] = nil
end)

--[[

    RPCs

]]

RPC.register("getCurrentOwned", function(src)
    return getCurrentOwned(src)
end)

RPC.register("currentKeys", function(src)
    return currentKeys(src)
end)

RPC.register("getCurrentLockdown", function(src)
    return Housing.currentHousingLockdown
end)

RPC.register("getBuisnessLocations", function(src)
    return Housing.BuisnessLocations
end)

RPC.register("getCurrentSelected", function(src, pPropertyId)
    local cid = exports["caue-base"]:getChar(src, "id")

    local finished = true

    local _information = MySQL.scalar.await([[
        SELECT information
        FROM housing
        WHERE hid = ?
    ]],
    { pPropertyId })

    local housingInformation = {}
    if _information and type(_information) == "string" then
        housingInformation = json.decode(_information)
        for k, v in pairs(housingInformation) do
            if k == "backdoor_coordinates" then
                for k2, v2 in pairs(v) do
                    housingInformation[k][k2] = vector3(v2.x, v2.y, v2.z)
                end
            elseif k == "garage_coordinates" then
                if v.w then
                    housingInformation[k] = vector4(v.x, v.y, v.z, v.w)
                else
                    housingInformation[k] = vector3(v.x, v.y, v.z)
                end
            else
                housingInformation[k] = vector3(v.x, v.y, v.z)
            end
        end
    end

    local currentHousingLocks = Housing.currentHousingLocks

    local keys = currentKeys(src)
    for k, v in pairs(keys) do
        currentHousingLocks[k] = false
    end

    local _result = MySQL.scalar.await([[
        SELECT id
        FROM housing
        WHERE hid = ? AND cid = ?
    ]],
    { pPropertyId, cid })

    local isResult = false
    if _result then
        isResult = true
    end

    local housingLockdown = Housing.currentHousingLockdown

    local housingRobbed = Housing.housingBeingRobbed

    local robTargets = {}
    if Housing.housingRobTargets[pPropertyId] ~= nil then
        robTargets = Housing.housingRobTargets[pPropertyId]
    end

    local robLocations = {}
    if Housing.robPosLocations[pPropertyId] ~= nil then
        robLocations = Housing.robPosLocations[pPropertyId]
    end

    local alarm = false
    if Housing.alarm[pPropertyId] ~= nil then
        alarm = Housing.alarm[pPropertyId]
    end

    local currentAccess = {}

    return finished, housingInformation, currentHousingLocks, isResult, housingLockdown, housingRobbed, robTargets, robLocations, alarm, currentAccess
end)

RPC.register("caue-phone:getHouseKeys", function(src, pHouseId)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return {} end

    local keys = MySQL.query.await([[
        SELECT k.hid as house_id, k.cid AS player_cid, CONCAT(c.first_name," ",c.last_name) as player_name
        FROM housing_keys k
        INNER JOIN characters c ON c.id = k.cid
        WHERE k.hid = ?
    ]],
    { pHouseId })

    for i, v in ipairs(keys) do
        keys[i]["house_name"] = Housing.info[v.house_id]["street"]
    end

    return keys
end)

RPC.register("caue-phone:giveKey", function(src, pHouseId, pPlayerId)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return false, "ID not found" end

    local playerCid = exports["caue-base"]:getChar(pPlayerId, "id")
    if not cid then return false, "ID not found" end

    local hasKey = MySQL.scalar.await([[
        SELECT id
        FROM housing_keys
        WHERE hid = ? AND cid = ?
    ]],
    { pHouseId, playerCid })

    if hasKey then
        return false, "The player already has the key to this house."
    end

    local insertId = MySQL.insert.await([[
        INSERT INTO housing_keys (hid, cid)
        VALUES (?, ?)
    ]],
    { pHouseId, playerCid })

    if not insertId or insertId < 1 then
        return false, "Database insert eror"
    end

    TriggerClientEvent("caue-phone:notification", pPlayerId, "fas fa-key", "Keys", "You received the property key " .. Housing.info[pHouseId]["street"], 5000)
    TriggerClientEvent("caue-housing:refresh", pPlayerId)

    return true, "Chave recebida"
end)

RPC.register("caue-phone:removeKey", function(src, pHouseId, pPlayerId)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return false end

    local affectedRows = MySQL.update.await([[
        DELETE FROM housing_keys
        WHERE hid = ? AND cid = ?
    ]],
    { pHouseId, pPlayerId })

    if affectedRows and affectedRows > 0 then
        local pPlayerId = exports["caue-base"]:getSidWithCid(pPlayerId)
        if pPlayerId > 0 then
            TriggerClientEvent("caue-housing:refresh", pPlayerId)
        end

        return true
    end

    return false
end)

RPC.register("caue-phone:payHouse", function(src, pHouseId)
    if not pHouseId or not src then return false, "pHouseId or src not found" end

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return false, "cid not found" end

    local price = Housing.info[pHouseId]["price"]
    local tax = exports["caue-financials"]:priceWithTax(price, "Propertys")
    local priceTotal = tax.total

    local accountId = exports["caue-base"]:getChar(src, "bankid")
    local bank = exports["caue-financials"]:getBalance(accountId)
    if bank < priceTotal then
        return false, "You do not have $" .. priceTotal .. " in your account"
    end

    local groupBank = exports["caue-groups"]:groupBank("real_estate")

    local comment = "Property rental payment " .. Housing.info[pHouseId]["street"]
    local success, message = exports["caue-financials"]:transaction(accountId, groupBank, price, comment, cid, 5)
    if not success then
        return false, message
    end

    exports["caue-financials"]:addTax("Propertys", tax.tax)

    local affectedRows = MySQL.update.await([[
        UPDATE housing
        SET last_payment = last_payment + 604800
        WHERE hid = ?
    ]],
    { pHouseId })

    if not affectedRows or affectedRows < 1 then
        return false, "affectedRows ~= 1"
    end

    return true, ":)"
end)

RPC.register("caue-phone:removeSharedKey", function(src, pHouseId)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return false end

    local affectedRows = MySQL.update.await([[
        DELETE FROM housing_keys
        WHERE hid = ? AND cid = ?
    ]],
    { pHouseId, cid })

    if affectedRows and affectedRows > 0 then
        TriggerClientEvent("caue-housing:refresh", src)
        return true
    end

    return false
end)

RPC.register("unlockProperty", function(src, pHouseId)
    if Housing.currentHousingLocks[pHouseId] ~= nil and Housing.currentHousingLocks[pHouseId] == false then
        return false, Housing.currentHousingLocks
    end

    Housing.currentHousingLocks[pHouseId] = false

    return true, Housing.currentHousingLocks
end)

RPC.register("lockProperty", function(src, pHouseId)
    if Housing.currentHousingLocks[pHouseId] == nil then
        return false, Housing.currentHousingLocks
    end

    Housing.currentHousingLocks[pHouseId] = nil

    return true, Housing.currentHousingLocks
end)
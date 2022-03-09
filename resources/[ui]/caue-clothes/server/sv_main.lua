--[[

    Variables

]]

databaseFormat = {
    "model",
    "drawables",
    "props",
    "drawtextures",
    "proptextures",
    "hairColor",
    "fadeStyle",
    "headBlend",
    "headStructure",
    "headOverlay",
}

--[[

    Events

]]

RegisterServerEvent("SpawnEventsServer")
AddEventHandler("SpawnEventsServer", function()
    local src = source

    TriggerEvent("caue-clothes:getClothes", src)
end)

RegisterServerEvent("caue-clothes:getClothes")
AddEventHandler("caue-clothes:getClothes", function(_src)
    local src = (not _src and source or _src)

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local clothes = MySQL.single.await([[
        SELECT *
        FROM characters_clothes
        WHERE cid = ?
    ]],
    { cid })

    if clothes then
        local data = {
            model = clothes.model,
            drawables = json.decode(clothes.drawables),
            props = json.decode(clothes.props),
            drawtextures = json.decode(clothes.drawtextures),
            proptextures = json.decode(clothes.proptextures),
            hairColor = json.decode(clothes.hairColor),
            fadeStyle = clothes.fadeStyle,
            headBlend = json.decode(clothes.headBlend),
            headStructure = json.decode(clothes.headStructure),
            headOverlay = json.decode(clothes.headOverlay),
            tattoos = json.decode(clothes.tattoos),
        }

        TriggerClientEvent("caue-clothes:setClothes", src, data)
    end
end)

RegisterServerEvent("caue-clothes:updateClothes")
AddEventHandler("caue-clothes:updateClothes",function(data, tats)
    if not data then return end
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    for i, v in ipairs(databaseFormat) do
        if v == "model" then
            data[v] = tostring(data[v])
        elseif v == "fadeStyle" then
            data[v] = tonumber(data[v])
        else
            if data[v] then
                data[v] = json.encode(data[v])
            else
                data[v] = json.encode({})
            end
        end
    end

    if type(tats) ~= "table" then tats = {} end
    local tattoos = json.encode(tats)

    local exist = MySQL.scalar.await([[
        SELECT cid
        FROM characters_clothes
        WHERE cid = ?
    ]],
    { cid })

    if exist then
        MySQL.update([[
            UPDATE characters_clothes
            SET model = ?, drawables = ?, props = ?, drawtextures = ?, proptextures = ?, hairColor = ?, fadeStyle = ?, headBlend = ?, headStructure = ?, headOverlay = ?, tattoos = ?
            WHERE cid = ?
        ]],
        { data.model, data.drawables, data.props, data.drawtextures, data.proptextures, data.hairColor, data.fadeStyle, data.headBlend, data.headStructure, data.headOverlay, tattoos, cid })
    else
        MySQL.insert([[
            INSERT INTO characters_clothes (cid, model, drawables, props, drawtextures, proptextures, hairColor, fadeStyle, headBlend, headStructure, headOverlay, tattoos)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ]],
        { cid, data.model, data.drawables, data.props, data.drawtextures, data.proptextures, data.hairColor, data.fadeStyle, data.headBlend, data.headStructure, data.headOverlay, tattoos })
    end
end)

RegisterServerEvent("caue-clothes:getTattoos")
AddEventHandler("caue-clothes:getTattoos", function(_src)
    local src = (not _src and source or _src)

    local cid = exports["caue-base"]:getChar(src, "id")

    local tattoos = MySQL.scalar.await([[
        SELECT tattoos
        FROM characters_clothes
        WHERE cid = ?
    ]],
    { cid })

    if tattoos then
        TriggerClientEvent("raid_clothes:settattoos", src, json.decode(tattoos))
    else
        TriggerClientEvent("raid_clothes:settattoos", src, {})
    end
end)

--[[

    RPCs

]]

RPC.register("caue-clothes:purchase", function(src, price, tax, paymentType)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return false end

    if paymentType == "cash" then
        local cash = exports["caue-financials"]:getCash(src)

        if price > cash then
            return false
        end

        if not exports["caue-financials"]:updateCash(src, "-", price) then
            return false
        end

        exports["caue-financials"]:updateBalance(13, "+", price)
        exports["caue-financials"]:transactionLog(13, 13, price, "", cid, 7)
        exports["caue-financials"]:addTax("Services", tax)
    else
        local accountId = exports["caue-base"]:getChar(src, "bankid")
        local bank = exports["caue-financials"]:getBalance(accountId)

        if price > bank then
            return false
        end

        local comment = "Roupas"
        local success, message = exports["caue-financials"]:transaction(accountId, 13, price, comment, cid, 5)
        if not success then
            TriggerClientEvent("caue-phone:notification", src, "fas fa-exclamation-circle", "Error", message, 5000)
            return false
        end

        TriggerClientEvent("caue-phone:notification", src, "fas fa-university", "Banco", "Você transferiu $" .. price .. " para a conta de ID: " .. 13, 3000)

        exports["caue-financials"]:addTax("Services", tax)
    end

    return true
end)
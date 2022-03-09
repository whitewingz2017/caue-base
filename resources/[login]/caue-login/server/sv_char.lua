local function phoneNumber()
    for i = 1, 10 do
        local areaCode = math.random(50) > 25 and 415 or 628
        local number = math.random(1000000, 9999999)

        local phoneNumber = tonumber(areaCode .. number)

        local exist = MySQL.scalar.await([[
            SELECT phone
            FROM characters
            WHERE phone = ?
        ]],
        { phoneNumber })

        if not exist then
            return phoneNumber
        end

        Citizen.Wait(500)
    end
end

RegisterNetEvent("login:getCharModels")
AddEventHandler("login:getCharModels", function(charIds, isReset)
    local src = source

    local result = MySQL.query.await([[
        SELECT *
        FROM characters_clothes
        WHERE cid IN (]] .. charIds .. [[)
    ]])

    local peds = {}

    for i,v in ipairs(result) do
        peds[v.cid] = {
            model = v.model,
            drawables = json.decode(v.drawables),
            props = json.decode(v.props),
            drawtextures = json.decode(v.drawtextures),
            proptextures = json.decode(v.proptextures),
            hairColor = json.decode(v.hairColor),
            headBlend = json.decode(v.headBlend),
            headStructure = json.decode(v.headStructure),
            headOverlay = json.decode(v.headOverlay),
            tattoos = json.decode(v.tattoos)
        }
    end

    TriggerClientEvent("login:CreatePlayerCharacterPeds", src, peds, isReset)
end)

RPC.register("caue-char:fetchCharacters", function(src)
    local ids = GetIds(src)

    if not ids.hex then
        return {
            err = "Seu hex não foi encontrado"
        }
    end

    local characters = MySQL.query.await([[
        SELECT *
        FROM characters
        WHERE hex = ? AND deleted = 0
    ]],
    { ids.hex })

    return characters
end)

RPC.register("caue-char:createCharacter", function(src, params)
    local ids = GetIds(src)

    if not ids.hex then
        return {
            err = "Seu hex não foi encontrado"
        }
    end

    local function formatDate(s)
        local y, m, d = string.match(s,  '^(%d%d%d%d)-(%d%d)-(%d%d)$' )
        return "" .. d .. "/" .. m .. "/" .. y .. ""
    end

    local hex = ids.hex
    local fname = ((params.firstname):lower()):gsub("^%l", string.upper)
    local lname = ((params.lastname):lower()):gsub("^%l", string.upper)
    local gender = params.gender
    local dob = formatDate(params.dob)
    local phone = phoneNumber()

    local insertId = MySQL.insert.await([[
        INSERT INTO characters (hex, first_name, last_name, gender, dob, phone)
        VALUES (?, ?, ?, ?, ?, ?)
    ]],
    { hex, fname, lname, gender, dob, phone })

    exports["caue-logs"]:AddLog("character-create", src, insertId)

    return {}
end)

RPC.register("caue-char:deleteCharacter", function(src, cid)
    MySQL.update.await([[
        UPDATE characters
        SET deleted = 1
        WHERE id = ?
    ]],
    { cid })

    exports["caue-logs"]:AddLog("character-delete", src, cid)

    return {}
end)

RPC.register("caue-char:selectCharacter", function(src, cid)
    local character = MySQL.single.await([[
        SELECT id, hex, first_name, last_name, gender, dob, cash, bankid, phone, job, job2, jail, new, hotel, aliases
        FROM characters
        WHERE id = ?
    ]],
    { cid })

    if not character then
        return nil
    end

    character["phone"] = math.ceil(character["phone"])

    exports["caue-base"]:setUser(src, "char", character)

    return character
end)
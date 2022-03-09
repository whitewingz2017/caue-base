--[[

    Functions

]]

function joinRace(src, id, alias, cid, dontpay)
    local srcString = tostring(src)

    if not PendingRaces[id] then
        return
    end

    local inRace, raceId = isPlayerInRace(cid)
    if inRace then
        return
    end

    if PendingRaces[id]["buyIn"] > 0 and not dontpay then
        local accountId = exports["caue-base"]:getChar(src, "bankid")
        local bank = exports["caue-financials"]:getBalance(accountId)
        if PendingRaces[id]["buyIn"] > bank then
            TriggerClientEvent("DoLongHudText", src, "You dont have $" .. PendingRaces[id]["buyIn"] .. " in your bank account")
            return
        end

        local success, message = exports["caue-financials"]:transaction(accountId, 0, PendingRaces[id]["buyIn"], "", cid, 1)
        if not success then
            TriggerClientEvent("DoLongHudText", src, message)
            return
        end

        PendingRaces[id]["prize"] = PendingRaces[id]["prize"] + PendingRaces[id]["buyIn"]
    end

    PendingRaces[id]["players"][srcString] = {
        serverId = src,
        characterId = cid,
        name = alias,
        fastest = 0,
        total = 0,
        totalDist = 0,
        position = 0,
    }

    TriggerClientEvent("caue-racing:joinedRace", src, Races[id])
    TriggerClientEvent("caue-racing:addedPendingRace", -1, PendingRaces[id])

    for k, v in pairs(PendingRaces[id]["players"]) do
        TriggerClientEvent("caue-racing:playerJoinedYourRace", v.serverId, cid, alias)
    end
end

--[[

    Events

]]

RegisterNetEvent("caue-racing:updatePositionInfo")
AddEventHandler("caue-racing:updatePositionInfo", function(curRaceid, totalDist)
    local src = source
    local srcString = tostring(src)

    if not ActiveRaces[curRaceid] then return end

    ActiveRaces[curRaceid]["players"][srcString]["totalDist"] = totalDist

    local position = 1
    local players = ActiveRaces[curRaceid]["players"]

    for k, v in pairs(players) do
        if v.serverId ~= src then
            if v.totalDist > totalDist then
                position = position + 1
            end
        end
    end

    TriggerClientEvent("caue-racing:updatePosition", src, position)
end)

--[[

    RPCs

]]

RPC.register("caue-racing:createPendingRace", function(src, id, options)
    local srcString = tostring(src)

    if not id or not options then return end

    if PendingRaces[id] or ActiveRaces[id] then
        return
    end

    local cid = exports["caue-base"]:getChar(src, "id")
    local alias = exports["caue-base"]:getChar(src, "aliases")

    if not cid or not alias then
        return
    end

    if isPlayerInRace(cid) then
        return
    end

    options["buyIn"] = tonumber(options["buyIn"])
    if options["buyIn"] > 0 then
        local accountId = exports["caue-base"]:getChar(src, "bankid")
        local bank = exports["caue-financials"]:getBalance(accountId)
        if options["buyIn"] > bank then
            TriggerClientEvent("DoLongHudText", src, "Você não tem $" .. options["buyIn"] .. " na sua conta do banco")
            return
        end

        local success, message = exports["caue-financials"]:transaction(accountId, 0, options["buyIn"], "", cid, 1)
        if not success then
            TriggerClientEvent("DoLongHudText", src, message)
            return
        end
    end

    PendingRaces[id] = {}

    options["mapDistance"] = Races[id]["distance"]
    options["owner"] = cid
    options["eventCreator"] = alias
    options["players"] = {}
    options["prize"] = options["buyIn"]
    options["laps"] = tonumber(options["laps"])
    options["countdown"] = tonumber(options["countdown"])
    options["dnfPosition"] = tonumber(options["dnfPosition"])
    options["dnfCountdown"] = tonumber(options["dnfCountdown"])

    PendingRaces[id] = options
    TriggerClientEvent("caue-racing:addedPendingRace", -1, options)

    joinRace(src, id, alias, cid, true)
end)

RPC.register("caue-racing:joinRace", function(src, id, alias, cid)
    joinRace(src, id, alias, cid)

    return
end)

RPC.register("caue-racing:leaveRace", function(src)
    local srcString = tostring(src)
    local cid = exports["caue-base"]:getChar(src, "id")
    local alias = exports["caue-base"]:getChar(src, "aliases")

    if not cid or not alias then
        return
    end

    local inRace, raceId = isPlayerInRace(cid)
    if not inRace then return end

    if cid == PendingRaces[raceId]["owner"] then
        for k, v in pairs(PendingRaces[raceId]["players"]) do
            TriggerClientEvent("caue-racing:endRace", v.serverId)
        end

        PendingRaces[raceId] = nil
        TriggerClientEvent("caue-racing:removedPendingRace", -1, raceId)
    else
        PendingRaces[raceId]["players"][srcString] = nil
        TriggerClientEvent("caue-racing:leftRace", src)
        TriggerClientEvent("caue-racing:addedPendingRace", -1, PendingRaces[raceId])

        for k, v in pairs(PendingRaces[raceId]["players"]) do
            TriggerClientEvent("caue-racing:playerLeftYourRace", v.serverId, cid, alias)
        end
    end
end)

RPC.register("caue-racing:dnfRace", function(src, id)
    local srcString = tostring(src)

    if not ActiveRaces[id] then return end

    local cid = exports["caue-base"]:getChar(src, "id")
    local alias = exports["caue-base"]:getChar(src, "aliases")

    if not cid or not alias then
        return
    end

    ActiveRaces[id]["players"][srcString] = nil

    TriggerClientEvent("caue-racing:leftRace", src)
    TriggerClientEvent("caue-racing:updatedActiveRace", -1, ActiveRaces[id])

    for k, v in pairs(ActiveRaces[id]["players"]) do
        TriggerClientEvent("caue-racing:playerLeftYourRace", v.serverId, cid, alias)
    end

    Citizen.Wait(1000)

    local countPlayers = 0
    for k, v in pairs(ActiveRaces[id]["players"]) do
        countPlayers = countPlayers + 1
    end

    if ActiveRaces[id]["positions"] > countPlayers then
        FinishedRaces[#FinishedRaces + 1] = ActiveRaces[id]
        TriggerClientEvent("caue-racing:raceHistory", -1, ActiveRaces[id])

        for k, v in pairs(ActiveRaces[id]["players"]) do
            TriggerClientEvent("caue-racing:endRace", v.serverId)
        end

        ActiveRaces[id] = nil
        TriggerClientEvent("caue-racing:removedActiveRace", -1, id)
    end
end)

RPC.register("caue-racing:startRace", function(src, id, countdown)
    if not PendingRaces[id] then
        return
    end

    ActiveRaces[id] = PendingRaces[id]
    TriggerClientEvent("caue-racing:addedActiveRace", -1, ActiveRaces[id])

    PendingRaces[id] = nil
    TriggerClientEvent("caue-racing:removedPendingRace", -1, id)

    local race = Races[id]
    race["laps"] = ActiveRaces[id]["laps"]
    race["players"] = ActiveRaces[id]["players"]

    for k, v in pairs(ActiveRaces[id]["players"]) do
        TriggerClientEvent("caue-racing:startRace", v.serverId, race, countdown * 1000)
    end
end)

RPC.register("caue-racing:endRace", function(src)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local raceId = ""
    for k, v in pairs(ActiveRaces) do
        if v.owner == cid then
            raceId = k
            break
        end
    end

    if raceId == "" then return end

    for k, v in pairs(ActiveRaces[raceId]["players"]) do
        TriggerClientEvent("caue-racing:endRace", v.serverId)
    end

    ActiveRaces[raceId] = nil
    TriggerClientEvent("caue-racing:removedActiveRace", -1, raceId)
end)

RPC.register("caue-racing:finishedRace", function(src, curRaceid, bestLapTime, totalTime)
    local srcString = tostring(src)

    if not ActiveRaces[curRaceid] then return true end

    local cid = exports["caue-base"]:getChar(src, "id")
    local alias = exports["caue-base"]:getChar(src, "aliases")

    if not cid or not alias then
        return true
    end

    if not ActiveRaces[curRaceid]["positions"] then
        ActiveRaces[curRaceid]["positions"] = 1

        local accountId = exports["caue-base"]:getChar(src, "bankid")

        local success, message = exports["caue-financials"]:transaction(0, accountId, ActiveRaces[curRaceid]["prize"], "", 0, 1)
        if not success then
            TriggerClientEvent("DoLongHudText", src, message)
        end

        leaderboardAddRaces(curRaceid)
    end

    ActiveRaces[curRaceid]["players"][srcString]["position"] = ActiveRaces[curRaceid]["positions"]
    ActiveRaces[curRaceid]["positions"] = ActiveRaces[curRaceid]["positions"] + 1
    ActiveRaces[curRaceid]["players"][srcString]["fastest"] = bestLapTime
    ActiveRaces[curRaceid]["players"][srcString]["total"] = totalTime

    leaderboardAddFastest(curRaceid, bestLapTime, alias)

    TriggerClientEvent("caue-racing:finishedRace", src, ActiveRaces[curRaceid]["players"][srcString]["position"], totalTime)
    TriggerClientEvent("caue-racing:updatedActiveRace", -1, ActiveRaces[curRaceid])

    local countPlayers = 0
    for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
        countPlayers = countPlayers + 1
    end

    if ActiveRaces[curRaceid]["players"][srcString]["position"] == countPlayers then
        FinishedRaces[#FinishedRaces + 1] = ActiveRaces[curRaceid]
        TriggerClientEvent("caue-racing:raceHistory", -1, ActiveRaces[curRaceid])

        for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
            TriggerClientEvent("caue-racing:endRace", v.serverId)
        end

        ActiveRaces[curRaceid] = nil
        TriggerClientEvent("caue-racing:removedActiveRace", -1, curRaceid)
    elseif ActiveRaces[curRaceid]["dnfPosition"] > 0 and ActiveRaces[curRaceid]["dnfPosition"] == ActiveRaces[curRaceid]["players"][srcString]["position"] then
        local countdown = ActiveRaces[curRaceid]["dnfCountdown"] * 1000

        for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
            TriggerClientEvent("caue-racing:startDNFCountdown", v.serverId, countdown)
        end

        Citizen.Wait(countdown)

        for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
            if v.position == 0 then
                TriggerClientEvent("caue-racing:dnfRace", v.serverId)
            end
        end

        Citizen.Wait(1000)

        for k, v in pairs(ActiveRaces[curRaceid]["players"]) do
            TriggerClientEvent("caue-racing:endRace", v.serverId)
        end

        FinishedRaces[#FinishedRaces + 1] = ActiveRaces[curRaceid]
        TriggerClientEvent("caue-racing:raceHistory", -1, ActiveRaces[curRaceid])

        ActiveRaces[curRaceid] = nil
        TriggerClientEvent("caue-racing:removedActiveRace", -1, curRaceid)
    end

    return true
end)
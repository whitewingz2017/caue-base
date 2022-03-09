--[[

    Variables

]]

local creating = false

--[[

    Functions

]]

function openRacingApp()
    if not exports["caue-base"]:getChar("aliases") then
        SendNUIMessage({
            openSection = "racing:events:aliases",
        })

        return
    end

    local rank = exports["caue-groups"]:GroupRank("racing")

    local _races = exports["caue-racing"]:getAllRaces()
    local races = formatRaces(_races)

    SendNUIMessage({
        openSection = "racing:events:list",
        races = races,
        canMakeMap = (rank >= 1)
    })
end

function formatRaces(races)
    local _races = {}

    for k, v in pairs(races["finishedRaces"]) do
        v["state"] = "close"
        table.insert(_races, v)
    end

    for k, v in pairs(races["activeRaces"]) do
        v["state"] = "active"
        table.insert(_races, v)
    end

    for k, v in pairs(races["pendingRaces"]) do
        v["state"] = "open"
        table.insert(_races, v)
    end

    return _races
end

--[[

    Events

]]

AddEventHandler("caue-racing:api:startingRace", function(startTime)
    TriggerEvent("DoLongHudText", "Starting race in " .. tostring(startTime / 1000) .. " seconds")
end)

AddEventHandler("caue-racing:api:updatedState", function()
    if not phoneOpen then return end

    local rank = exports["caue-groups"]:GroupRank("racing")

    local _races = exports["caue-racing"]:getAllRaces()
    local races = formatRaces(_races)

    SendNUIMessage({
        openSection = "racing:event:update",
        races = races,
        canMakeMap = (rank >= 1)
    })
end)

AddEventHandler("caue-racing:api:playerJoinedYourRace", function(characterId, name)
    TriggerEvent("chatMessage", "", {255, 0, 0}, "^1" .. name .. " joined your race")
end)

AddEventHandler("caue-racing:api:playerLeftYourRace", function(characterId, name)
    TriggerEvent("chatMessage", "", {255, 0, 0}, "^1" .. name .. " left your race")
end)

--[[

    NUI

]]

RegisterNUICallback("racing:events:list", function()
    openRacingApp()
end)

RegisterNUICallback("racing:aliases:save", function(data)
    local aliases = data.aliases
    if not aliases then return end

    local update = RPC.execute("caue-phone:racingAliasesSave", aliases)
    if update then
        exports["caue-base"]:setChar("aliases", aliases)
    end

    openRacingApp()
end)

RegisterNUICallback("racing:map:save", function(data)
    if creating then
        TriggerEvent("caue-racing:cmd:racecreatedone")

        creating = false
    else
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)

        if veh ~= 0 and GetPedInVehicleSeat(veh, -1) == ped then
            local options = {
                raceName = data.name,
                raceType = data.type,
                raceThumbnail = "none",
            }

            TriggerEvent("caue-racing:cmd:racecreate", options)
            closePhone()

            creating = true
        else
            TriggerEvent("You are not driving a vehicle", 2)
        end
    end
end)

RegisterNUICallback("racing:map:cancel", function()
    TriggerEvent("mkr_racing:cmd:racecreatecancel")
end)

RegisterNUICallback("racing:event:setup", function()
    local races = exports["caue-racing"]:getAllRaces()

    SendNUIMessage({
        openSection = "racing-start",
        maps = races.races,
    })
end)

RegisterNUICallback("racing:map:load", function(data)
    local id = data.id
    if not id then return end

    -- exports["caue-racing"]:previewRace(id)
    -- exports["caue-racing"]:locateRace(id)
end)

RegisterNUICallback("racing:event:start", function(data)
    openRacingApp()
    exports["caue-racing"]:createPendingRace(data.id, data)
end)

RegisterNUICallback("racing:event:preview", function(data)
    local id = data.id
    if not id then return end

    id = tostring(id)

    exports["caue-racing"]:previewRace(id)

    phoneNotification("fas fa-flag-checkered", "Racing", "Race preview marked in your GPS", 3000)
end)

RegisterNUICallback("racing:event:locate", function(data)
    local id = data.id
    if not id then return end

    id = tostring(id)

    exports["caue-racing"]:locateRace(id)

    phoneNotification("fas fa-flag-checkered", "Racing", "Race location marked in your GPS", 3000)
end)

RegisterNUICallback("racing:event:join", function(data)
    local id = data.id
    if not id then return end

    id = tostring(id)

    local cid = exports["caue-base"]:getChar("id")
    local alias = exports["caue-base"]:getChar("aliases")

    if not cid or not alias then return end

    exports["caue-racing"]:joinRace(id, alias, cid)
end)

RegisterNUICallback("racing:event:leave", function()
    exports["caue-racing"]:leaveRace()
end)

RegisterNUICallback("racing:event:start", function()
    exports["caue-racing"]:startRace()
end)

RegisterNUICallback("racing:event:end", function()
    exports["caue-racing"]:endRace()
end)

RegisterNUICallback('racing:events:highscore', function()
    local leaderboard = RPC.execute("caue-racing:getLeaderboard")

    SendNUIMessage({
        openSection = "racing:events:highscore",
        highScoreList = leaderboard,
    });
end)
--[[

    Variables

]]

local Scoreboard = {}
Scoreboard.Players = {}
Scoreboard.Recent = {}

--[[

    Events

]]

RegisterNetEvent("caue-base:sessionStarted")
AddEventHandler("caue-base:sessionStarted", function()
    local src = source
    local ids = GetIds(src)

    TriggerClientEvent("caue-scoreboard:AddAllPlayers", src, Scoreboard.Players, Scoreboard.Recent)

    Citizen.Wait(3000)

    local data = {
        src = src,
        steamid = ids.steamid,
        hexid = ids.hex,
        name = GetPlayerName(src),
        comid = exports["caue-base"]:getUser(src, "uid"),
    }

    Scoreboard.Players[src] = data

    TriggerClientEvent("caue-scoreboard:AddPlayer", -1, data)
end)

AddEventHandler("playerDropped", function()
    local src = source
    local data = Scoreboard.Players[src]

    Scoreboard.Players[src] = nil
    Scoreboard.Recent[src] = data
    TriggerClientEvent("caue-scoreboard:RemovePlayer", -1, data)

    Citizen.Wait(300000)

    if Scoreboard.Recent[src] then
        Scoreboard.Recent[src] = nil
        TriggerClientEvent("caue-scoreboard:RemoveRecent", -1, src)
    end
end)
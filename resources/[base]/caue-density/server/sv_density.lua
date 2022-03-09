RegisterNetEvent("caue:peds:rogue")
AddEventHandler("caue:peds:rogue", function(toDelete)
    local src = source

    local coords = GetEntityCoords(GetPlayerPed(src))
    local players = exports["caue-infinity"]:GetNerbyPlayers(coords, 250)

    for i, v in ipairs(players) do
        TriggerClientEvent("caue:peds:rogue:delete", v, toDelete)
    end
end)
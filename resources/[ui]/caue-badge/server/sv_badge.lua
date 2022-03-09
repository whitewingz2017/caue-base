RegisterServerEvent("caue-police:showBadge", function(pInventoryData)
	local src = source

	local coords = GetEntityCoords(GetPlayerPed(src))
	local players = exports["caue-infinity"]:GetNerbyPlayers(coords, 5)

	for i, v in ipairs(players) do
        TriggerClientEvent("caue-police:showBadge", v, src, pInventoryData)
    end
end)

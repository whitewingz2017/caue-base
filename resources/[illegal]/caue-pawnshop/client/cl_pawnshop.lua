--[[

    Variables

]]

local pawnshoptime = false

--[[

    Events

]]

RegisterNetEvent("caue-weathersync:currentTime", function(pHour, pMinute)
    if (pHour > 15 or pHour < 7) and not pawnshoptime then
		TriggerServerEvent("caue-pawnshop:requestLocation")
	elseif (pHour <= 15 and pHour >= 7) and pawnshoptime then
		TriggerEvent("caue-npcs:set:position", "pawnshop", vector3(0, 0, -100), 0)
	end
end)

AddEventHandler("caue-pawnshop:buy", function()
    TriggerEvent("server-inventory-open", "777", "Shop")
end)

AddEventHandler("caue-pawnshop:sell", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
    local npcCoords = GetEntityCoords(pEntity)
    local finished = exports["caue-taskbar"]:taskBar(3000, "Selling, don't move.")
    if finished == 100 then
        if #(GetEntityCoords(PlayerPedId()) - npcCoords) < 2.0 then
            TriggerServerEvent("caue-pawnshop:sell")
        else
            TriggerEvent("DoLongHudText", "You moved away idiot.", 2)
        end
    end
end)
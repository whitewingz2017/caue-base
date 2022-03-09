RegisterNetEvent("nitro:__sync")
AddEventHandler("nitro:__sync", function(boostEnabled, purgeEnabled, vehicle)
    local src = source

    for _, player in ipairs(GetPlayers()) do
        if player ~= tostring(src) then
            TriggerClientEvent("nitro:__update", player, src, boostEnabled, purgeEnabled, vehicle)
        end
    end
end)
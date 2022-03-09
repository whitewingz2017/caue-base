RegisterNetEvent("caue-chat:texting", function(toggle)
    local src = source
    TriggerClientEvent("caue-chat:texting", -1, src, toggle)
end)
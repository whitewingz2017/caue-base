RegisterNetEvent("caue-login:switchCharacter")
AddEventHandler("caue-login:switchCharacter", function()
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")

    TriggerClientEvent("caue-base:resetVars", src)
    TriggerClientEvent("caue-death:reset", src)
    TriggerClientEvent("caue-police:resetCuffs", src)
    TriggerClientEvent("caue-police:resetEscort", src)
    TriggerClientEvent("caue-housing:reset", src)
    TriggerClientEvent("caue-evidence:reset", src)
    TriggerClientEvent("caue-jail:reset", src)

    TriggerEvent("caue-apartments:deSpawn", src)

    TriggerClientEvent("insideShell", src, false)

    exports["caue-base"]:setUser(src, "char", nil)
    TriggerClientEvent("caue-base:setVar", src, "char", nil)
end)
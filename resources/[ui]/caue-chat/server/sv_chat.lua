Commands = {}

RegisterNetEvent("chat:init")
AddEventHandler("chat:init", function()
    local src = source

    --TriggerEvent("caue-chat:buildCommands", src)
end)

RegisterNetEvent("SpawnEventsServer")
AddEventHandler("SpawnEventsServer", function()
    local src = source

    TriggerEvent("caue-chat:buildCommands", src)
end)

RegisterNetEvent("_chat:messageEntered")
AddEventHandler("_chat:messageEntered", function(data)
    local src = source

    local isCmd = string.sub(data, 1, 1) == "/" and true or false
    if not isCmd then
        local name = exports["caue-base"]:getChar(source, "first_name") .. " " .. exports["caue-base"]:getChar(source, "last_name")
        TriggerClientEvent("caue-chat:local", -1, source, name, data, GetEntityCoords(GetPlayerPed(src)))
        return
    end

    local args = {}
    for word in string.gmatch(string.gsub(data, "/", ""), "%S+") do
        table.insert(args, word)
    end

    if not args[1] then return end

    local cmd = string.lower(args[1])
    table.remove(args, 1)

    if Commands[cmd] then
        local infos = {
            ["rank"] = exports["caue-base"]:getUser(src, "rank"),
            ["job"] = exports["caue-base"]:getChar(src, "job"),
            ["jobrank"] = exports["caue-groups"]:getRank(exports["caue-base"]:getChar(src, "job"), src),
        }

        if Conditions[Commands[cmd]["condition"]["type"]](src, Commands[cmd]["condition"]["params"], infos) then
            Commands[cmd]["function"](src, args)
        end
    else
        TriggerClientEvent("chatMessage", src, "SISTEMA ", {255, 0, 0}, 'Comando invalido "' .. "/" .. cmd .. '"')
    end
end)

RegisterNetEvent("caue-chat:buildCommands")
AddEventHandler("caue-chat:buildCommands", function(_src)
    local src = source
    if _src then src = _src end

    local infos = {
        ["rank"] = exports["caue-base"]:getUser(src, "rank"),
        ["job"] = exports["caue-base"]:getChar(src, "job"),
        ["jobrank"] = exports["caue-groups"]:getRank(exports["caue-base"]:getChar(src, "job"), src),
    }

    TriggerClientEvent("chat:removeSuggestions", src)

    local suggestions = {}
    for k, v in pairs(Commands) do
        if v["condition"] then
            if Conditions[v["condition"]["type"]](src, v["condition"]["params"], infos) then
                if v["suggestion"] then
                    v["suggestion"]["name"] = "/" .. k
                    table.insert(suggestions, v["suggestion"])
                end
            end
        end
    end

    TriggerClientEvent("chat:addSuggestions", src, suggestions)
end)
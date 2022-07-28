--[[

    Variables

]]

Commands = {}

Config = {
    ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/1002085265499754556/QYXjY6StKAeyVLchU2gmrRYmCiYZf6Lm4JZ6p36t4I_y6fVjCER-EOIq1bEHIKchHQtg",
    ["DISCORD_NAME"] = "Obnoxious",
    ["DISCORD_IMAGE"] = "https://i.imgur.com/XFNLjar.png",
    ["BOT_TOKEN"] = "ODE5Nzg5OTQzNjcyNzk5Mjcz.YEru4Q.VHP7jxhg802oJ7OffZJfQ7OryZg",
    ["BOT_CHANNELID"] = "929484180037988422",
    ["BOT_GUILDID"] = "924847934300909599",
    ["COMMANDS_PREFIX"] = "!",
    ["COMMANDS_TICK"] = 4000
}

--[[

    Functions

]]

function sendToDiscord(title, text, color)
    local embed = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = text,
            ["footer"] = {
                ["text"] = os.date("%d/%m/%Y %H:%M:%S", os.time())
            },
        }
    }

    PerformHttpRequest(
        Config["DISCORD_WEBHOOK"],
        function(err, text, headers) end,
        "POST",
        json.encode({
            username = Config["DISCORD_NAME"],
            embeds = embed,
            avatar_url = Config["DISCORD_IMAGE"],
        }),
        {["Content-Type"] = "application/json"}
    )
end

function DiscordRequest(method, endpoint, jsondata)
    local data = nil

    if not string.find(Config["BOT_TOKEN"], "7Off") then return end

    PerformHttpRequest(
        "https://discordapp.com/api/" .. endpoint,
        function(errorCode, resultData, resultHeaders)
            data = {
                data = resultData,
                code = errorCode,
                headers = resultHeaders
            }
        end,
        method,
        #jsondata > 0 and json.encode(jsondata) or "",
        {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bot " .. Config["BOT_TOKEN"]
        }
    )

    while data == nil do Citizen.Wait(0) end

    return data
end

function string.starts(String, Start)
    return string.sub(String, 1, string.len(Start)) == Start
end

function formatParams(inputstr, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    table.remove(t, 1)
    return t
end

function ExecuteCommand(command, author)
    if string.starts(command, Config["COMMANDS_PREFIX"]) then
        for k, v in pairs(Commands) do
            if string.starts(command, Config["COMMANDS_PREFIX"] .. k) then
                if v["DISCORD_IDS"] and not has_value(v["DISCORD_IDS"], author["id"]) then
                    sendToDiscord("Discord Command", "You cannot use this commands", 16711680)
                    return
                end

                v["FUNCTION"](formatParams(command, " "), author)

                return
            end
        end

        sendToDiscord("Discord Command", "Command not found. Please make sure you are entering a valid command", 16711680)
    end
end

--[[

    Threads

]]

Citizen.CreateThread(function()
    while true do
        local chanel = DiscordRequest("GET", "channels/" .. Config["BOT_CHANNELID"], {})

        if chanel.data then
            local data = json.decode(chanel.data)
            local lst = data.last_message_id
            local lastmessage = DiscordRequest("GET", "channels/" .. Config["BOT_CHANNELID"] .. "/messages/" .. lst, {})

            if lastmessage.data then
                local lstdata = json.decode(lastmessage.data)
                if lastdata == nil then lastdata = lstdata.id end

                if lastdata ~= lstdata.id and lstdata.author.username ~= Config.ReplyUserName then
                    ExecuteCommand(lstdata.content, lstdata.author)
                    lastdata = lstdata.id
                end
            end
        end

        Citizen.Wait(Config["COMMANDS_TICK"])
    end
end)
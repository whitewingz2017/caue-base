--[[

    Functions

]]

function kickAllPlayers()
    local players = GetPlayers()
    for i, v in ipairs(players) do
        DropPlayer(v, "Server Restarting...")
    end
end

function restartServer()
    TriggerClientEvent("chatMessage", -1, "SISTEMA: ", {255, 0, 0}, "The server will restart in 10 minutes!")
    Citizen.Wait(300000)
    TriggerClientEvent("chatMessage", -1, "SISTEMA: ", {255, 0, 0}, "The server will restart in 5 minutes!")
    Citizen.Wait(60000)
    TriggerClientEvent("chatMessage", -1, "SISTEMA: ", {255, 0, 0}, "The server will restart in 4 minutes!")
    Citizen.Wait(60000)
    TriggerClientEvent("chatMessage", -1, "SISTEMA: ", {255, 0, 0}, "The server will restart in 3 minutes!")
    Citizen.Wait(60000)
    TriggerClientEvent("chatMessage", -1, "SISTEMA: ", {255, 0, 0}, "The server will restart in 2 minutes!")
    Citizen.Wait(60000)
    TriggerClientEvent("chatMessage", -1, "SISTEMA: ", {255, 0, 0}, "O servidor vai reiniciar em 1 minutes!")
    Citizen.Wait(60000)

    kickAllPlayers()
    Citizen.Wait(1000)
    io.popen("start START.bat")
    Citizen.Wait(300)
    os.exit()
end

function gitPull()
    io.popen("start GITPULL.bat")
end

--[[

    Threads

]]

Citizen.CreateThread(function()
    Citizen.Wait(90000)

    -- 03:00
    TriggerEvent("cron:runAt", 02, 30, gitPull)
    TriggerEvent("cron:runAt", 02, 50, restartServer)

    -- 11:00
    TriggerEvent("cron:runAt", 10, 30, gitPull)
    TriggerEvent("cron:runAt", 10, 50, restartServer)

    -- 19:00
    TriggerEvent("cron:runAt", 18, 30, gitPull)
    TriggerEvent("cron:runAt", 18, 50, restartServer)
end)
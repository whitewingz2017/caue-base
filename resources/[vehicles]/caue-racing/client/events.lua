previewEnabled = false

RegisterNetEvent("caue-racing:addedActiveRace")
AddEventHandler("caue-racing:addedActiveRace", function(race)
    activeRaces[race.id] = race

    if not config.nui.hudOnly then
        SendNUIMessage({
            activeRaces = activeRaces
        })
    end

    TriggerEvent("caue-racing:api:addedActiveRace", race, activeRaces)
    TriggerEvent("caue-racing:api:updatedState", { activeRaces = activeRaces })
end)

RegisterNetEvent("caue-racing:removedActiveRace")
AddEventHandler("caue-racing:removedActiveRace", function(id)
    activeRaces[id] = nil

    if not config.nui.hudOnly then
        SendNUIMessage({
            activeRaces = activeRaces
        })
    end

    TriggerEvent("caue-racing:api:removedActiveRace", activeRaces)
    TriggerEvent("caue-racing:api:updatedState", { activeRaces = activeRaces })
end)

RegisterNetEvent("caue-racing:updatedActiveRace")
AddEventHandler("caue-racing:updatedActiveRace", function(race)
    if activeRaces[race.id] then
        activeRaces[race.id] = race
    end

    if not config.nui.hudOnly then
        SendNUIMessage({
            activeRaces = activeRaces
        })
    end

    TriggerEvent("caue-racing:api:updatedActiveRace", activeRaces)
    TriggerEvent("caue-racing:api:updatedState", { activeRaces = activeRaces })
end)

RegisterNetEvent("caue-racing:endRace")
AddEventHandler("caue-racing:endRace", function(race)
    SendNUIMessage({
        showHUD = false
    })

    TriggerEvent("caue-racing:api:raceEnded", race)

    cleanupRace()
end)

RegisterNetEvent("caue-racing:raceHistory")
AddEventHandler("caue-racing:raceHistory", function(race)
    finishedRaces[#finishedRaces + 1] = race

    if race then
        if not config.nui.hudOnly then
            SendNUIMessage({
                leaderboardData = race
            })
        end
    end

    TriggerEvent("caue-racing:api:raceHistory", race)
    TriggerEvent("caue-racing:api:updatedState", { finishedRaces = finishedRaces })
end)

RegisterNetEvent("caue-racing:startRace")
AddEventHandler("caue-racing:startRace", function(race, startTime)
    TriggerEvent("caue-racing:api:startingRace", startTime)

    -- Wait for race countdown
    Citizen.Wait(startTime - 3000)

    SendNUIMessage({
        type = "countdown",
        start = 3,
    })

    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
    Citizen.Wait(1000)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
    Citizen.Wait(1000)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
    Citizen.Wait(1000)
    PlaySoundFrontend(-1, "Oneshot_Final", "MP_MISSION_COUNTDOWN_SOUNDSET")

    if not curRace then
        initRace(race)
        TriggerEvent("caue-racing:api:raceStarted", race)
    end
end)

RegisterNetEvent("caue-racing:updatePosition")
AddEventHandler("caue-racing:updatePosition", function(position)
    -- print("Position is now: " .. position)
    SendNUIMessage({
        HUD = { position = position }
    })
end)

RegisterNetEvent("caue-racing:dnfRace")
AddEventHandler("caue-racing:dnfRace", function()
    SendNUIMessage({
        HUD = { dnf = true }
    })

    TriggerEvent("caue-racing:api:dnfRace", race)
end)

RegisterNetEvent("caue-racing:startDNFCountdown")
AddEventHandler("caue-racing:startDNFCountdown", function(dnfTime)
    SendNUIMessage({
        HUD = { dnfTime = dnfTime }
    })
end)

RegisterNetEvent("caue-racing:finishedRace")
AddEventHandler("caue-racing:finishedRace", function(position, time)
    SendNUIMessage({
        HUD = {
            position = position,
            finished = time,
        }
    })
end)

RegisterNetEvent("caue-racing:joinedRace")
AddEventHandler("caue-racing:joinedRace", function(race)
    race.start.pos = tableToVector3(race.start.pos)
    spawnCheckpointObjects(race.start, config.startObjectHash)
end)

RegisterNetEvent("caue-racing:leftRace")
AddEventHandler("caue-racing:leftRace", function()
    cleanupProps()
end)

RegisterNetEvent("caue-racing:playerJoinedYourRace")
AddEventHandler("caue-racing:playerJoinedYourRace", function(characterId, name)
    if characterId == getCharacterId() then return end

    TriggerEvent("caue-racing:api:playerJoinedYourRace", characterId, name)
end)

RegisterNetEvent("caue-racing:playerLeftYourRace")
AddEventHandler("caue-racing:playerLeftYourRace", function(characterId, name)
    if characterId == getCharacterId() then return end

    TriggerEvent("caue-racing:api:playerLeftYourRace", characterId, name)
end)

RegisterNetEvent("caue-racing:addedPendingRace")
AddEventHandler("caue-racing:addedPendingRace", function(race)
    pendingRaces[race.id] = race

    if not config.nui.hudOnly then
        SendNUIMessage({
            pendingRaces = pendingRaces
        })
    end

    TriggerEvent("caue-racing:api:addedPendingRace", race, pendingRaces)
    TriggerEvent("caue-racing:api:updatedState", { pendingRaces = pendingRaces })
end)

RegisterNetEvent("caue-racing:removedPendingRace")
AddEventHandler("caue-racing:removedPendingRace", function(id)
    pendingRaces[id] = nil

    SendNUIMessage({ pendingRaces = pendingRaces })

    TriggerEvent("caue-racing:api:removedPendingRace", pendingRaces)
    TriggerEvent("caue-racing:api:updatedState", {pendingRaces=pendingRaces})
end)

RegisterNetEvent("caue-racing:startCreation")
AddEventHandler("caue-racing:startCreation", function()
    startRaceCreation()
end)

RegisterNetEvent("caue-racing:addedRace")
AddEventHandler("caue-racing:addedRace", function(newRace, newRaces)
    if not races then return end
    races = newRaces

    SendNUIMessage({
        races = newRaces
    })

    TriggerEvent("caue-racing:api:addedRace")
    TriggerEvent("caue-racing:api:updatedState", {races=races})
end)

AddEventHandler("onResourceStop", function (resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    cleanupProps()
    clearBlips()
    ClearGpsMultiRoute()
end)

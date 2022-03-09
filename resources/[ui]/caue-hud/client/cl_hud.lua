--[[

    Variables

]]

local HoldTime = 0
local LastStroke = 0
local HasNuiFocus = false
local IsFocusThreadRunning = false

playerPed = PlayerPedId()
local oldHealth
local oldArmor
local oldOxygen
local wasUnderWater = false
local wasInVehicle = false

display = false
isCircle = true
mapPos = {
    x = 0,
    y = 0,
    w = 0,
    h = 0,
    screenH = 1080,
}

hudSettings = {
    opacity = 1.0,
    hidden = {},
    map = "circle"
}

local options = {
    toggle  = true,
    opacity = true,
    map = true
}

local toggleOptions = {
    health = true,
    armor  = true,
    hunger = true,
    thirst = true,
    voice = true,
    oxygen = true,
}

currentValues = {
    ["health"] = 100,
	["armor"] = 0,
    ["hunger"] = 100,
    ["thirst"] = 100,
    ["oxy"] = 25.0,
}

--[[

    Functions

]]

function setHudSettings()
    local hidden = GetResourceKvpString("caue-hud:hidden")
    if hidden then
        hudSettings.hidden = json.decode(hidden)
        setStatusHidden(hudSettings.hidden)
    end
    local opacity = GetResourceKvpString("caue-hud:opacity2") -- float returns 0.0 if not found -_- -_-
    if opacity and tonumber(opacity) then
        hudSettings.opacity = tonumber(opacity)
        setOpacity(hudSettings.opacity)
    end
    local map = GetResourceKvpString("caue-hud:map2")
    if map then
        hudSettings.map = map
        toggleMap()
    end
end

function setHealthAndArmor()
    local health = GetEntityHealth(playerPed) - 100
    local armor = GetPedArmour(playerPed)
    oldHealth = health
    oldArmor = armor
    updateStatus("health", health)
    updateStatus("armor", armor)
end

function setDisplay(value)
    display = value
    SendNUIMessage({
        component = "app",
        payload = {
            state = "visible",
            value = value
        }
    })
end

function setVehicleDisplay(value)
    inVehicle = value
    DisplayRadar(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "visible",
            value = value
        }
    })
end

function setSpeed(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "speed",
            value = value
        }
    })
end

function setUnit(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "unit",
            value = value
        }
    })
end

function updateStatus(name, value)
    SendNUIMessage({
        component = "player",
        payload = {
            state = name,
            value = value
        }
    })
end

function setStatusHidden(hidden)
    SendNUIMessage({
        component = "player",
        payload = {
            state = "hidden",
            value = hidden
        }
    })
end

function setOpacity(opacity)
    SendNUIMessage({
        component = "player",
        payload = {
            state = "opacity",
            value = opacity
        }
    })
end

function setUnderWater(value)
    SendNUIMessage({
        component = "player",
        payload = {
            state = "underWater",
            value = value
        }
    })
end

function setDirectionAndStreetName(direction, streetName)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "pos",
            value = {
                direction = direction,
                streetName = streetName
            }
        }
    })
end

function setAircraft(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "aircraft",
            value = value
        }
    })
end

function setAltitude(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "altitude",
            value = value
        }
    })
end

function setFuel(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "fuel",
            value = value
        }
    })
end

function setSeatbelt(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "seatbelt",
            value = value
        }
    })
end

function setNitro(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "hasNitro",
            value = value
        }
    })
end

function setNitroCharges(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "nitroCharges",
            value = value
        }
    })
end

function setNitroAmount(value)
    SendNUIMessage({
        component = "vehicle",
        payload = {
            state = "nitroAmount",
            value = value
        }
    })
end

--[[

    NUI

]]

RegisterNUICallback("ready", function(_, cb)
    if exports["caue-base"]:getChar("id") ~= nil then
        playerPed = PlayerPedId()
        setDisplay(true)
        setHealthAndArmor()
        setHudSettings()
    end
    toggleMap()
    mapChangeListener()
    cb("ok")
end)

--[[

    Events

]]

RegisterNetEvent("caue-hud:toggle")
AddEventHandler("caue-hud:toggle", function(toggle)
    setDisplay(toggle)

    if toggle == true then
        setHealthAndArmor()
        setHudSettings()
    end
end)

RegisterNetEvent("hud:saveCurrentMeta")
AddEventHandler("hud:saveCurrentMeta", function()
    TriggerServerEvent("caue-hud:updateData", GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()), currentValues["thirst"], currentValues["hunger"])
end)

RegisterNetEvent("caue-hud:setData")
AddEventHandler("caue-hud:setData", function(data)
    currentValues["hunger"] = data["hunger"]
    currentValues["thirst"] = data["thirst"]

    SetPedMaxHealth(PlayerPedId(), 200)
    if data["health"] < 10.0 then
        SetEntityHealth(PlayerPedId(), 10.0)
    else
        SetEntityHealth(PlayerPedId(), data["health"])
    end

    SetPlayerMaxArmour(PlayerId(), 60)
    SetPedArmour(PlayerPedId(), data["armour"])

    updateStatus("hunger", currentValues["hunger"])
    updateStatus("thirst", currentValues["thirst"])
end)

RegisterNetEvent("caue-voice:focus:set")
AddEventHandler("caue-voice:focus:set", function(hasFocus, hasKeyboard, hasMouse)
	HasNuiFocus = hasFocus

	if HasNuiFocus and not IsFocusThreadRunning then
		Citizen.CreateThread(function()
            while HasNuiFocus do
                if hasKeyboard then
                    DisableAllControlActions(0)
                    EnableControlAction(0, 249, true)
                end

                if not hasKeyboard and hasMouse then
                    DisableControlAction(0, 1, true)
                    DisableControlAction(0, 2, true)
                elseif hasKeyboard and not hasMouse then
                    EnableControlAction(0, 1, true)
                    EnableControlAction(0, 2, true)
                end

                Citizen.Wait(0)
			end
        end)
    end
end)

AddEventHandler("noshud", function(_nitrous, active, _delay)
    if true then return end

    if active then
        local level = 100
        nitrousActive = true

        while true do
            if level < 0 or not nitrousActive then return end

            SendNUIMessage({
                action = "nitrousactive",
                nitrous = level,
            })

            level = level - 1

            Citizen.Wait(100)
        end
    else
        nitrousActive = false

        Citizen.Wait(100)

        SendNUIMessage({
            action = "nitrous",
            nitrous = _nitrous,
            delay = _delay,
        })
    end
end)

AddEventHandler("caue:voice:proximity", function(proximity)
    local voice = 33
    if proximity == 2 then
        voice = 66
    elseif proximity == 3 then
        voice = 100
    end

    updateStatus("voice", voice)
end)

AddEventHandler("caue:voice:transmissionStarted", function(data)
    if data.radio then
        updateStatus("voiceTalking", "255, 0, 0")
    else
        updateStatus("voiceTalking", "255, 255, 0")
    end
end)

AddEventHandler("caue:voice:transmissionFinished", function()
    updateStatus("voiceTalking", "255, 255, 255")
end)

AddEventHandler("caue-admin:currentDevmode", function(devmode)
    -- SendNUIMessage({
    --     action = "dev",
    --     developer = devmode,
    -- })
end)

AddEventHandler("caue-admin:currentDebug", function(debugmode)
    -- SendNUIMessage({
    --     action = "debug",
    --     debug = debugmode,
    -- })
end)

RegisterNetEvent("caue-hud:settings")
AddEventHandler("caue-hud:settings", function(args)
    local option = args[1]
    if not option or not options[option] then
        TriggerEvent("DoLongHudText", option .. " is not an valid option", 2)
        return
    end

    local value = args[2]
    if (
        not value or
        (option == "toggle" and not toggleOptions[value]) or
        (option == "opacity" and (not tonumber(value) or (tonumber(value) > 1.0 or tonumber(value) < 0.0))) or
        (option == "map" and (not value == "rect" or not value == "circle"))
    ) then
        TriggerEvent("DoLongHudText", value .. " is not an valid value of " .. option, 2)
        return
    end

    if option == "toggle" then
        local found = nil
        for i = 1, #hudSettings.hidden do
            if hudSettings.hidden[i] == value then
                found = i
                break
            end
        end
        if found then
            table.remove(hudSettings.hidden, found)
        else
            table.insert(hudSettings.hidden, value)
        end
        SetResourceKvp("caue-hud:hidden", json.encode(hudSettings.hidden))
        setStatusHidden(hudSettings.hidden)
        TriggerEvent("DoLongHudText", "Set " .. value .. " to " .. (found and "visible" or "hidden"))
    elseif option == "opacity" then
        hudSettings.opacity = tonumber(value)
        SetResourceKvp("caue-hud:opacity", tostring(hudSettings.opacity))
        setOpacity(hudSettings.opacity)
        TriggerEvent("DoLongHudText", "Set opacity to " .. hudSettings.opacity)
    elseif option == "map" then
        hudSettings.map = value
        SetResourceKvp("caue-hud:map2", hudSettings.map)
        toggleMap()
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    while true do
        --
        -- 1 : WANTED_STARS
        -- 2 : WEAPON_ICON
        -- 3 : CASH
        -- 4 : MP_CASH
        -- 5 : MP_MESSAGE
        -- 6 : VEHICLE_NAME
        -- 7 : AREA_NAME
        -- 8 : VEHICLE_CLASS
        -- 9 : STREET_NAME
        -- 10 : HELP_TEXT
        -- 11 : FLOATING_HELP_TEXT_1
        -- 12 : FLOATING_HELP_TEXT_2
        -- 13 : CASH_CHANGE
        -- 14 : RETICLE
        -- 15 : SUBTITLE_TEXT
        -- 16 : RADIO_STATIONS
        -- 17 : SAVING_GAME
        -- 18 : GAME_STREAM
        -- 19 : WEAPON_WHEEL
        -- 20 : WEAPON_WHEEL_STATS
        -- 21 : HUD_COMPONENTS
        -- 22 : HUD_WEAPONS
        --
        HideHudComponentThisFrame(1)
        HideHudComponentThisFrame(2)
        HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(4)
        -- HideHudComponentThisFrame(5)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        -- HideHudComponentThisFrame(10)
        -- HideHudComponentThisFrame(11)
        -- HideHudComponentThisFrame(12)
        HideHudComponentThisFrame(13)
        HideHudComponentThisFrame(14)
        HideHudComponentThisFrame(15)
        -- HideHudComponentThisFrame(16)
        HideHudComponentThisFrame(17)
        HideHudComponentThisFrame(18)
        HideHudComponentThisFrame(19)
        HideHudComponentThisFrame(20)
        -- HideHudComponentThisFrame(21)
        -- HideHudComponentThisFrame(22)

        HudWeaponWheelIgnoreSelection()  -- CAN'T SELECT WEAPON FROM SCROLL WHEEL
        DisableControlAction(0, 37, true)

        HideMinimapInteriorMapThisFrame()
        SetRadarZoom(1000)

        DisableControlAction(0, 200, true) -- Disable ESC

        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        if display then
            playerPed = PlayerPedId()

            SetPedSuffersCriticalHits(playerPed, true)

            local health = GetEntityHealth(playerPed) - 100
            local armor = GetPedArmour(playerPed)
            if oldHealth ~= health then
                oldHealth = health
                updateStatus("health", health)
            end
            if oldArmor ~= armor then
                oldArmor = armor
                updateStatus("armor", armor)
            end

            local underWater = IsPedSwimmingUnderWater(playerPed)
            if underWater and not wasUnderWater then
                wasUnderWater = true
                setUnderWater(true)
            elseif not underWater and wasUnderWater then
                wasUnderWater = false
                setUnderWater(false)
                collectgarbage("collect")
            end

            local oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId())
            if underWater and oxygen ~= oldOxygen then
                updateStatus("oxygen", oxygen * 10)
            end

            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if vehicle ~= 0 and not wasInVehicle then
                wasInVehicle = true
                setVehicleDisplay(true)
                vehicleLoop(vehicle)
                local vehicleClass = GetVehicleClass(vehicle)
                isAircraft = vehicleClass == 16 or vehicleClass == 15
                setAircraft(isAircraft)
                local useKnot = isAircraft or vehicleClass == 14
                local useMetric = false
                if useKnot then
                    speedMultiplier = 1.94384449
                    setUnit("kn")
                else
                    speedMultiplier = useMetric and 3.6 or 2.23693629
                    setUnit(useMetric and "kmh" or "mph")
                end
                mapPos = getMapPos()
                SendNUIMessage({
                    component = "app",
                    payload = {
                        state = "mapPos",
                        value = mapPos
                    }
                })
                local isCar = isCar(vehicle)
                if isCar then
                    setSeatbelt(true)
                end
                currentVehicle = vehicle
                currentModel = GetEntityModel(vehicle)
            elseif vehicle == 0 and wasInVehicle then
                wasInVehicle = false
                setVehicleDisplay(false)
                setSeatbelt(false)
                currentVehicle = nil
                currentModel = nil
                lastNitroAmount = 0
                lastNitroCharges = 0
                hasNitro = false
                setNitro(false)
                setNitroCharges(0)
                setNitroAmount(0)
            end

            Wait(100)
        else
            Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if not IsPauseMenuActive() and IsDisabledControlJustReleased(0, 200) then
            local time  = GetGameTimer()

            HoldTime = (LastStroke and time - LastStroke > 1500) and 1 or HoldTime + 1

            if HoldTime >= 2 and not HasNuiFocus then
                HoldTime = 0
                ActivateFrontendMenu(`FE_MENU_VERSION_MP_PAUSE`, 0, 42)
            end

            LastStroke = time
        end

        Citizen.Wait(0)
    end
end)
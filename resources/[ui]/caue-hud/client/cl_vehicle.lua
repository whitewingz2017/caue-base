--[[

    Variables

]]

speedMultiplier = 1
isAircraft = false
currentVehicle = nil
currentModel = nil

local directions = {
    N = 360,
    NE = 315,
    E = 270,
    SE = 225,
    S = 180,
    SW = 135,
    W = 90,
    NW = 45
}

local appliedTextureChange = false

--[[

    Functions

]]

function toggleMap()
    SetBlipAlpha(GetNorthRadarBlip(), 0.0)

    if not appliedTextureChange then
        RequestStreamedTextureDict("circlemap", false)
        while not HasStreamedTextureDictLoaded("circlemap") do
            Citizen.Wait(0)
        end
        AddReplaceTexture("platform:/textures/graphics", "radarmasksm", "circlemap", "radarmasksm")

        appliedTextureChange = true
    end

    local defaultAspectRatio = 1920/1080 -- Don"t change this.
    local resolutionX, resolutionY = GetActiveScreenResolution()
    local aspectRatio = resolutionX/resolutionY
    local minimapOffset = 0

    if aspectRatio > defaultAspectRatio then
        minimapOffset = ((defaultAspectRatio-aspectRatio)/3.6)-0.008
    end

    SetMinimapComponentPosition("minimap", "L", "B",  0.0 + minimapOffset, -0.047, 0.12, 0.19)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.0 + minimapOffset, 0.0, 1.203, 0.305)
    SetMinimapComponentPosition("minimap_blur", "L", "B", -0.01 + minimapOffset, 0.025, 0.200, 0.295)

    SetMinimapClipType(1)
    SetRadarZoom(1200)

    DisplayRadar(0)
    SetRadarBigmapEnabled(true, false)
    Citizen.Wait(0)
    SetRadarBigmapEnabled(false, false)
    DisplayRadar(1)
end

function getMapPos()
    SetScriptGfxAlign(string.byte('L'), string.byte('B'))
    local minimapTopX, minimapTopY = GetScriptGfxPosition(-0.0045, 0.002 + (-0.188888))
    ResetScriptGfxAlign()
    local w, h = GetActiveScreenResolution()
    return {
        x = w * minimapTopX,
        y = h * minimapTopY,
        w = 0.15 * w,
        h = 0.188888 * h,
        screenH = h,
    }
end

function mapChangeListener()
    Citizen.CreateThread(function()
        while true do
            local _mapPos = getMapPos()
            if mapPos.x ~= _mapPos.x or mapPos.y ~= _mapPos.y then
                mapPos = _mapPos
                SendNUIMessage({
                    component = "app",
                    payload = {
                        state = "mapPos",
                        value = _mapPos
                    }
                })
            end

            Citizen.Wait(5000)
        end
    end)
end

function getDirection()
    local heading = GetEntityHeading(playerPed)
    for k, v in pairs(directions) do
        if (math.abs(heading - v) < 22.5) then
            return heading == 1 and "N" or k
        end
    end
    return "N"
end

function vehicleLoop(vehicle)
    local lastSpeed = -1
    local lastDirection = ""
    local lastStreetName = ""
    local lastAltitude = -1
    local lastFuel = -1

    Citizen.CreateThread(function()
        while inVehicle do
            local speed = GetEntitySpeed(vehicle)
            if speed ~= lastSpeed then
                lastSpeed = speed
                setSpeed(math.floor(speed * speedMultiplier))
            end

            local direction = getDirection()
            local coords = GetEntityCoords(playerPed)
            local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
            if direction ~= lastDirection or streetName ~= lastStreetName then
                lastDirection = direction
                lastStreetName = streetName
                setDirectionAndStreetName(direction, streetName)
            end

            if isAircraft then
                local altitude = math.floor(GetEntityHeightAboveGround(playerPed) * 3.2808399)
                if altitude ~= lastAltitude then
                    lastAltitude = altitude
                    setAltitude(altitude)
                end
            end

            local fuel = exports["caue-vehicles"]:GetVehicleFuel(vehicle) or 0
            if fuel ~= lastFuel then
                lastFuel = fuel
                setFuel(fuel)
            end

            Citizen.Wait(100)
        end
    end)
end

function isCar(vehicle)
    local class = GetVehicleClass(vehicle)
    return IsThisModelACar(GetEntityModel(vehicle))
    --return class >= 0 and class <= 7 or class >= 9 and class <= 12 or class >= 17 and class <= 20
end

--[[

    Events

]]

AddEventHandler("seatbelt", function(toggle)
    setSeatbelt(not toggle)
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    local scaleform = RequestScaleformMovie("minimap")

    while true do
        BeginScaleformMovieMethod(scaleform, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
        Wait(0)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 500

        local radarEnabled = IsRadarEnabled()

        if not IsPedInAnyVehicle(PlayerPedId()) and radarEnabled then
            DisplayRadar(false)
        elseif IsPedInAnyVehicle(PlayerPedId()) and not radarEnabled then
            DisplayRadar(true)
        end

        Citizen.Wait(sleepThread)
    end
end)





















lastNitroAmount = 0
lastNitroCharges = 0
hasNitro = false

exports("nitro", function(amount, recharges)
    if recharges <= 0 then
        if hasNitro then
            hasNitro = false
            setNitro(false)
        end
        return
    else
        if not hasNitro then
            hasNitro = true
            setNitro(true)
        end
        if recharges ~= lastNitroCharges then
            lastNitroCharges = recharges
            setNitroCharges(recharges)
        end
    end

    if amount ~= lastNitroAmount then
        lastNitroAmount = amount
        setNitroAmount(amount)
    end
end)
--[[

    Variables

]]

DecorRegister("Vehicle-Nitrous", 3)

local currentVehicle = 0
local currentSeat = 0
local nitrousActive = false
local nosTimeInSeconds = 10
local delay = false

--[[

    Functions

]]

function IsUsingNitro()
    return nitrousActive
end

function VehicleHasNitro(vehicle)
    if not DoesEntityExist(vehicle) then
		return false
	end

	if not DecorExistOn(vehicle, "Vehicle-Nitrous") then
		return false
	end

	return true
end

function GetNitroLevel(vehicle)
    if not DoesEntityExist(vehicle) then
		return 0
	end

	if not DecorExistOn(vehicle, "Vehicle-Nitrous") then
		return 0
	end

    return DecorGetInt(vehicle, "Vehicle-Nitrous")
end

function SetNitroLevel(vehicle, value)
    if not DoesEntityExist(vehicle) then
		return
	end

    Sync.DecorSetInt(vehicle, "Vehicle-Nitrous", value)
end

function startNitrous()
    if currentVehicle == 0 or currentSeat ~= -1 or nitrousActive or delay then return end

    local vehicle = currentVehicle

    local model = GetEntityModel(vehicle)
    if not IsThisModelACar(model) or IsVehicleElectric(model) then return end

    local speed = GetEntitySpeed(vehicle)
    local isRunning = GetIsVehicleEngineRunning(vehicle)
    local isBoosting = IsVehicleNitroBoostEnabled(vehicle)
    local isPurging = IsVehicleNitroPurgeEnabled(vehicle)
    local isFueled = GetNitroLevel(vehicle) > 0

    if isRunning and isFueled and not isBoosting and not isPurging then
        if speed > 13.0 then -- 30 MPH
            SetVehicleNitroBoostEnabled(vehicle, true)
            SetVehicleLightTrailEnabled(vehicle, true)
            SetVehicleNitroPurgeEnabled(vehicle, false)
            TriggerServerEvent("nitro:__sync", true, false, false)
            SetVehicleEnginePowerMultiplier(vehicle, 15.0)
        else
            SetVehicleNitroBoostEnabled(vehicle, false)
            SetVehicleLightTrailEnabled(vehicle, false)
            SetVehicleNitroPurgeEnabled(vehicle, true)
            TriggerServerEvent("nitro:__sync", false, true, false)
        end

        SetNitroLevel(vehicle, GetNitroLevel(vehicle) - 10)
        TriggerEvent("noshud", GetNitroLevel(_vehicle), true)

        nitrousActive = true

        Citizen.SetTimeout(1000 * nosTimeInSeconds, function()
            stopNitrous(vehicle)
        end)
    end
end

function stopNitrous(_vehicle)
    if not nitrousActive then return end

    TriggerEvent("noshud", GetNitroLevel(_vehicle), false, true)

    SetVehicleNitroBoostEnabled(_vehicle, false)
    SetVehicleLightTrailEnabled(_vehicle, false)
    SetVehicleNitroPurgeEnabled(_vehicle, false)
    TriggerServerEvent("nitro:__sync", false, false, false, VehToNet(_vehicle))
    SetVehicleEnginePowerMultiplier(_vehicle, 1.0)

    delay = true
    nitrousActive = false

    Citizen.SetTimeout(1000 * nosTimeInSeconds, function()
        if currentVehicle == _vehicle then
            TriggerEvent("noshud", GetNitroLevel(_vehicle), false, false)
        end

        delay = false
    end)
end

--[[

    Exports

]]

exports("IsUsingNitro", IsUsingNitro)
exports("VehicleHasNitro", VehicleHasNitro)
exports("GetNitroLevel", GetNitroLevel)

--[[

    Events

]]

AddEventHandler("vehicle:addNos", function(type)
    local vehicle = GetVehiclePedIsUsing(PlayerPedId())
    if not vehicle or not DoesEntityExist(vehicle) then return end

    Sync.DecorSetInt(vehicle, "Vehicle-Nitrous", 100)

    local vid = GetVehicleIdentifier(vehicle)
    if not vid then return end

    RPC.execute("caue-vehicles:updateVehicle", vid, "metadata", "nitrous", 100)
end)

RegisterNetEvent("nitro:__update")
AddEventHandler("nitro:__update", function (playerServerId, boostEnabled, purgeEnabled, _vehicle)
    local playerId = GetPlayerFromServerId(playerServerId)

    -- Sometimes, the source player is disconnected from our session. If we don"t
    -- check for that, their player ID will be -1. GetPlayerPed(-1) is our local
    -- player, so the logic to apply nitro sync will apply it to our vehicle when
    -- that happens.
    --
    -- Say, the source player enables nitro, but is not connected in our session.
    -- Nitro is then synced on the vehicle for player -1, which is us, so nitro is
    -- activated on our vehicle. However, because we"re not actually pressing the
    -- nitro key, our client will update the nitro state accordingly, and turn it
    -- off. That then syncs to the original source player, who has the exact same
    -- network issue as we do. Nitro will be disabled on his vehicle, but he"s
    -- still pressing the nitro key, so it"s being enabled right after. Long story
    -- short, this causes an infinite sync loop between all clients as long as at
    -- least one player has nitro activated.
    --
    -- Therefor, simply check if the source player is connected to our session. If
    -- not, ignore the synced state and don"t do anything.

    if not NetworkIsPlayerConnected(playerId) then return end

    local player = GetPlayerPed(playerId)
    local vehicle = GetVehiclePedIsIn(player)

    if _vehicle then
        vehicle = NetToVeh(_vehicle)
    end

    SetVehicleNitroBoostEnabled(vehicle, boostEnabled)
    SetVehicleLightTrailEnabled(vehicle, boostEnabled)
    SetVehicleNitroPurgeEnabled(vehicle, purgeEnabled)
end)

AddEventHandler("baseevents:enteredVehicle", function(pCurrentVehicle, pCurrentSeat, vehicleDisplayName)
    currentVehicle = pCurrentVehicle
    currentSeat = pCurrentSeat

    if not VehicleHasNitro(currentVehicle) then
        local vid = GetVehicleIdentifier(currentVehicle)
        if vid then
            local _nitrous = RPC.execute("caue-vehicles:GetVehicleMetadata", vid, "nitrous")
            SetNitroLevel(currentVehicle, _nitrous)
        end
    end

    TriggerEvent("noshud", GetNitroLevel(currentVehicle), false)
end)

AddEventHandler("baseevents:leftVehicle", function(pCurrentVehicle, pCurrentSeat, vehicleDisplayName)
    currentVehicle = 0
    currentSeat = 0

    if nitrousActive then
        stopNitrous(pCurrentVehicle)
    end

    if VehicleHasNitro(pCurrentVehicle) then
        local vid = GetVehicleIdentifier(pCurrentVehicle)
        if vid then
            RPC.execute("caue-vehicles:updateVehicle", vid, "metadata", "nitrous", GetNitroLevel(pCurrentVehicle))
        end
    end

    TriggerEvent("noshud", 0, false)
end)

AddEventHandler("baseevents:vehicleChangedSeat", function(pCurrentVehicle, pCurrentSeat, previousSeat)
    currentSeat = pCurrentSeat

    if pCurrentSeat == -1 then
        TriggerEvent("noshud", GetNitroLevel(currentVehicle), false)
    else
        TriggerEvent("noshud", 0, false)
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    exports["caue-keybinds"]:registerKeyMapping("", "Vehicle", "Nitrous", "+toggleNitrous", "-toggleNitrous", "")
    RegisterCommand("+toggleNitrous", startNitrous, false)
    RegisterCommand("-toggleNitrous", function() end, false)
end)
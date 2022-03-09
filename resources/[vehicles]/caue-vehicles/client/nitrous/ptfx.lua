function CreateVehicleExhaustBackfire(vehicle)
    local exhaustNames = {
        "exhaust",    "exhaust_2",  "exhaust_3",  "exhaust_4",  "exhaust_5",
        "exhaust_6",  "exhaust_7",  "exhaust_8",  "exhaust_9",  "exhaust_10",
        "exhaust_11", "exhaust_12", "exhaust_13", "exhaust_14", "exhaust_15",
        "exhaust_16", "exhaust_17", "exhaust_18", "exhaust_19", "exhaust_20",
        "exhaust_21", "exhaust_22", "exhaust_23", "exhaust_24", "exhaust_25",
        "exhaust_26", "exhaust_27", "exhaust_28", "exhaust_29", "exhaust_30",
    }

    local particleDict = "veh_xs_vehicle_mods"
    local particleFx = "veh_nitrous"
    local particles = {}

    for _, exhaustName in ipairs(exhaustNames) do
        local boneIndex = GetEntityBoneIndexByName(vehicle, exhaustName)

        if boneIndex ~= -1 then
            RequestNamedPtfxAsset(particleDict)
            while not HasNamedPtfxAssetLoaded(particleDict) do
                Citizen.Wait(0)
            end
            UseParticleFxAssetNextCall(particleDict)

            particles[#particles+1] = StartParticleFxLoopedOnEntityBone(particleFx, vehicle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, boneIndex, 1.0, false, false, false)
        end
    end

    return particles
end

function CreateVehiclePurgeSpray(vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale)
    UseParticleFxAssetNextCall("core")
    return StartParticleFxLoopedOnEntity("ent_sht_steam", vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, false, false, false)
end

function CreateVehicleLightTrail(vehicle, bone, scale)
    UseParticleFxAssetNextCall("core")
    local ptfx = StartParticleFxLoopedOnEntityBone("veh_light_red_trail", vehicle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, bone, scale, false, false, false)
    SetParticleFxLoopedEvolution(ptfx, "speed", 1.0, false)
    return ptfx
end

function StopVehicleLightTrail(ptfx, duration)
    Citizen.CreateThread(function()
        local startTime = GetGameTimer()
        local endTime = GetGameTimer() + duration

        while GetGameTimer() < endTime do
            Citizen.Wait(0)
            local now = GetGameTimer()
            local scale = (endTime - now) / duration
            SetParticleFxLoopedScale(ptfx, scale)
            SetParticleFxLoopedAlpha(ptfx, scale)
        end

        StopParticleFxLooped(ptfx)
    end)
end
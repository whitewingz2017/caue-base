local vehicles = {}
local particles = {}

function SetNitroBoostScreenEffectsEnabled(enabled)
    if enabled then
        StopScreenEffect("RaceTurbo")
        StartScreenEffect("RaceTurbo", 0, false)
        SetTimecycleModifier("rply_motionblur")
        ShakeGameplayCam("SKY_DIVING_SHAKE", 0.25)
    else
        StopGameplayCamShaking(true)
        SetTransitionTimecycleModifier("default", 0.35)
    end
end

function IsVehicleNitroBoostEnabled(vehicle)
    return vehicles[vehicle] == true
end

function SetVehicleNitroBoostEnabled(vehicle, enabled)
    if IsVehicleNitroBoostEnabled(vehicle) == enabled then
        return
    end

    if IsPedInVehicle(PlayerPedId(), vehicle) or not enabled then
        SetNitroBoostScreenEffectsEnabled(enabled)
    end

    if enabled then
        SetVehicleNitroEnabled(vehicle, true)
        particles[vehicle] = CreateVehicleExhaustBackfire(vehicle)
    else
        SetVehicleNitroEnabled(vehicle, false)

        if particles[vehicle] and #particles[vehicle] > 0 then
            for _, particleId in ipairs(particles[vehicle]) do
                RemoveParticleFx(particleId)
            end
        end

        particles[vehicle] = nil
    end

    SetVehicleBoostActive(vehicle, enabled)
    vehicles[vehicle] = enabled or nil
end
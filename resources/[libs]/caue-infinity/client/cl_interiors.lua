local IsInsideInterior, InteriorTick, IsInsideBuildInterior = false, 0, false

AddEventHandler("build:event:inside", function(pInside)
    IsInsideBuildInterior = pInside
end)

Citizen.CreateThread(function()
    while GetResourceState("caue-density") ~= "started" do
        Citizen.Wait(100)
    end

    exports["caue-density"]:RegisterDensityReason("interior", 3)

    while true do
        local idle = 3000

        local interiorId = GetInteriorFromEntity(PlayerPedId())
        local inInterior = IsInsideBuildInterior or interiorId ~= 0

        if inInterior and not IsInsideInterior and InteriorTick >= 2 then
            IsInsideInterior = true
            exports["caue-density"]:ChangeDensity("interior", 0.4)
            TriggerEvent("caue-voice:setQuietMode", "interior", true, 2)
            TriggerServerEvent("caue-infinity:interiors:enteredInterior", interiorId)
        elseif inInterior and not IsInsideInterior then
            InteriorTick = InteriorTick + 1
        elseif inInterior and IsInsideInterior and InteriorTick ~= 0 then
            InteriorTick = 2
        elseif not inInterior and IsInsideInterior and InteriorTick <= 1 then
            IsInsideInterior = false
            exports["caue-density"]:ChangeDensity("interior", -1)
            TriggerEvent("caue-voice:setQuietMode", "interior", false)
            TriggerServerEvent("caue-infinity:interiors:exitInterior", interiorId)
        elseif not inInterior and IsInsideInterior  then
            InteriorTick = InteriorTick - 1
        elseif not inInterior and not IsInsideInterior and InteriorTick ~= 0 then
            InteriorTick = 0
        end

        Citizen.Wait(idle)
    end
end)

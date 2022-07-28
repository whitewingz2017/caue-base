--[[

    Events

]]

AddEventHandler("caue-police:showVehicles", function(pArgs, pEntity, pContext)
    local data = {}
    local ownedVehicles = RPC.execute("caue-vehicles:ownedVehiclesModels")

    for _, vehicle in ipairs(pArgs["Vehicles"]) do
        if vehicle.first_free and not has_value(ownedVehicles, vehicle.model) then
            vehicle.price = 1
        end

        vehicle.job = pArgs["Job"]
        vehicle.spawn = pArgs["Spawn"]
        vehicle.garage = pArgs["Garage"]

        table.insert(data, {
            title = vehicle.name,
            description = "$" .. vehicle.price,
            image = vehicle.image,
            children = {
                { title = "Confirmar Compra", action = "caue-police:purchaseVehicle", params = vehicle },
            },
        })
    end

    exports["caue-context"]:showContext(data)
end)

AddEventHandler("caue-police:purchaseVehicle", function(params)
    if IsAnyVehicleNearPoint(params.spawn.x, params.spawn.y, params.spawn.z, 3.0) then
        TriggerEvent("DoLongHudText", "There is a vehicle interfering with the spawn location!", 2)
        return
    end

    TriggerServerEvent("caue-police:purchaseVehicle", params)
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    Citizen.Wait(1000)

    for i, v in ipairs(VehiclesConfig) do
        exports["caue-npcs"]:RegisterNPC(v["NPC"])

        local group = { "isPoliceVehicleSeller" }

        local data = {
            {
                id = "police_vehicles_" .. i,
                label = v["Label"],
                icon = "taxi",
                event = "caue-police:showVehicles",
                parameters = v,
            }
        }

        local options = {
            distance = { radius = 2.5 },
            isEnabled = function()
                return exports["caue-base"]:getChar("job") == v["Job"] and #(GetEntityCoords(PlayerPedId()) - v["Spawn"]["xyz"]) < 300.0
            end
        }

        exports["caue-eye"]:AddPeekEntryByFlag(group, data, options)

        local images = {}
        for _, vehicle in ipairs(v["Vehicles"]) do
            table.insert(images, vehicle.image)
        end

        TriggerEvent("caue-context:preLoadImages", images)
    end
end)
Citizen.CreateThread(function()

    Citizen.Wait(1000)

    exports["caue-npcs"]:RegisterNPC(Config["NPC"])

    local group = { "isBicycleShop" }

    local data = {
        {
            id = "bicycle_shop",
            label = "Bicycle Shop",
            icon = "bicycle",
            event = "caue-bicycles:showBicycles",
            parameters = {},
        }
    }

    local options = {
        distance = { radius = 2.5 }
    }

    exports["caue-eye"]:AddPeekEntryByFlag(group, data, options)

    local images = {}
    for _, vehicle in ipairs(Config["Vehicles"]) do
        table.insert(images, vehicle.image)
    end

    TriggerEvent("caue-context:preLoadImages", images)
end)
--[[

    Variables

]]

local listening = false

local Shops = {
    -- {
    --     text = "[E] Olhar para comida",
    --     action = function()
    --         TriggerEvent("server-inventory-open", "22", "Shop");
    --     end,

    --     center = vector3(1776.15, 2640.95, 45.59),
    --     radius = 3.0,

    --     isEnabled = function()
    --         return true
    --     end,
    -- },
}

--[[

    Functions

]]

local function listenForKeypress(shopId)
    listening = true

    Citizen.CreateThread(function()
        while listening do
            if IsControlJustReleased(0, 38) then
                listening = false
                exports["caue-interaction"]:hideInteraction()

                Shops[shopId].action()
            end

            Citizen.Wait(1)
        end
    end)
end

--[[

    Events

]]

AddEventHandler("caue-polyzone:enter", function(zone, data)
    if zone ~= "caue-inventory:shops" then return end

    local shopId = data.shopId

    if Shops[shopId].isEnabled() then
        exports["caue-interaction"]:showInteraction(Shops[shopId].text)
	    listenForKeypress(shopId)
    end
end)

AddEventHandler("caue-polyzone:exit", function(zone, data)
    if zone ~= "caue-inventory:shops" then return end

	exports["caue-interaction"]:hideInteraction()
    exports["caue-taskbar"]:taskCancel();
	listening = false
end)


--[[

    Threads

]]

Citizen.CreateThread(function()
	for shopId, shop in ipairs(Shops) do
        local options = {
            useZ = true,
            data = {
                shopId = shopId
            }
        }

        exports["caue-polyzone"]:AddCircleZone("caue-inventory:shops", shop.center, shop.radius, options)
    end
end)
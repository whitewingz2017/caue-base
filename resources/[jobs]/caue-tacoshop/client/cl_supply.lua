--[[

    Variables

]]

local rusticosotemideiasmerdasesseserverezap = 0
local deliveryBlip = 0

local deliveryLocations = {
	{ ["pos"] = vector4(26.21, -1338.9, 29.5, 159.69), ["name"] = "Innocence Boulevard Convenience Store" },
    { ["pos"] = vector4(-40.96, -1751.23, 29.43, 356.24), ["name"] = "Grove Street Convenience Store" },
    { ["pos"] = vector4(289.44, -1266.91, 29.45, 267.94), ["name"] = "Crusade Road Convenience Store" },
    { ["pos"] = vector4(1211.3, -1389.02, 35.38, 359.86), ["name"] = "El Burro Convenience Store" },
    { ["pos"] = vector4(1163.31, -314.24, 69.21, 14.01), ["name"] = "Mirror Park Convenience Store" },
    { ["pos"] = vector4(-531.54, -1221.2, 18.46, 163.39), ["name"] = "Little Seoul Convenience Store" },
    { ["pos"] = vector4(-820.59, -698.45, 28.07, 273.33), ["name"] = "Out That Ghetto Studios (Little Seoul)" },
}

--[[

    Events

]]

AddEventHandler("caue-tacoshop:supplyStation", function(pParameters)
    if pParameters.stationId == 1 then
        if rusticosotemideiasmerdasesseserverezap > 0 then return end
        rusticosotemideiasmerdasesseserverezap = 1

        TriggerEvent("player:receiveItem", "delivery_supply", rusticosotemideiasmerdasesseserverezap)
        TriggerEvent("caue-tacoshop:supplyStart")
    elseif pParameters.stationId == 2 then
        TriggerEvent("caue-tacoshop:supplyEnd")
    end
end)

AddEventHandler("caue-tacoshop:supplyStart", function()
	local location = deliveryLocations[math.random(#deliveryLocations)]

    CreateBlip(location)

    TriggerEvent("DoLongHudText", "Deliver this supply box at " .. location.name .. ", do not be late!!")

    while true do
		Citizen.Wait(1)

        local plyCoords = GetEntityCoords(PlayerPedId())
		local distance = #(plyCoords - location["pos"]["xyz"])

		if distance < 25.0 then
			ShowFloatingHelpNotification("~INPUT_FRONTEND_RB~ Delivery point", location["pos"]["xyz"])

			if IsControlJustReleased(0, 38) and distance < 2.0 then
				break
			end
		end

        if rusticosotemideiasmerdasesseserverezap == 0 then
            Citizen.Wait(1000)
            break
        end
	end

    DeleteBlip()

    local hasItem = exports["caue-inventory"]:hasEnoughOfItem("delivery_supply", 1, false, true)
    if hasItem then
        TriggerEvent("animation:PlayAnimation", "clipboard")

        Citizen.Wait(4000)

        TriggerEvent("animation:PlayAnimation", "c")

        TriggerEvent("inventory:removeItem", "delivery_supply", 1)
        TriggerServerEvent("caue-heists:complete", math.random(25, 50))

        rusticosotemideiasmerdasesseserverezap = rusticosotemideiasmerdasesseserverezap - 10

        if rusticosotemideiasmerdasesseserverezap > 0 then
            TriggerEvent("caue-tacoshop:supplyStart")
        else
            TriggerEvent("caue-tacoshop:supplyEnd")
        end
    elseif not hasItem and rusticosotemideiasmerdasesseserverezap > 0 then
        TriggerEvent("caue-tacoshop:supplyEnd")
    end
end)

AddEventHandler("caue-tacoshop:supplyEnd", function()
    rusticosotemideiasmerdasesseserverezap = 0

    local deliveryItens = exports["caue-inventory"]:getQuantity("delivery_supply")
    if deliveryItens > 0 then
        TriggerEvent("inventory:removeItem", "delivery_supply", deliveryItens)
    end

    DeleteBlip()

    TriggerEvent("DoLongHudText", "Go back and get more supplies for the store")
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    exports["caue-eye"]:AddPeekEntryByFlag({ "isNPC" }, {{
        id = "tacoshop_supplyStart",
        label = "Start Replenishment",
        icon = "box",
        event = "caue-tacoshop:supplyStation",
        parameters = { stationId = 1 }
    }}, { distance = { radius = 2.5 }, npcIds = {"supply"}, isEnabled = function() return rusticosotemideiasmerdasesseserverezap == 0 end })

    exports["caue-eye"]:AddPeekEntryByFlag({ "isNPC" }, {{
        id = "tacoshop_supplyStop",
        label = "Cancel Replenishment",
        icon = "box",
        event = "caue-tacoshop:supplyStation",
        parameters = { stationId = 2 }
    }}, { distance = { radius = 2.5 }, npcIds = {"supply"}, isEnabled = function() return rusticosotemideiasmerdasesseserverezap > 0 end })
end)
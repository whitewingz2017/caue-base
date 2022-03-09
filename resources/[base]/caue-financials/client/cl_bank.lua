--[[

    Variables

]]

local listening = false
local isBankInterfaceOpen = false

--[[

    Functions

]]

function openBankInterface()
    exports["caue-interaction"]:hideInteraction()

    financialAnimation(false, true)

    Citizen.Wait(1400)

    isBankInterfaceOpen = true

    exports["caue-bank"]:openUI(false)
end

local function listenForKeypress()
    listening = true

    Citizen.CreateThread(function()
        while listening do
            if IsControlJustReleased(0, 38) and not isBankInterfaceOpen then
                openBankInterface()
            end
            Wait(0)
        end
    end)
end

--[[

    Events

]]

AddEventHandler("caue-polyzone:enter", function(zone)
    if zone ~= "bank_zone" then return end

    nearBank = true
    exports["caue-interaction"]:showInteraction("[E] Usar Banco")
    listenForKeypress()
end)

AddEventHandler("caue-polyzone:exit", function(zone)
    if zone ~= "bank_zone" then return end

    nearBank = false
    exports["caue-interaction"]:hideInteraction()
    listening = false
end)

AddEventHandler("caue-bank:closed", function()
    financialAnimation(isNearATM(), false)

    Wait(1400)

    isBankInterfaceOpen = false

    if nearBank then
        exports["caue-interaction"]:showInteraction("[E] Usar Banco")
        listenForKeypress()
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    exports["caue-polyzone"]:AddBoxZone("bank_zone", vector3(1175.8, 2706.82, 38.09), 2.95, 0.8, {
        heading=271,
        minZ=36.99,
        maxZ=40.59
    })
    exports["caue-polyzone"]:AddBoxZone("bank_zone", vector3(-2962.62, 482.18, 15.7), 2.95, 0.8, {
        heading=177,
        minZ=14.6,
        maxZ=18.2
    })
    exports["caue-polyzone"]:AddBoxZone("bank_zone", vector3(252.63, 221.23, 106.29), 2.95, 0.8, {
        heading=70,
        minZ=105.19,
        maxZ=108.79
    })
    exports["caue-polyzone"]:AddBoxZone("bank_zone", vector3(242.22, 224.99, 106.29), 2.95, 0.8, {
        heading=70,
        minZ=105.19,
        maxZ=108.79
    })
    exports["caue-polyzone"]:AddBoxZone("bank_zone", vector3(-1213.29, -331.08, 37.78), 2.95, 0.8, {
        heading=118,
        minZ=36.58,
        maxZ=40.18
    })
    exports["caue-polyzone"]:AddBoxZone("bank_zone", vector3(-351.63, -49.67, 49.04), 2.95, 0.8, {
        heading=71,
        minZ=47.99,
        maxZ=51.39
    })
    exports["caue-polyzone"]:AddBoxZone("bank_zone", vector3(313.58, -278.91, 53.92), 2.95, 0.8, {
        heading=70,
        minZ=52.87,
        maxZ=56.27
    })
    exports["caue-polyzone"]:AddBoxZone("bank_zone", vector3(149.22, -1040.5, 29.37), 2.95, 0.8, {
        heading=70,
        minZ=28.32,
        maxZ=31.72
    })
end)
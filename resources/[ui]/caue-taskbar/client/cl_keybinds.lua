--[[

    Variables

]]

insidePrompt = false
focusTaken = false
inventoryDisabled = false

--[[

    Functions

]]

local function hasVPN()
    return exports["caue-inventory"]:hasEnoughOfItem("vpnxj", 1, false)
end

function LoadAnimationDic(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)

        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
    end
end

function generalInventory()
    if not insidePrompt and not inventoryDisabled and not focusTaken then
        TriggerEvent("inventory-open-request")
    end
end

function generalEscapeMenu()
    if guiEnabled and not focusTaken then
        currentTask = 2
        closeGui()
    end
end

--[[

    Exports

]]

exports("taskbarDisableInventory", function(pState)
    inventoryDisabled = pState
end)

--[[

    Events

]]

RegisterNetEvent("hud:insidePrompt")
AddEventHandler("hud:insidePrompt", function(bool)
    insidePrompt = bool
end)

AddEventHandler("caue-voice:focus:set", function(pState)
    focusTaken = pState
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    exports["caue-keybinds"]:registerKeyMapping("", "Inventory", "Open", "+generalInventory", "-generalInventory", "K")
    RegisterCommand("+generalInventory", generalInventory, false)
    RegisterCommand("-generalInventory", function() end, false)

    exports["caue-keybinds"]:registerKeyMapping("", "Player", "Escape menu", "+generalEscapeMenu", "-generalEscapeMenu", "ESCAPE")
    RegisterCommand("+generalEscapeMenu", generalEscapeMenu, false)
    RegisterCommand("-generalEscapeMenu", function() end, false)
end)
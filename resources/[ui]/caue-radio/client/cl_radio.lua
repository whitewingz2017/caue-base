--[[

    Variables

]]

local isRadioOpen = false

--[[

    Functions

]]

function toggleRadioAnimation(pState)
    local isInTrunk = exports["caue-base"]:getVar("trunk")
    local isDead = exports["caue-base"]:getVar("dead")

    if isInTrunk or isDead then return end

    LoadAnimationDic("cellphone@")

    if pState then
        TriggerEvent("attachItemRadio","radio01")
        TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
    else
        StopAnimTask(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 1.0)
        TriggerEvent("destroyPropRadio")
    end
end

function LoadAnimationDic(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)

        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
    end
end

function hasRadio()
    return exports["caue-inventory"]:hasEnoughOfItem("radio", 1, false) or exports["caue-inventory"]:hasEnoughOfItem("civradio", 1, false)
end

function formattedChannelNumber(number)
    local power = 10 ^ 1
    return math.floor(number * power) / power
end

function handleConnectionEvent(pChannel)
    local newChannel = formattedChannelNumber(pChannel)

    if type(newChannel) ~= "number" then return end

    local result = exports["caue-voice"]:SetRadioFrequency(newChannel)

    return result
end

function openRadio()
    local currentJob = exports["caue-base"]:getChar("job")

    if exports["caue-base"]:getVar("call") then
        TriggerEvent("DoShortHudText", "Você não pode fazer isso enquanto esta em uma chamada!", 2)
        return
    end

    if not hasRadio() then
        TriggerEvent("DoShortHudText", "Você precisa de um rádio.", 2)
        toggleRadioAnimation(false)
        return
    end

    if not isRadioOpen then
        SetNuiFocus(true, true)
        SendNUIMessage({
            open = true,
            emergency = exports["caue-jobs"]:getJob(currentJob, "is_emergency"),
        })

        toggleRadioAnimation(true)
    else
        SetNuiFocus(false, false)
        SendNUIMessage({
            close = true,
            emergency = exports["caue-jobs"]:getJob(currentJob, "is_emergency"),
        })

        toggleRadioAnimation(false)
    end

    isRadioOpen = not isRadioOpen
end

--[[

    Events

]]

RegisterNetEvent("caue-radio:setChannel", function(params)
    handleConnectionEvent(params[1])

    SendNUIMessage({
        setChannel = params[1],
    })
end)

RegisterNetEvent("ChannelSet", function(chan)
    SendNUIMessage({
        setChannel = chan,
    })
end)

RegisterNetEvent("caue-radio:updateRadioState", function (frequency, powered)
    SendNUIMessage({
        setChannel = frequency,
        setState = powered,
    })
end)

AddEventHandler("caue-inventory:itemUsed", function(item)
    if item ~= "radio" and item ~= "civradio" then return end

    openRadio()
end)

AddEventHandler("caue-inventory:itemCheck", function (item, state, quantity)
    if item ~= "civradio" and item ~= "radio" then return end
    if state or quantity > 0 then return end

    exports["caue-voice"]:SetRadioPowerState(false)

    SendNUIMessage({
        setChannel = 0,
        setState = false,
    })

    TriggerEvent("DoLongHudText", "Você foi desconectado do rádio.")
end)

--[[

    NUI

]]

RegisterNUICallback("poweredOn", function(data, cb)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    exports["caue-voice"]:SetRadioPowerState(true)
end)

RegisterNUICallback("poweredOff", function(data, cb)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    exports["caue-voice"]:SetRadioPowerState(false)
end)

RegisterNUICallback("setRadioChannel", function(data, cb)
    TriggerEvent("InteractSound_CL:PlayOnOne", "radioclick", 0.6)
    local success = handleConnectionEvent(data.channel)
    cb(success)
end)

RegisterNUICallback("volumeUp", function(data, cb)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    exports["caue-voice"]:IncreaseRadioVolume()
end)

RegisterNUICallback("volumeDown", function(data, cb)
    PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    exports["caue-voice"]:DecreaseRadioVolume()
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({
        close = true,
    })

    isRadioOpen = false

    toggleRadioAnimation(false)
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    exports["caue-keybinds"]:registerKeyMapping("", "Radio", "Open", "+handheld", "-handheld", ";")
    RegisterCommand("+handheld", openRadio, false)
    RegisterCommand("-handheld", function() end, false)
end)
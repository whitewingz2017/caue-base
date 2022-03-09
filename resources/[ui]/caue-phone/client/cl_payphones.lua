--[[

    Variables

]]

PayphoneCall = false
PayphonePos = GetEntityCoords(PlayerPedId())

local payphoneModels = {
    `p_phonebox_02_s`,
    `prop_phonebox_03`,
    `prop_phonebox_02`,
    `prop_phonebox_04`,
    `prop_phonebox_01c`,
    `prop_phonebox_01a`,
    `prop_phonebox_01b`,
    `p_phonebox_01b_s`,
}

--[[

    Events

]]

AddEventHandler("caue-phone:startPayPhoneCall", function()
    local input = exports["caue-input"]:showInput({
        {
            icon = "phone-volume",
            label = "Phone Number",
            name = "number",
        },
    })

    if input["number"] then
        local number = tonumber(input["number"])
        if not number or number < 4150000000 or number > 6290000000 then
            TriggerEvent("DoLongHudText", "Not a valid number", 2)
            return
        end

        PayphoneCall = true
        PayphonePos = GetEntityCoords(PlayerPedId())

        TriggerServerEvent("caue-phone:callStart", "Unknown Number", number)
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    exports["caue-eye"]:AddPeekEntryByModel(payphoneModels, {{
        event = "caue-phone:startPayPhoneCall",
        id = "startPayPhoneCall",
        icon = "phone-volume",
        label = "Make Call",
        parameters = {},
    }}, { distance = { radius = 1.5 } })
end)
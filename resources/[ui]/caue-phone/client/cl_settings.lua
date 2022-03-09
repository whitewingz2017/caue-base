--[[

    Variables

]]









--[[

    NUI

]]

RegisterNUICallback("settings", function()
	local settings = exports["storage"]:tryGet("table", "caue-voice-settings")

	SendNUIMessage({
		openSection = "settings",
		currentSettings = settings,
	})
end)

RegisterNUICallback("settingsUpdate", function(data, cb)
    local type = data.type

    if type == "voip" then
        exports["storage"]:set(data.settings, "caue-voice-settings")
    end

    phoneNotification("fas fa-cog", "Settings", "Updated!")
end)
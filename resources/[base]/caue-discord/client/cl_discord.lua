Citizen.CreateThread(function()
	while true do
		SetDiscordAppId(1002084359500738690)

        local first_name = exports["caue-base"]:getChar("first_name")
        local last_name = exports["caue-base"]:getChar("last_name")

        if first_name then
            SetRichPresence("Jogando com " .. first_name .. " " .. last_name)
        end

        SetDiscordRichPresenceAsset("asset")
        SetDiscordRichPresenceAssetText("https://cauedev.github.io/")
        SetDiscordRichPresenceAssetSmall("asset")
        SetDiscordRichPresenceAssetSmallText("https://cauedev.github.io/")
        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/discord")
        SetDiscordRichPresenceAction(1, "Forum", "https://cauedev.github.io/")

		Citizen.Wait(60000)
	end
end)
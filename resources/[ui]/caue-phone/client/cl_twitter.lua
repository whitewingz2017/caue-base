--[[

    Variables

]]

local TwitterPopups = true

--[[

    Functions

]]

local function loadTwitter()
    local name = "@" .. exports["caue-base"]:getChar("first_name") .. "_" .. exports["caue-base"]:getChar("last_name")
    local twitter = RPC.execute("caue-phone:getTwitter")

    SendNUIMessage({
		openSection = "twatter",
		twats = twitter,
		name = name,
	})
end

--[[

    Events

]]

RegisterNetEvent("caue-phone:updateTwitter")
AddEventHandler("caue-phone:updateTwitter", function(message)
    if not hasPhone() then return end

    local name = "@" .. exports["caue-base"]:getChar("first_name") .. "_" .. exports["caue-base"]:getChar("last_name")

    if string.find(message["message"], name) then
      	if message["name"] ~= name then
        	SendNUIMessage({
                openSection = "newtweet"
            })
      	end

      	if phoneNotifications then
        	PlaySound(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0, 0, 1)
        	TriggerEvent("DoLongHudText", "Você acabou de ser mencionado em um tweet no seu celular")
      	end
    end

    phoneNotification("fab fa-twitter", message["name"], message["message"], 5000)
end)

--[[

    NUI

]]

RegisterNUICallback("btnTwatter", function()
    loadTwitter()
end)

RegisterNUICallback("newTwatSubmit", function(data, cb)
	local message = data["twat"]
    local image = data["image"]
    local time = data["time"]

    if not message or not time then return end

    local name = "@" .. exports["caue-base"]:getChar("first_name") .. "_" .. exports["caue-base"]:getChar("last_name")

    local update = RPC.execute("caue-phone:addTwitter", name, message, image, time)
    if update then
        loadTwitter()
    end
end)

RegisterNUICallback("btnNotifyToggle", function(data, cb)
    TwitterPopups = not TwitterPopups

    if TwitterPopups then
        TriggerEvent("DoLongHudText", "Pop-ups Ativados")
    else
        TriggerEvent("DoLongHudText", "Pop-ups Desativados")
    end
end)
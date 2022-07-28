function IsBanned(hex)
	local ban = MySQL.single.await([[
		SELECT *
		FROM users_bans
		WHERE hex = ?
	]],
	{ hex })

	if not ban then return false end

	return true, ban["time"], ban["reason"]
end

Queue.OnReady(function()

Queue.OnJoin(function(source, allow)
	local ids = GetIds(source)

	if not ids then
		allow("\xE2\x9D\x97[Fila] Erro: Couldn't find any of your IDs, try restarting FiveM.")
		return
	end

	if not ids["hex"] then
		allow("\xE2\x9D\x97[Fila] Erro: Could not find your HEX, try restarting FiveM.")
		return
	end

	local priority = MySQL.scalar.await([[
		SELECT priority
		FROM whitelist
		WHERE hex = ?
	]],
	{ ids["hex"] })

	local whitelist, message = exports["caue-discord"]:haveWhitelist(source)

	if whitelist then
		local banned, ban_time, ban_reason = IsBanned(ids["hex"])

		if banned then
			local time = os.time()

			if ban_time == 0 then
				allow("You are permanently banned | Reason: "..user.banreason)
				return
			elseif ban_time > time then
				allow("You are banned | Reason: " .. ban_reason .. " | Ends: " .. os.date("%d/%m/%Y - %X", ban_time))
				return
			elseif ban_time < time then
				MySQL.update([[
					DELETE FROM users_bans
					WHERE hex = ?
				]],
				{ ids["hex"] })
			end
		end

		if priority and priority > 0 and (not Queue.Exports:IsPriority({ids["hex"]})) then
			Queue.AddPriority(ids["hex"], priority)
		end

		Wait(1500)

		allow()
	else
		if message == "devserver" then
			allow("\xE2\x9D\x97[Fila] This server is only for your development 🐒, enter the right server")
		elseif message == "discord id not found" then
			allow("\xE2\x9D\x97[Fila] Erro: Could not find your Discord ID, try restarting the FiveM.")
		elseif message == "user data not found" then
			allow("\xE2\x9D\x97[Fila] Erro: Your username could not be found on the discord server. You are on discord?")
		elseif message == "user roles not found" then
			allow("\xE2\x9D\x97[Fila] Erro: Your tags could not be found on the discord server. You are on discord?")
		else
			allow("\xE2\x9D\x97[Fila] You must be on the whitelist to join this server")
		end
	end
end)

end)

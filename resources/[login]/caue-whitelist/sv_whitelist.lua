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
		allow("\xE2\x9D\x97[Fila] Erro: Não foi possível encontrar nenhum dos seus IDs, tente reiniciar o FiveM.")
		return
	end

	if not ids["hex"] then
		allow("\xE2\x9D\x97[Fila] Erro: Não foi possível encontrar seu HEX, tente reiniciar o FiveM.")
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
				allow("Você está banido permanentemente | Motivo: "..user.banreason)
				return
			elseif ban_time > time then
				allow("Você está banido | Motivo: " .. ban_reason .. " | Termina: " .. os.date("%d/%m/%Y - %X", ban_time))
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
			allow("\xE2\x9D\x97[Fila] Esse servidor e so pra desenvolvimento seu 🐒, entra no servidor certo ae")
		elseif message == "discord id not found" then
			allow("\xE2\x9D\x97[Fila] Erro: Não foi possível encontrar seu Discord ID, tente reiniciar o FiveM.")
		elseif message == "user data not found" then
			allow("\xE2\x9D\x97[Fila] Erro: Não foi possível encontrar seu usuario no servidor do discord. Você esta no discord?")
		elseif message == "user roles not found" then
			allow("\xE2\x9D\x97[Fila] Erro: Não foi possível encontrar suas tags no servidor do discord. Você esta no discord?")
		else
			allow("\xE2\x9D\x97[Fila] Você deve estar na whitelist para entrar neste servidor")
		end
	end
end)

end)

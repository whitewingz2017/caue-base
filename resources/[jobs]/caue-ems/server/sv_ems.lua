RegisterNetEvent("ems:healplayer")
AddEventHandler("ems:healplayer", function(target)
    local src = source

    TriggerClientEvent("DoLongHudText", src, "Curando o Player")
	TriggerClientEvent("DoLongHudText", target, "Você esta começando a se sentir melhor!")

    TriggerClientEvent("ems:healpassed", target)
end)
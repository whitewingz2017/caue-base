RegisterNetEvent("caue-death:illegal_revive")
AddEventHandler("caue-death:illegal_revive", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
    local npcCoords = GetEntityCoords(pEntity)
    local finished = exports["caue-taskbar"]:taskBar(10000, "Efetuando Tratamento Clandestino")
    if finished == 100 then
        if #(GetEntityCoords(PlayerPedId()) - npcCoords) < 2.0 then
            local complete = RPC.execute("caue-death:illegal", 200)
            if complete then
                TriggerEvent("reviveFunction")
            end
        else
            TriggerEvent("DoLongHudText", "Você esta muito longe, idiota!", 2)
        end
    end
end)

RegisterNetEvent("caue-death:illegal_heal")
AddEventHandler("caue-death:illegal_heal", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
    loadAnimDict("random@crash_rescue@help_victim_up")
    TaskPlayAnim(PlayerPedId(), "random@crash_rescue@help_victim_up", "helping_victim_to_feet_victim", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    local npcCoords = GetEntityCoords(pEntity)
    local finished = exports["caue-taskbar"]:taskBar(10000, "Passando alguns curativos")
    TriggerEvent("animation:PlayAnimation", "c")
    if finished == 100 then
        if #(GetEntityCoords(PlayerPedId()) - npcCoords) < 2.0 then
            local complete = RPC.execute("caue-death:illegal", 150)
            if complete then
                SetEntityMaxHealth(PlayerPedId(), 200)
                SetEntityHealth(PlayerPedId(), 200)
            end
        else
            TriggerEvent("DoLongHudText", "Você esta muito longe, idiota!", 2)
        end
    end
end)
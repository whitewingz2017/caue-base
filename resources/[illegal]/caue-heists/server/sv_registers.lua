--[[

    Variables

]]

local registers = {}
local registerCooldown = 60000 * 15
local players = {}
local playerCooldown = 60000 * 30

--[[

    RPCs

]]

RPC.register("caue-heists:canRobRegister", function(src, pRegisterId)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then
        return "No cid found"
    end

    if players[cid] and players[cid] > GetGameTimer() then
        return "Você não pode cometer esse mesmo crime tão rápido, espere a poeira baixar."
    end

    if registers[pRegisterId] and registers[pRegisterId] > GetGameTimer() then
        return "Não tem nada aqui, alguém já robou esse caixa."
    end

    registers[pRegisterId] = GetGameTimer() + registerCooldown
    players[cid] = GetGameTimer() + playerCooldown

    return
end)
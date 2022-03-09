RPC.register("caue-debug:getInfosServer", function(src, pTarget)
    local data = {}

    if GetPlayerPing(pTarget) > 0 then
        data = RPC.execute(pTarget, "caue-debug:getInfosClient")
    end

	return data
end)
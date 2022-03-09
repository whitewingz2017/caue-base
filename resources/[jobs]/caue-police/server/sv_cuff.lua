RegisterServerEvent("caue-police:cuff")
AddEventHandler("caue-police:cuff", function(pTarget)
	local src = source

    TriggerClientEvent("caue-police:getArrested", pTarget, src)
	TriggerClientEvent("caue-police:cuffTransition", src)
end)

RegisterServerEvent("caue-police:uncuff")
AddEventHandler("caue-police:uncuff", function(pTarget)
	TriggerClientEvent("caue-police:uncuff", pTarget)
end)

RegisterServerEvent("caue-police:softcuff")
AddEventHandler("caue-police:softcuff", function(pTarget)
    TriggerClientEvent("caue-police:handCuffedWalking", pTarget)
end)

RPC.register("isPedCuffed", function(src, pTarget)
	local isCuffed = RPC.execute(pTarget, "isPlyCuffed")
	return isCuffed
end)
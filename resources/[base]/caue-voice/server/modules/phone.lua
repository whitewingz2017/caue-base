function startCall(phoneNumber, callerID, receiverID)
    TriggerClientEvent("caue:voice:phone:call:start", callerID, receiverID, phoneNumber)
    TriggerClientEvent("caue:voice:phone:call:start", receiverID, callerID, phoneNumber)
end

function endCall(phoneNumber, callerID, receiverID)
    TriggerClientEvent("caue:voice:phone:call:end", callerID, receiverID, phoneNumber)
    TriggerClientEvent("caue:voice:phone:call:end", receiverID, callerID, phoneNumber)
end

RegisterServerEvent("caue:voice:server:phone:startCall")
AddEventHandler("caue:voice:server:phone:startCall", startCall)

RegisterServerEvent("caue:voice:server:phone:endCall")
AddEventHandler("caue:voice:server:phone:endCall", endCall)
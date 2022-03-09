AddEventHandler("caue-signin:peekAction", function(pArgs, pEntity, pContext)
    local data = pContext.zones and pContext.zones["job_sign_in"]

    if not data then return end

    exports["caue-context"]:showContext(MenuData[data.job])
end)

AddEventHandler("caue-signin:handler", function(params)
    if params.sign_in then
        TriggerServerEvent("caue-signin:duty", params.job)
    elseif params.sign_off then
        TriggerServerEvent("caue-jobs:changeJob", "unemployed")
    end
end)
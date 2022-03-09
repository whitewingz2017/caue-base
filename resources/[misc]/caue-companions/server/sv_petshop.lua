RegisterNetEvent("caue-pets:purchasePet")
AddEventHandler("caue-pets:purchasePet", function(params, name)
    local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local cash = exports["caue-financials"]:getCash(src)

    if params.price > cash then
        TriggerClientEvent("DoLongHudText", src, "Você não tem $" .. params.price .. " com você", 2)
        return
    end

    if params.type == "k9" then
        TriggerClientEvent("caue-pets:k9create", src, cid, params.model, params.deparment, name, math.random(0, params.variants))
    else
        TriggerClientEvent("caue-pets:petCreate", src, cid, params.model, name, math.random(0, params.variants))
    end
end)
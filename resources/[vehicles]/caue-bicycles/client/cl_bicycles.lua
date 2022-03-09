--[[

    Events

]]

AddEventHandler("caue-bicycles:showBicycles", function()
    local data = {}

    for _, bike in ipairs(Config["Vehicles"]) do
        local tax = RPC.execute("caue-financials:priceWithTax", bike.price, "Vehicles")

        bike["tax"] = tax.tax
        bike["price"] = tax.total

        table.insert(data, {
            title = bike.name,
            description = "$" .. tax.total .. " Incl. " .. tax.porcentage .. "% tax",
            image = bike.image,
            children = {
                { title = "Confirmar Compra", action = "caue-bicycles:buyBicycle", params = bike },
            },
        })
    end

    exports["caue-context"]:showContext(data)
end)

AddEventHandler("caue-bicycles:buyBicycle", function(params)
    if IsAnyVehicleNearPoint(Config["Spawn"]["x"], Config["Spawn"]["y"], Config["Spawn"]["z"], 3.0) then
        TriggerEvent("DoLongHudText", "Veiculo a caminho", 2)
        return
    end

    TriggerServerEvent("caue-bicycles:buyBicycle", params)
end)
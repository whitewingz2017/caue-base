--[[

    Variables

]]

Config = {
    SellNpcItems = {
        ["joint"] = {
            minprice = 20,
            maxprice = 40,
            minamount = 1,
            maxamount = 3
        },
        ["1gcocaine"] = {
            minprice = 40,
            maxprice = 70,
            minamount = 1,
            maxamount = 3
        },
        ["1gmeta"] = {
            minprice = 25,
            maxprice = 55,
            minamount = 1,
            maxamount = 3
        },
        ["lean"] = {
            minprice = 22,
            maxprice = 48,
            minamount = 1,
            maxamount = 3
        },
    }
}

--[[

    Events

]]

RegisterServerEvent("caue-drugs:offer")
AddEventHandler("caue-drugs:offer", function(ped)
	local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local itemId = false

    local inventory = exports["caue-inventory"]:getInventory("ply-" .. cid)
    for i, v in ipairs(inventory) do
        if Config.SellNpcItems[v.item_id] then
            itemId = v.item_id
            break
        end
    end

    if itemId then
        local MinAmount = Config.SellNpcItems[itemId].minamount
		local MaxAmount = Config.SellNpcItems[itemId].maxamount
		local PriceMin = Config.SellNpcItems[itemId].minprice
		local PriceMax = Config.SellNpcItems[itemId].maxprice
		local Amount = math.random(MinAmount, MaxAmount)
		local Price = math.random(PriceMin, PriceMax) * Amount

        local Label = exports["caue-inventory"]:getItem(itemId, "displayname")

        TriggerClientEvent("caue-drugs:c_startoffers", src, ped, itemId, Price, Label, Amount)
    else
        TriggerClientEvent("caue-drugs:canceloffers", src, ped)
		TriggerClientEvent("DoLongHudText", src, "Você não tem drogas para vender", 2)
    end
end)

RegisterServerEvent("caue-drugs:selling")
AddEventHandler("caue-drugs:selling", function(item, price, amount, ped)
	local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local hasAmount = false

    local inventory = exports["caue-inventory"]:getInventory("ply-" .. cid)
    for i, v in ipairs(inventory) do
        if item == v.item_id then
            if amount <= v.amount then
                hasAmount = true
            end

            break
        end
    end

	if hasAmount then
        local Label = exports["caue-inventory"]:getItem(item, "displayname")

        TriggerClientEvent("inventory:removeItem", src, item, amount)
		exports["caue-financials"]:updateCash(src, "+", price)
		TriggerClientEvent("caue-drugs:client:sell", src, ped)
		TriggerClientEvent("DoLongHudText", src, "You sold it "  .. amount .." " .. Label.. " for $ ".. price)
        TriggerClientEvent("evidence:drugs", src, Label)
	else
		TriggerClientEvent("caue-drugs:canceloffers", src, ped)
		TriggerClientEvent("DoLongHudText", src, "You don't have enough")
	end
end)

RegisterServerEvent("caue-drugs:robgive")
AddEventHandler("caue-drugs:robgive", function(item, amount)
	local src = source

    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return end

    local hasAmount = false

    local inventory = exports["caue-inventory"]:getInventory("ply-" .. cid)
    for i, v in ipairs(inventory) do
        if item == v.item_id then
            if amount <= v.amount then
                hasAmount = true
            end

            break
        end
    end

	if hasAmount then
        TriggerClientEvent("inventory:removeItem", src, item, amount)
	else
		TriggerClientEvent("caue-drugs:canceloffers", src, ped)
		TriggerClientEvent("DoLongHudText", src, "You don't have enough")
	end
end)
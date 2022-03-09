--[[

    Variables

]]

listening = false
currentVehicle = nil
local spawnedvehicles = {}

--[[

    Functions

]]

local function despawnVehicles()
	for i, v in ipairs(spawnedvehicles) do
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(v))
	end
end

local function spawnVehicles(shop)
	despawnVehicles()

	local _spawns = RPC.execute("caue-carshop:getDisplay", shop)

	for i, v in ipairs(_spawns) do
		local model = GetHashKey(v["model"])

        RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model, v["pos"]["x"], v["pos"]["y"], v["pos"]["z"] - 1.0, v["pos"]["w"], false, false)

		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)
		SetEntityInvincible(veh, true)
		FreezeEntityPosition(veh, true)
		SetVehicleNumberPlateText(veh, i .. string.upper(shop))
		SetVehicleDoorsLocked(veh, 3)

        table.insert(spawnedvehicles, veh)

		exports["caue-flags"]:SetVehicleFlag(veh, "isCarShopVehicle", true)
	end
end

local function listenForKeypress()
    listening = true

    Citizen.CreateThread(function()
        while listening do
            if IsControlJustReleased(0, 38) and not inTheShop then
				OpenCarShop(exports["caue-base"]:getVar("carshop"), false)
            end
            Wait(0)
        end
    end)
end

local function getCurrentVehicle(pEntity, pShop)
	local vehiclePos = GetEntityCoords(pEntity)

	local index = false
	for i, v in ipairs(Config[pShop]["Spawns"]) do
		if #(vehiclePos - v["pos"]["xyz"]) < 1.0 then
			index = i
			break
		end
	end

	currentVehicle = index
end

function getTestDriveLocation(shop)
	return Config[shop]["TestDrive"]
end

--[[

	Exports

]]

exports("getTestDriveLocation", getTestDriveLocation)

--[[

    Events

]]

AddEventHandler("caue-polyzone:enter", function(name)
	if not Config["Zones"][name] then return end

	if string.find(name, "catalog") then
		exports["caue-interaction"]:showInteraction("[E] Showroom")
		listenForKeypress()
	else
		exports["caue-base"]:setVar("carshop", name)
		spawnVehicles(name)
	end
end)

AddEventHandler("caue-polyzone:exit", function(name)
	if not Config["Zones"][name] then return end

	if string.find(name, "catalog") then
		exports["caue-interaction"]:hideInteraction()
		listening = false
	else
		exports["caue-base"]:setVar("carshop", nil)
		despawnVehicles()
	end
end)

AddEventHandler("caue-carshop:check", function(pParams, pEntity, pContext)
    local shop = exports["caue-base"]:getVar("carshop")
	if not shop then return end

	getCurrentVehicle(pEntity, shop)
	if not currentVehicle then return end

	local info = RPC.execute("caue-carshop:getInformations", shop, currentVehicle)
	if not info then return end

	local baseprice = info.price
	local commissionprice = math.floor(baseprice * info.commission / 100)
	local tax = RPC.execute("caue-financials:priceWithTax", baseprice, "Vehicles")

	local finalprice = math.floor(baseprice + commissionprice + tax.tax)

	local infos = {
		{ title = "Veiculo", description = GetLabelText(GetDisplayNameFromVehicleModel(info.model)) },
		{ title = "Tier", description = exports["caue-vehicles"]:GetVehicleTier(pEntity) },
		{ title = "Preço", description = "$" .. tax.total .. " Incl. " .. tax.porcentage .. "% tax" },
		{ title = "Estoque", description = info.stock },
	}

	if exports["caue-groups"]:GroupRank(shop) > 0 then
		table.insert(infos, { title = "INFORMAÇÕES:", description = ""})
		table.insert(infos, { title = "Comissão", description = "%" .. info.commission} )
		table.insert(infos, { title = "Preço Base", description = "$" .. baseprice} )
		table.insert(infos, { title = "Preço de Comissão", description = "$" .. commissionprice} )
		table.insert(infos, { title = "Taxas", description = "$" .. tax.tax} )
	end

	local data = {}

    for i, v in ipairs(infos) do
		table.insert(data, {
            title = v.title,
            description = v.description,
        })
    end

    exports["caue-context"]:showContext(data)
end)

AddEventHandler("caue-carshop:change", function(pParams, pEntity, pContext)
	local shop = exports["caue-base"]:getVar("carshop")
	if not shop then return end

	getCurrentVehicle(pEntity, shop)
	if not currentVehicle then return end

	OpenCarShop(shop, true)
end)

RegisterNetEvent("caue-carshop:updateDisplay")
AddEventHandler("caue-carshop:updateDisplay", function(shop)
	if exports["caue-base"]:getVar("carshop") and exports["caue-base"]:getVar("carshop") == shop then
		spawnVehicles(shop)
	end
end)

AddEventHandler("caue-carshop:commission", function(pParams, pEntity, pContext)
	local shop = exports["caue-base"]:getVar("carshop")
	if not shop then return end

	getCurrentVehicle(pEntity, shop)
	if not currentVehicle then return end

	local input = exports["caue-input"]:showInput({
		{
            icon = "percentage",
            label = "Commission",
            name = "commission",
        },
	})

	if input["commission"] then
		local comission = tonumber(input["commission"])
		if not comission then
			TriggerEvent("DoLongHudText", "Comissão precisa ser de 1-30", 2)
			return
		end

		if comission < 1 or comission > 30 then
			TriggerEvent("DoLongHudText", "Comissão precisa ser de 1-30", 2)
			return
		end

		TriggerServerEvent("caue-carshop:commission", shop, currentVehicle, comission)
	end
end)

AddEventHandler("caue-carshop:testdrive", function(pParams, pEntity, pContext)
	local shop = exports["caue-base"]:getVar("carshop")
	if not shop then return end

	getCurrentVehicle(pEntity, shop)
	if not currentVehicle then return end

	local model = pContext.model
	local pos = getTestDriveLocation(shop)

	local vehicle = exports["caue-vehicles"]:spawnVehicle(model, pos, false, "TD" .. shop, 100, false, false, false, false, false, true)

	exports["caue-flags"]:SetVehicleFlag(vehicle, "isTestDriveVehicle", true)
end)

AddEventHandler("caue-carshop:testdriveReturn", function(pParams, pEntity, pContext)
	Sync.DeleteVehicle(pEntity)
    Sync.DeleteEntity(pEntity)
end)

AddEventHandler("caue-carshop:sell", function(pParams, pEntity, pContext)
	local shop = exports["caue-base"]:getVar("carshop")
	if not shop then return end

	getCurrentVehicle(pEntity, shop)
	if not currentVehicle then return end

	local plate = exports["caue-vehicles"]:GetVehiclePlate(pEntity)

	TriggerServerEvent("caue-carshop:sell", plate, shop, currentVehicle)
end)

AddEventHandler("caue-carshop:buy", function(pParams, pEntity, pContext)
	local shop = exports["caue-base"]:getVar("carshop")
	if not shop then return end

	getCurrentVehicle(pEntity, shop)
	if not currentVehicle then return end

	local info = RPC.execute("caue-carshop:getInformations", shop, currentVehicle)
	if not info then return end

	local baseprice = info.price
	local commissionprice = math.floor(baseprice * info.commission / 100)
	local tax = RPC.execute("caue-financials:priceWithTax", baseprice, "Vehicles")
	local financing = math.floor(baseprice / 10)
	local finalprice = math.floor(baseprice + commissionprice + tax.tax)
	local downpayment = math.floor(commissionprice + tax.tax + financing)

	local vehicle = GetLabelText(GetDisplayNameFromVehicleModel(info.model))
	if vehicle == "NULL" then vehicle = GetDisplayNameFromVehicleModel(info.model) end

	local groupname = exports["caue-groups"]:GroupName(shop)

	local document = {
        headerTitle = "Compra de Veiculo",
        headerSubtitle = "Contrato de financiamento de Veiculo.",
        elements = {
            { label = "VENDEDOR", type = "input", value = info.seller.name, can_be_emtpy = false, can_be_edited = false },
			{ label = "SHOP", type = "input", value = groupname, can_be_emtpy = false, can_be_edited = false },
			{ label = "VEICULO", type = "input", value = vehicle, can_be_emtpy = false, can_be_edited = false },
			{ label = "PREÇO TOTAL", type = "input", value = "$" .. finalprice, can_be_emtpy = false, can_be_edited = false },
			{ label = "PAGAMENTO INICIAL", type = "input", value = "$" .. downpayment .. " Incl. " .. tax.porcentage .. "% tax", can_be_emtpy = false, can_be_edited = false },
			{ label = "FINANCIAMENTO", type = "input", value = "10x $" .. financing, can_be_emtpy = false, can_be_edited = false },
			{ label = "TERMOS", type = "textarea", value = "Ao assinar isso, você deve estar seguro que caso você não pague " .. groupname .. " irá confiscar o seu veiculo.", can_be_emtpy = false, can_be_edited = false },
        },
		group = "pdm",
		callback = {
			event = "caue-carshop:buycallback",
			params = {
				shop = shop,
				model = info.model,
				name = vehicle,
				seller = info.seller.sid,
				sellername = info.seller.name,
				downpayment = downpayment,
				commission = commissionprice,
				finalprice = finalprice,
				tax = tax.tax,
				financing = financing,
				buyer = exports["caue-base"]:getChar("first_name") .. " " .. exports["caue-base"]:getChar("last_name")
			},
		},
    }

	TriggerEvent("caue-documents:CreateNewForm", document)
end)

AddEventHandler("caue-carshop:buycallback", function(pParams)
	TriggerServerEvent("caue-carshop:buy", pParams)
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    Citizen.Wait(1000)

	for k, v in pairs(Config) do
		if k ~= "Vehicles" and k ~= "Zones" then
			v["Init"]()

			Config["Zones"][k] = true
			Config["Zones"][k .. "catalog"] = true
		end
	end

	local peeks = {
		{
			group = { "isCarShopVehicle" },
			data = {
				{
					id = "carshop_check",
					label = "Informações do Veiculo",
					icon = "search-dollar",
					event = "caue-carshop:check",
					parameters = {}
				},
			},
			options = {
				distance = { radius = 2.5 }
			},
		},
		{
			group = { "isCarShopVehicle" },
			data = {
				{
					id = "carshop_buy",
					label = "Comprar Veiculo",
					icon = "dollar-sign",
					event = "caue-carshop:buy",
					parameters = {}
				},
			},
			options = {
				distance = { radius = 2.5 },
				isEnabled = function(pEntity, pContext)
					local _plate = exports["caue-vehicles"]:GetVehiclePlate(pEntity)

					return RPC.execute("caue-carshop:forSale", _plate)
				end,
			},
		},
		{
			group = { "isCarShopVehicle" },
			data = {
				{
					id = "carshop_change",
					label = "Alterar Veiculo",
					icon = "exchange-alt",
					event = "caue-carshop:change",
					parameters = {}
				},
				{
					id = "carshop_commission",
					label = "Alterar Comissão",
					icon = "percentage",
					event = "caue-carshop:commission",
				},
			},
			options = {
				distance = { radius = 2.5 },
				isEnabled = function(pEntity, pContext)
					local _shop = exports["caue-base"]:getVar("carshop")
					local _rank = exports["caue-groups"]:GroupRank(_shop)

					return _rank > 0
				end,
			},
		},
		{
			group = { "isCarShopVehicle" },
			data = {
				{
					id = "carshop_sell",
					label = "Vender Veiculo",
					icon = "dollar-sign",
					event = "caue-carshop:sell",
					parameters = {}
				},
			},
			options = {
				distance = { radius = 2.5 },
				isEnabled = function(pEntity, pContext)
					local _shop = exports["caue-base"]:getVar("carshop")
					local _rank = exports["caue-groups"]:GroupRank(_shop)
					local _plate = exports["caue-vehicles"]:GetVehiclePlate(pEntity)

					return _rank > 0 and not RPC.execute("caue-carshop:forSale", _plate)
				end,
			},
		},
		{
			group = { "isCarShopVehicle" },
			data = {
				{
					id = "carshop_testdrive",
					label = "Test Drive",
					icon = "car",
					event = "caue-carshop:testdrive",
					parameters = {}
				},
			},
			options = {
				distance = { radius = 2.5 },
				isEnabled = function(pEntity, pContext)
					local _shop = exports["caue-base"]:getVar("carshop")
					local _rank = exports["caue-groups"]:GroupRank(_shop)

					return _rank >= 3
				end,
			},
		},
		{
			group = { "isTestDriveVehicle" },
			data = {
				{
					id = "carshop_testdrivereturn",
					label = "Retonar Veiculo",
					icon = "car",
					event = "caue-carshop:testdriveReturn",
					parameters = {}
				},
			},
			options = {
				distance = { radius = 2.5 },
				isEnabled = function(pEntity, pContext)
					local shop = exports["caue-base"]:getVar("carshop")
					if not shop then
						return false
					end

					local rank = exports["caue-groups"]:GroupRank(shop)
					if rank < 3 then
						return false
					end

					return #(GetEntityCoords(pEntity) - exports["caue-carshop"]:getTestDriveLocation(shop)["xyz"]) < 3.0
				end,
			},
		},
	}

	for i, v in ipairs(peeks) do
		exports["caue-eye"]:AddPeekEntryByFlag(v.group, v.data, v.options)
	end
end)
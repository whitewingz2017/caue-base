--[[

    Functions

]]

function IsNearPlayer(player)
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    local ply2 = GetPlayerPed(GetPlayerFromServerId(player))
    local ply2Coords = GetEntityCoords(ply2, 0)
    local distance = Vdist2(plyCoords, ply2Coords)
    if(distance <= 5) then
        return true
    end
end

--[[

    Events

]]

AddEventHandler("caue-financials:giveCash", function(pParams, pEntity, pContext)
    local input = exports["caue-input"]:showInput({
		{
            icon = "hand-holding-usd",
            label = "Amount",
            name = "amount",
        },
	})

	if input["amount"] then
		local amount = tonumber(input["amount"])
		if not amount or amount < 1 then
			TriggerEvent("DoLongHudText", "Number Invalid", 2)
			return
		end

        if not IsNearPlayer(pEntity) then
            TriggerEvent("DoLongHudText", "No nearby player!", 2)
            return
        end

        local _cash = RPC.execute("caue-financials:getCash")
        if not _cash or _cash < amount then
            TriggerEvent("DoLongHudText", "You dont have enough cash", 2)
            return
        end

        TriggerEvent("animation:PlayAnimation","id")
		TriggerServerEvent("caue-financials:giveCash", GetPlayerServerId(NetworkGetPlayerIndexFromPed(pEntity)), amount)
	end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    local group = { 1 }

    local data = {
        {
            id = "give_cash",
            label = "Dar dinheiro",
            icon = "hand-holding-usd",
            event = "caue-financials:giveCash",
            parameters = {},
        }
    }

    local options = {
        distance = { radius = 1.5 },
        isEnabled = function(pEntity, pContext)
            return pContext.flags["isPlayer"] and pContext.distance <= 1.2
        end
    }

    exports["caue-eye"]:AddPeekEntryByEntityType(group, data, options)
end)
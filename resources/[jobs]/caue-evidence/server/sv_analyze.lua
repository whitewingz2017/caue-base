RegisterNetEvent("caue-evidence:analyze", function()
    local src = source

    local inventory = exports["caue-inventory"]:getInventory("analyze_evidence")
    local item = inventory[1]

    if item and (string.find(item.item_id, "evidence") or item.item_id == "dnaswab") then
        local metadata = json.decode(item.information)

        if metadata.identifier == "FADED" or metadata.identifier == "Scratched off data" then
            TriggerClientEvent("DoLongHudText", src, "Não foi possivel analisar esta evidência.", 2)
            return
        end

        local updated = false

        if metadata["Estriamento"] then
            if metadata["Estriamento"] == "Não analisado" then
                if math.random(100) <= 70 then
                    metadata["Estriamento"] = metadata.identifier
                else
                    metadata["Estriamento"] = "Inconclusivo"
                end

                updated = true
            else
                TriggerClientEvent("DoLongHudText", src, "Esta evidência já foi analisada.", 2)
            end
        elseif metadata["DNA"] then
            if metadata["DNA"] == "Não analisado" then
                if math.random(100) <= 80 or item.item_id == "dnaswab" then
                    metadata["DNA"] = metadata.identifier
                else
                    metadata["DNA"] = "Inconclusivo"
                end

                updated = true
            else
                TriggerClientEvent("DoLongHudText", src, "Esta evidência já foi analisada.", 2)
            end
        end

        if updated then
            MySQL.update.await([[
                UPDATE inventory
                SET information = ?
                WHERE id = ?
            ]],
            { json.encode(metadata), item.id })
        end
    else
        TriggerClientEvent("DoLongHudText", src, "Nenhuma evidência para analisar.", 2)
    end
end)

RegisterNetEvent("caue-evidence:dnaSwab", function(pTarget)
	local src = source

    local cid = exports["caue-base"]:getChar(pTarget, "id")
    if not cid then return end

    local dna = MySQL.scalar.await([[
        SELECT dna
        FROM characters
        WHERE id = ?
    ]],
    { cid })

    local data = {
        ["identifier"] = dna,
        ["DNA"] = "Não analisado",
        ["_hideKeys"] = { "identifier" },
    }

    TriggerClientEvent("player:receiveItem", src, "dnaswab", 1, true, data)
    TriggerClientEvent("DoLongHudText", pTarget, "Uma amostra de DNA foi coletada!")
end)
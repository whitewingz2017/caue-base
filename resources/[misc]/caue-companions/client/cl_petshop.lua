AddEventHandler("caue-companions:showPetshop", function(pArgs, pEntity, pContext)
    local data = {}

    for _, pet in ipairs(pArgs["Pets"]) do
        pet.type = pArgs["Type"]
        pet.department = pArgs["Department"]

        table.insert(data, {
            title = pet.name,
            description = "$" .. pet.price,
            children = {
                { title = "Confirmar Compra", action = "caue-pets:purchasePet", params = pet },
            },
        })
    end

    exports["caue-context"]:showContext(data)
end)

AddEventHandler("caue-pets:purchasePet", function(params)
    local input = exports["caue-input"]:showInput({
        {
            icon = "paw",
            label = "Nome do Animal",
            name = "name",
        }
    })

    if input["name"] then
        TriggerServerEvent("caue-pets:purchasePet", params, input["name"])
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    Citizen.Wait(1000)

    for i, v in ipairs(PetshopConfig) do
        exports["caue-npcs"]:RegisterNPC(v["NPC"])

        local group = { "isPetshopSeller" }

        local data = {
            {
                id = "petshop_" .. i,
                label = v["Label"],
                icon = "paw",
                event = "caue-companions:showPetshop",
                parameters = v,
            }
        }

        local options = {
            distance = { radius = 2.5 },
            isEnabled = function()
                return exports["caue-base"]:getChar("job") == v["Job"]
            end
        }

        exports["caue-eye"]:AddPeekEntryByFlag(group, data, options)
    end
end)
--[[

    Variables

]]

Housing.positions = {}
Housing.EditOptions = {}
Housing.Blips = false

local timeout = 0

--[[

    Functions

]]

function InteractionPressed(pRadial)
    local curTime = GetGameTimer()

    if Housing.lockpicking then
        return
    end

    if Housing.currentlyInsideBuilding then
        if curTime - timeout < 2000 then
            return
        end
        timeout = GetGameTimer()
        interactRob()
        return
    end

    local isComplete, propertyID, dist, zone = Housing.func.findClosestProperty()

    if not isComplete then
        return
    end

    if getHousingCatFromPropertID(propertyID) == "buisness" then
        return false
    end

    if curTime - timeout < 2000 then
        return
    end

    timeout = GetGameTimer()

    if dist > Housing.ranges.editRange then return end

    local player = GetEntityCoords(PlayerPedId())
    local finished, housingInformation, currentHousingLocks, isResult, housingLockdown, housingRobbed, robTargets, robLocations, alarm, currentAccess = RPC.execute("getCurrentSelected",propertyID)

    if type(housingLockdown) == "table" then
        Housing.currentHousingLockdown = housingLockdown
    end

    if type(currentHousingLocks) == "table" then
        Housing.currentHousingLocks = currentHousingLocks
    end

    if type(housingRobbed) == "table" then
        Housing.housingBeingRobbedClient = housingRobbed
    end

    if type(robTargets) == "table" then
        Housing.housingRobTargets = robTargets
    end

    if type(robLocations) == "table" then
        Housing.robPosLocations = robLocations
    end

    if type(currentAccess) == "table" then
        Housing.currentAccess = currentAccess
    end

    local cat = getHousingCatFromPropertID(propertyID)
    local max = Housing.max[cat]

    local hasBeenRobbed = false
    if Housing.housingBeingRobbedClient and Housing.housingBeingRobbedClient[propertyID] and pRadial then
        hasBeenRobbed = true
    end

    if not isGov() and Housing.currentOwned[propertyID] == nil and Housing.currentKeys[propertyId] == nil then
        if (Housing.currentHousingLocks == nil or Housing.currentHousingLocks[propertyID] == nil) and #(vec3FromVec4(Housing.info[propertyID]["pos"])-player) <= 4.5 and not hasBeenRobbed then
            TriggerEvent("DoLongHudText","Propriedade trancada",2)
            return
        end
    end

    if not isPropertyActive(propertyID) then return end

    if hasBeenRobbed then
        local finished,destroyedTable = RPC.execute("getDestroyedTable",propertyID)
        if type(destroyedTable) == "table" then
            Housing.destroyedObjects = destroyedTable
        end

        attemptToLockPickHouse(true)

        return
    end

    if finished or isGov() then
        if Housing.currentlyEditing == false then
            local pos = housingInformation

            if #(pos.backdoor_coordinates.external-player) <= Housing.ranges.doorEnterRange and max.canHaveBackDoor then
                if not isLocked(propertyID) or Housing.currentOwned[propertyID] ~= nil or Housing.currentKeys[propertyId] ~= nil then
                    if lockdownCheck(propertyID) then
                        if pos.backdoor_coordinates.internal ~= vector3(0.0,0.0,0.0) and pos.backdoor_coordinates.internal ~= nil then
                            Housing.func.enterBuilding(propertyID,pos.backdoor_coordinates.internal)
                        end
                    else
                        TriggerEvent("DoLongHudText","Propriedade bloqueada, você não pode acessar.",2)
                    end
                end

                return
            end
        end

        if #(vec3FromVec4(Housing.info[propertyID]["pos"])-player) <= Housing.ranges.doorEnterRange then
            if not isGov() then
                if Housing.currentHousingLocks == nil or Housing.currentHousingLocks[propertyID] == nil then
                    TriggerEvent("DoLongHudText","Propriedade trancada",2)
                    return
                end
            end

            if isGov() then
                Housing.func.enterBuilding(propertyID)
            else
                if not isLocked(propertyID) or Housing.currentOwned[propertyID] ~= nil or Housing.currentKeys[propertyId] ~= nil then
                    if lockdownCheck(propertyID) then
                        Housing.func.enterBuilding(propertyID)
                    else
                        TriggerEvent("DoLongHudText","Propriedade bloqueada, você não pode acessar",2)
                    end
                end
            end

            return
        end
    end
end

function canEdit()
    local propertyId = ""

    if Housing.currentHousingInteractions ~= nil and Housing.currentHousingInteractions.id ~= nil then
        propertyId = Housing.currentHousingInteractions.id
    else
        local isComplete, _propertyId, dist, zone = Housing.func.findClosestProperty()

        if not isComplete then
            return false
        end

        propertyId = _propertyId
    end

    if Housing.currentOwned[propertyId] ~= nil or Housing.currentKeys[propertyId] ~= nil then
        return true
    else
        return false
    end
end

function canPlaceAtLocation(pos,propertyID)
    if Housing.currentlyInsideBuilding then
        return false, "Não é possível editar isso dentro da propriedade"
    end

    if not playerInRangeOfProperty(propertyID) then
        return false, "Fora do range da propriedade"
    end

    local housingPos = vec3FromVec4(Housing.info[propertyID]["pos"])

    local cast = Raycast()
    if not cast.Hit then
        return false, "Não pode estar flutuando"
    end

    if cast.SurfaceNormal.z <= 0.968 then
        return false, "Muito íngreme para colocar o ponto"
    end

    local difference = math.abs(housingPos.z - pos.z)
    if difference > 15 then
        return false, "Muito longe da altura da porta"
    end

    return true, ""
end

function enterEdit(pPropertyId)
    local propertyID = pPropertyId

    if propertyID == 0 or propertyID == "" then
        TriggerEvent("DoLongHudText", "falha ao buscar propriedade", false)
        return
    end

    if Housing.typeInfo[Housing.info[propertyID].model].cat == "buisness" then
        TriggerEvent("DoLongHudText", "não é possível editar uma propriedade comercial", 2)
        return
    end

    if playerInRangeOfProperty(propertyID) then
        Housing.currentlyEditing = propertyID

        local finished, housingInformation, currentHousingLocks, isResult, housingLockdown, housingRobbed, robTargets, robLocations, alarm, currentAccess = RPC.execute("getCurrentSelected",propertyID)

        if isResult == false then
            if Housing.currentOwned[propertyID] == nil and Housing.currentKeys[propertyID] == nil then
                Housing.currentlyEditing = nil
                TriggerEvent("DoLongHudText", "Você não possui essa propriedade.", 2)
                return
            end
        end

        if type(housingLockdown) == "table" then
            Housing.currentHousingLockdown = housingLockdown
        end

        if Housing.currentHousingLockdown ~= nil and Housing.currentHousingLockdown[propertyID] and isResult == false then
            TriggerEvent("DoLongHudText", "Não é possível editar uma propriedade bloquada.", 2)
            return
        end

        if type(housingInformation) == "table" then
            Housing.currentHousingInteractions = housingInformation
            Housing.currentHousingInteractions.id = propertyID
        end

        if type(currentHousingLocks) == "table" then
            Housing.currentHousingLocks = currentHousingLocks
        end

        if type(currentAccess) == "table" then
            Housing.currentAccess = currentAccess
        end

        local houseCat = Housing.typeInfo[Housing.info[propertyID].model].cat

        local progressionData = 0
        local hasProgression = progressionData ~= nil and progressionData > 0
        local isOwner = false
        if Housing.currentOwned[propertyID] then isOwner = true end

        local publicCrafting = true

        local edit = {
            garage = Housing.max[houseCat].canHaveGarage or (Housing.info[propertyID].bypass and Housing.info[propertyID].bypass["canHaveGarage"]),
            stash = Housing.max[houseCat].canHaveInventory or (Housing.info[propertyID].bypass and Housing.info[propertyID].bypass["canHaveInventory"]),
            backdoor = Housing.max[houseCat].canHaveBackDoor or (Housing.info[propertyID].bypass and Housing.info[propertyID].bypass["canHaveBackDoor"]),
            wardrobe = Housing.max[houseCat].canHaveCharSelect or (Housing.info[propertyID].bypass and Housing.info[propertyID].bypass["canHaveCharSelect"]),
            crafting = Housing.max[houseCat].canHaveCrafting or (Housing.info[propertyID].bypass and Housing.info[propertyID].bypass["canHaveCrafting"]),
            furniture = Housing.max[houseCat].canHaveFurniture or (Housing.info[propertyID].bypass and Housing.info[propertyID].bypass["canHaveFurniture"]),
        }

        Housing.EditOptions = {
            garage = edit.garage and isOwner,
            stash = edit.stash and isOwner,
            backdoor = edit.backdoor and isOwner,
            wardrobe = edit.wardrobe and isOwner,
            crafting = ((edit.crafting and hasProgression) or (Housing.max[houseCat].publicCrafting and publicCrafting)) and isOwner,
            furniture = edit.furniture,
        }

        TriggerEvent("caue-housing:edit")
    else
        TriggerEvent("DoLongHudText", "Muito longe da propriedade.", 2)
    end
end

function exitEdit(saveChanges)
    if saveChanges then
        local finished = RPC.execute("updateCurrentSelected", Housing.currentlyEditing, Housing.currentHousingInteractions, Housing.hasEditedOrigin)
    end

    Housing.hasEditedOrigin = false
    Housing.positions = {}
    Housing.currentlyEditing = false
    Housing.EditOptions = {}

    if not Housing.currentlyInsideBuilding then
        Housing.currentHousingInteractions = nil
        Housing.currentAccess = nil
    end
end

function setGarage()
    if Housing.currentlyEditing == false then
        TriggerEvent("DoLongHudText", "Fora do modo edição", 2)
        return
    end

    if Housing.currentOwned[Housing.currentlyEditing] == nil then
        TriggerEvent("DoLongHudText", "você não possui essa propriedade", 2)
        return
    end

    if not hasCorrectFlags("canHaveGarage",Housing.currentlyEditing) then
        TriggerEvent("DoLongHudText", "Indisponível para a propriedade.", 2)
        return
    end

    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        TriggerEvent("DoLongHudText", "Deve ser feito dentro do veículo.", 2)
        return
    end

    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    local playerCoords = GetEntityCoords(vehicle)
    local passed, info = canPlaceAtLocation(playerCoords, Housing.currentlyEditing)
    local playerHeading = GetEntityHeading(GetVehiclePedIsIn(PlayerPedId(), false))

    if passed then
        local garage = vector4(playerCoords.x, playerCoords.y, playerCoords.z, playerHeading)
        Housing.currentHousingInteractions.garage_coordinates = garage

        local finished = RPC.execute("updateCurrentSelected", Housing.currentlyEditing, Housing.currentHousingInteractions, Housing.hasEditedOrigin)
        if finished then
            TriggerEvent("DoLongHudText", "Garagem movida")
        end
    end
end

function setInventory()
    if Housing.currentlyEditing == false then
        TriggerEvent("DoLongHudText", "Fora do modo edição", 2)
        return
    end

    if Housing.currentOwned[Housing.currentlyEditing] == nil then
        TriggerEvent("DoLongHudText", "você não possui a propriedade", 2)
        return
    end

    if Housing.currentlyInsideBuilding then
        local playerCoords = GetEntityCoords(PlayerPedId())
        local buildingVector = exports["caue-build"]:getModule("func").currentBuildingVector()
        local vector = (playerCoords - buildingVector)

        if not canPlaceInteractionPoint("inventory_offset", vector) then
            TriggerEvent("DoLongHudText", "Local inválido", 2)
            return
        end

        Housing.currentHousingInteractions.inventory_offset = vector
        Housing.currentHousingInteractions.crafting_offset = vector3(0.0,0.0,0.0)
        Housing.func.loadInteractions(Housing.info[Housing.currentHousingInteractions.id].model)

        -- RPC.execute("property:hasSwapped",Housing.currentHousingInteractions.id)

        local finished = RPC.execute("updateCurrentSelected", Housing.currentlyEditing, Housing.currentHousingInteractions, Housing.hasEditedOrigin)
        if finished then
            TriggerEvent("DoLongHudText", "Inventário movido")
        end
    else
        TriggerEvent("DoLongHudText", "fora da propriedade", 2)
    end
end

function placeBench(dropInventory)
    local buildingVector = exports["caue-build"]:getModule("func").currentBuildingVector()
    local hasBenches = true

    if dropInventory and hasBenches then
        local invVector = Housing.currentHousingInteractions.inventory_offset
        if invVector == nil then
            TriggerEvent("DoLongHudText", "Vetor não encontrado", 2)
            return
        end

        local vector = (buildingVector + invVector)

        local propertyID = Housing.currentHousingInteractions.id
        local cat = getHousingCatFromPropertID(propertyID)

        local vec = {x=vector.x,y=vector.y,z=vector.z}

        RPC.execute("property:dropInventory", vec, cat .. "-" .. propertyID, propertyID)
    end

    local playerCoords = GetEntityCoords(PlayerPedId())
    local objFound = GetClosestObjectOfType(playerCoords, 10.0, `gr_prop_gr_bench_02b`, 0, 0, 0)

    if objFound and objFound ~= 0 then
        if Housing.currentlyInsideBuilding then
            local objectCoords = GetEntityCoords(objFound)
            objectCoords = vector3(objectCoords.x,objectCoords.y,playerCoords.z)

            local vector = (objectCoords - buildingVector)

            if not canPlaceInteractionPoint("crafting_offset",vector) then return false,"Local inválido" end

            Housing.currentHousingInteractions.crafting_offset = vector
            if hasBenches then
                Housing.currentHousingInteractions.inventory_offset = vector3(0.0,0.0,0.0)
            end

            Housing.func.loadInteractions(Housing.info[Housing.currentHousingInteractions.id].model)

            -- RPC.execute("property:hasSwapped", Housing.currentHousingInteractions.id)

            local finished = RPC.execute("updateCurrentSelected",Housing.currentlyEditing,Housing.currentHousingInteractions,Housing.hasEditedOrigin)
            if finished then
                TriggerEvent("DoLongHudText", "Craft alterado")
            end
        else
            TriggerEvent("DoLongHudText", "fora da propriedade", 2)
        end
    else
        TriggerEvent("DoLongHudText", "Mesa de craft não encontrada", 2)
    end
end

function setBackdoor()
    if Housing.currentlyEditing == false then
        TriggerEvent("DoLongHudText", "Fora do modo edição", 2)
        return
    end

    if Housing.currentOwned[Housing.currentlyEditing] == nil then
        TriggerEvent("DoLongHudText", "você não possui a propriedade", 2)
        return
    end

    if not hasCorrectFlags("canHaveBackDoor",Housing.currentlyEditing) then
        TriggerEvent("DoLongHudText", "Indisponível para a propriedade.", 2)
        return
    end

    local playerCoords = GetEntityCoords(PlayerPedId())

    if not Housing.currentlyInsideBuilding then
        local passed, info = canPlaceAtLocation(playerCoords, Housing.currentlyEditing)
        if passed then
            Housing.currentHousingInteractions.backdoor_coordinates.external = playerCoords

            local finished = RPC.execute("updateCurrentSelected", Housing.currentlyEditing, Housing.currentHousingInteractions, Housing.hasEditedOrigin)
            if finished then
                TriggerEvent("DoLongHudText", "Porta dos fundos externa movida")
            end
        end
    else
        local buildingVector = exports["caue-build"]:getModule("func").currentBuildingVector()
        local vector = (playerCoords - buildingVector)

        if not canPlaceInteractionPoint("backdoor_offset_internal",vector) then
            TriggerEvent("DoLongHudText", "Local inválido", 2)
            return
        end

        Housing.currentHousingInteractions.backdoor_coordinates.internal = vector
        Housing.func.loadInteractions(Housing.info[Housing.currentHousingInteractions.id].model)

        local finished = RPC.execute("updateCurrentSelected",Housing.currentlyEditing,Housing.currentHousingInteractions,Housing.hasEditedOrigin)
        if finished then
            TriggerEvent("DoLongHudText", "Porta dos fundos interna movida")
        end
    end

end

function setCharChanger()
    if Housing.currentlyEditing == false then
        TriggerEvent("DoLongHudText", "Fora do modo edição", 2)
        return
    end

    if Housing.currentOwned[Housing.currentlyEditing] == nil then
        TriggerEvent("DoLongHudText", "você não possui a propriedade", 2)
        return
    end

    if not hasCorrectFlags("canHaveCharSelect",Housing.currentlyEditing) then
        TriggerEvent("DoLongHudText", "Indisponível para a propriedade.", 2)
        return
    end

    if Housing.currentlyInsideBuilding then
        local playerCoords = GetEntityCoords(PlayerPedId())
        local buildingVector = exports["caue-build"]:getModule("func").currentBuildingVector()
        local vector = (playerCoords - buildingVector)

        if not canPlaceInteractionPoint("charChanger_offset", vector) then
            TriggerEvent("DoLongHudText", "Local inválido", 2)
            return
        end

        Housing.currentHousingInteractions.charChanger_offset = vector
        Housing.func.loadInteractions(Housing.info[Housing.currentHousingInteractions.id].model)

        local finished = RPC.execute("updateCurrentSelected", Housing.currentlyEditing, Housing.currentHousingInteractions, Housing.hasEditedOrigin)
        if finished then
            TriggerEvent("DoLongHudText", "Alteração de personagem movida")
        end
    else
        TriggerEvent("DoLongHudText", "fora da casa", 2)
    end
end

function openFurniture()
    if Housing.currentlyEditing == false then
        TriggerEvent("DoLongHudText", "Fora do modo edição", 2)
        return
    end

    if Housing.currentKeys[Housing.currentlyEditing] == nil and Housing.currentOwned[Housing.currentlyEditing] == nil then
        TriggerEvent("DoLongHudText", "Você não possui as chaves da propriedade", 2)
        return
    end

    if not hasCorrectFlags("canHaveFurniture", Housing.currentlyEditing) then
        TriggerEvent("DoLongHudText", "Indisponível para a propriedade.", 2)
        return
    end

    if not Housing.currentlyInsideBuilding then
        TriggerEvent("DoLongHudText", "você não está dentro da propriedade", 2)
        return
    end

    buildFurnitureData(Housing.currentlyEditing)
end

function buildFurnitureData(propertyID)
    local zoneData = Housing.typeInfo[Housing.info[propertyID].model].zone
    local off = zoneData.offset
    local center = vector3(Housing.info[propertyID]["pos"].x+off.x,Housing.info[propertyID]["pos"].y+off.y,Housing.info[propertyID]["pos"].z+off.z-60.0)
    local hasCraftingProg = true
    local hasProgression = false

    if hasCraftingProg then
        local progressionData = 0
        hasProgression = progressionData ~= nil and progressionData > 0
    end

    local specials = {}
    if hasProgression or (not hasCraftingProg) then
        specials[#specials+1] = "gr_prop_gr_bench_02b"
    end

    local data = {
        name = propertyID,
        special = specials,
        autosave = true,
        zone = {
            pos = center,
            length = zoneData.length,
            width = zoneData.width,
            minZ = zoneData.minZ,
            maxZ = zoneData.maxZ,
            heading = zoneData.heading
        },
        modules = {
            "objects",
        },
    }

    TriggerServerEvent("CheckFurniture", data, propertyID)
end

function Housing.func.OpenStash(propertyID, cat)
    TriggerEvent("InteractSound_CL:PlayOnOne", "StashOpen", 0.6)
    TriggerEvent("server-inventory-open", "1", cat .. "-" .. propertyID)
    TriggerEvent("actionbar:setEmptyHanded")
end

function exitingBuilding()
    if Housing.currentlyRobInside then
        if math.random(100) < 25 then
            TriggerEvent("alert:houseRobbery")
        end
    end

    local id = Housing.currentHousingInteractions.id

    if id then
        TriggerEvent("caue-editor:destroyName", id)
    end

    if Housing.currentlyEditing == false then
        Housing.currentHousingInteractions = nil
    end

    Housing.currentAccess = nil
    Housing.currentlyInsideBuilding = false
end

function Housing.func.loadInteractions(model,overWrite)
    local interactionPoints = {}
    local publicCrafting = false

    for i=1,#Housing.interactionlist do
        local name = Housing.interactionlist[i].name
        if not overWrite then
            if name == "internal_exit" then
                goto skip_to_next
            end
        else
            if name ~= "internal_exit" then
                name = "none"
            end
        end

        local interaction = Housing.currentHousingInteractions[name]
        if name == "backdoor_offset_internal" then
            interaction = Housing.currentHousingInteractions.backdoor_coordinates.internal
        end

        if name == "internal_exit" and overWrite then
            interaction = Housing.typeInfo[model].exitOffset
        end

        local max = Housing.max[Housing.typeInfo[model].cat]

        if interaction == vector3(0.0,0.0,0.0) or interaction == nil then
            goto skip_to_next
        end

        if (name == "inventory_offset" and max.canHaveInventory) or (name == "charChanger_offset" and max.canHaveCharSelect) or (name == "crafting_offset" and (max.canHaveCrafting or (max.publicCrafting and publicCrafting))) or (name == "backdoor_offset_internal" and max.canHaveBackDoor) or (name == "internal_exit" and overWrite) then
            interactionPoints[#interactionPoints+1] = {
                ["offset"] = interaction,
                ["viewDist"] = 2.0,
                ["useDist"] = 2.0,
                ["generalUse"] = Housing.interactionlist[i].event["generalUse"],
                ["housingMain"] = Housing.interactionlist[i].event["housingMain"],
                ["housingSecondary"] = Housing.interactionlist[i].event["housingSecondary"],
            }
        end

        ::skip_to_next::
    end

    local isBuiltCoords = exports["caue-build"]:getModule("func").addInteractionPoints(model,interactionPoints,overWrite)
end

function isGov()
    local myjob = exports["caue-base"]:getChar("job")
    if exports["caue-jobs"]:getJob(myjob, "is_police") or myjob == "judge" then
        return true
    end
    return false
end

function canPlaceInteractionPoint(nameIncoming,pos)
    local canPlace = true
    for k,v in pairs(Housing.interactionlist) do
        local name = v.name
        if name == "backdoor_offset_internal" then
            if Housing.currentHousingInteractions.backdoor_coordinates.internal == vector3(0,0,0) then goto continue end
            local dist = #(Housing.currentHousingInteractions.backdoor_coordinates.internal-pos)
            if dist <= 2.0 then
                canPlace = false
                break
            end
        else
            if name ~= nameIncoming then
                if Housing.currentHousingInteractions[name] == nil or Housing.currentHousingInteractions[name] == vector3(0,0,0) then goto continue end
                local dist = #(Housing.currentHousingInteractions[name]-pos)
                if dist <= 2.0 then
                    canPlace = false
                    break
                end
            end
        end
        ::continue::
    end

    if not canPlace then
        TriggerEvent("DoLongHudText", "Não é possível colocar o ponto aqui, pode estar muito perto de outro ponto.", 2)
    end

    return canPlace
end

function lockdownCheck(propertyID)
    local myjob = exports["caue-base"]:getChar("job")

    if Housing.currentHousingLockdown == nil then
        return true
    end

    if Housing.currentHousingLockdown[propertyID] == nil then
        return true
    end

    if Housing.currentHousingLockdown[propertyID] and (exports["caue-jobs"]:getJob(myjob, "is_police") or myjob == "judge") then
        return true
    end

    return false
end



--[[

    Exports

]]

exports("canEdit", canEdit)

--[[

    Events

]]

RegisterNetEvent("housing:interactionTriggered")
AddEventHandler("housing:interactionTriggered", function(pInvade)
    InteractionPressed(pInvade)
end)

AddEventHandler("caue-housing:sell", function()
    local isComplete, propertyId, dist, zone = Housing.func.findClosestProperty()
    if not isComplete then
        TriggerEvent("DoLongHudText", propertyId, 2)
        return
    end

    if not isPropertyActive(propertyId) then
        TriggerEvent("DoLongHudText", "A propriedade não está a venda", 2)
        return
    end

    local propertyZone = Housing.func.getPropertyZoneFromID(propertyId)
    if propertyZone == nil then
        TriggerEvent("DoLongHudText", "Falha ao buscar propriedade", 2)
        return
    end

    local tax = RPC.execute("caue-financials:priceWithTax", Housing.info[propertyId]["price"], "Propertys")

    exports["caue-context"]:showContext({
        {
            title = "Propriedade",
            description = Housing.info[propertyId]["street"],
        },
        {
            title = "Preço",
            description = "$" .. tax.total .. " Incl. " .. tax.porcentage .. "% de taxa",
        },
        {
            title = "Vender",
            action = "caue-housing:sellTo",
            params = { propertyId = propertyId },
        }
    })
end)

AddEventHandler("caue-housing:sellTo", function(pParams)
    local input = exports["caue-input"]:showInput({
		{
            icon = "id-card",
            label = "ID do Personagem",
            name = "cid",
        },
	})

	if input["cid"] then
		local cid = tonumber(input["cid"])
		if not cid or cid < 1 then
			TriggerEvent("DoLongHudText", "Número inválido", 2)
			return
		end

		TriggerServerEvent("caue-housing:sell", cid, pParams.propertyId)
	end
end)

RegisterNetEvent("caue-housing:buy")
AddEventHandler("caue-housing:buy", function(pPropertyId, pSeller)
    local tax = RPC.execute("caue-financials:priceWithTax", Housing.info[pPropertyId]["price"], "Propertys")

    exports["caue-context"]:showContext({
        {
            title = "Propriedade",
            description = Housing.info[pPropertyId]["street"],
        },
        {
            title = "Preço",
            description = "$" .. tax.total .. " Incl. " .. tax.porcentage .. "% de taxa",
        },
        {
            title = "Comprar",
            action = "caue-housing:buyed",
            params = { propertyId = pPropertyId, total = tax.total, tax = tax.tax, seller = pSeller },
        }
    })
end)

AddEventHandler("caue-housing:rent", function()
    local isComplete, propertyId, dist, zone = Housing.func.findClosestProperty()
    if not isComplete then
        TriggerEvent("DoLongHudText", propertyId, 2)
        return
    end

    if not isPropertyActive(propertyId) then
        TriggerEvent("DoLongHudText", "A propriedade não está a venda", 2)
        return
    end

    local propertyZone = Housing.func.getPropertyZoneFromID(propertyId)
    if propertyZone == nil then
        TriggerEvent("DoLongHudText", "Falha ao buscar propriedade", 2)
        return
    end

    local tax = RPC.execute("caue-financials:priceWithTax", Housing.info[propertyId]["price"], "Propertys")

    exports["caue-context"]:showContext({
        {
            title = "Propriedade",
            description = Housing.info[propertyId]["street"],
        },
        {
            title = "Preço",
            description = "$" .. tax.total .. " Incl. " .. tax.porcentage .. "% de taxa",
        },
        {
            title = "Alugar",
            action = "caue-housing:rent2",
            params = { propertyId = propertyId, total = tax.total, tax = tax.tax },
        }
    })
end)

AddEventHandler("caue-housing:rent2", function(pParams)
    local complete, info = RPC.execute("caue-housing:rent", pParams.propertyId, pParams.total, pParams.tax)

    if complete then
        Housing.currentOwned = RPC.execute("getCurrentOwned")
        Housing.currentKeys = RPC.execute("currentKeys")
    else
        TriggerEvent("DoLongHudText", info, 2)
    end
end)

AddEventHandler("caue-housing:buyed", function(pParams)
    local complete, info = RPC.execute("caue-housing:buy", pParams.propertyId, pParams.total, pParams.tax, pParams.seller)

    if complete then
        Housing.currentOwned = info
        getCurrentKeys()
    else
        TriggerEvent("DoLongHudText", info, 2)
    end
end)

AddEventHandler("caue-housing:edit", function()
    local context = {}

    if Housing.currentlyEditing then
        if Housing.EditOptions["garage"] then
            table.insert(context, {
                title = "Garagem",
                action = "caue-housing:editOptions",
                params = { action = "garage" },
            })
        end

        if Housing.EditOptions["stash"] then
            table.insert(context, {
                title = "Inventário",
                action = "caue-housing:editOptions",
                params = { action = "stash" },
            })
        end

        if Housing.EditOptions["backdoor"] then
            table.insert(context, {
                title = "Porta dos Fundos",
                action = "caue-housing:editOptions",
                params = { action = "backdoor" },
            })
        end

        if Housing.EditOptions["wardrobe"] then
            table.insert(context, {
                title = "Armário",
                action = "caue-housing:editOptions",
                params = { action = "wardrobe" },
            })
        end

        if Housing.EditOptions["crafting"] then
            table.insert(context, {
                title = "Craft",
                action = "caue-housing:editOptions",
                params = { action = "crafting" },
            })
        end

        if Housing.EditOptions["furniture"] then
            table.insert(context, {
                title = "Móveis",
                action = "caue-housing:editOptions",
                params = { action = "furniture" },
            })
        end

        table.insert(context, {
            title = "Finalizar Edição",
            action = "caue-housing:editOptions",
            params = { action = "exit" },
        })
    else
        local propertyId = ""

        if Housing.currentHousingInteractions ~= nil and Housing.currentHousingInteractions.id ~= nil then
            propertyId = Housing.currentHousingInteractions.id
        else
            local isComplete, _propertyId, dist, zone = Housing.func.findClosestProperty()

            if not isComplete then
                TriggerEvent("DoLongHudText", "Muito distante da propriedade.", 2)
                return
            end

            propertyId = _propertyId
        end

        if Housing.currentOwned[propertyId] == nil and Housing.currentKeys[propertyId] == nil then
            TriggerEvent("DoLongHudText", "Você não possui essa propriedade.", 2)
            return
        end

        context = {
            {
                title = "Iniciar Edição",
                action = "caue-housing:editOptions",
                params = { action = "enter", propertyId = propertyId },
            }
        }
    end

    exports["caue-context"]:showContext(context)
end)

AddEventHandler("caue-housing:editOptions", function(pParams)
    if pParams.action == "enter" then
        enterEdit(pParams.propertyId)
    elseif pParams.action == "exit" then
        exitEdit(true)
    elseif pParams.action == "garage" then
        setGarage()
    elseif pParams.action == "stash" then
        setInventory()
    elseif pParams.action == "backdoor" then
        setBackdoor()
    elseif pParams.action == "wardrobe" then
        setCharChanger()
    elseif pParams.action == "crafting" then
        switchBenchInventory(true)
    elseif pParams.action == "furniture" then
        openFurniture()
    end
end)

RegisterNetEvent("housing:inventory")
AddEventHandler("housing:inventory", function()
    if Housing.currentlyEditing ~= false then return end

    local propertyID = Housing.currentHousingInteractions.id
    local cat = getHousingCatFromPropertID(propertyID)
    local max = Housing.max[cat]

    if max.canHaveInventory then
        if not lockdownCheck(propertyID) then
            TriggerEvent("DoLongHudText", "Propriedade bloqueada, você não pode abrir o inventário", 2)
            return
        end

        if Housing.currentOwned[propertyID] then
            Housing.func.OpenStash(propertyID,cat)
        else
            if Housing.currentKeys ~= nil and Housing.currentKeys[propertyID] ~= nil then
                Housing.func.OpenStash(propertyID,cat)
            end

            local myjob = exports["caue-base"]:getChar("job")
            if Housing.currentHousingLockdown[propertyID] and (exports["caue-jobs"]:getJob(myjob, "is_police") or  myjob == "judge") then
                Housing.func.OpenStash(propertyID,cat)
            end
        end
    end
end)

RegisterNetEvent("housing:charLogout")
AddEventHandler("housing:charLogout", function()
    if Housing.currentlyEditing ~= false then return end

    local cat = getHousingCatFromPropertID(Housing.currentHousingInteractions.id)
    local max = Housing.max[cat]

    if max.canHaveCharSelect then
        TransitionToBlurred(500)
        DoScreenFadeOut(500)
        exitingBuilding()
        Citizen.Wait(1000)
        exports["caue-build"]:getModule("func").CleanUpArea()
        Citizen.Wait(1000)
        TriggerEvent("caue-login:switchCharacter")

        Citizen.Wait(1000)
    end
end)

RegisterNetEvent("housing:frontdoor")
AddEventHandler("housing:frontdoor", function()
    DoScreenFadeOut(1)
    exports["caue-build"]:getModule("func").exitCurrentRoom(Housing.info[Housing.currentHousingInteractions.id]["pos"])
    exitingBuilding()
    DoScreenFadeIn(1900)
end)

RegisterNetEvent("housing:internalBackdoor")
AddEventHandler("housing:internalBackdoor", function()
    local cat = getHousingCatFromPropertID(Housing.currentHousingInteractions.id)
    local max = Housing.max[cat]

    if max.canHaveBackDoor then
        if Housing.currentHousingInteractions.backdoor_coordinates.external == nil or Housing.currentHousingInteractions.backdoor_coordinates.external == vector3(0.0,0.0,0.0) then return end
        DoScreenFadeOut(1)
        exports["caue-build"]:getModule("func").exitCurrentRoom(Housing.currentHousingInteractions.backdoor_coordinates.external)
        exitingBuilding()
        DoScreenFadeIn(1900)
    end
end)

RegisterNetEvent("housing:crafting")
AddEventHandler("housing:crafting", function()
    local propertyID = Housing.currentHousingInteractions.id
    if Housing.currentOwned[propertyID] == nil then
        TriggerEvent("DoLongHudText", "Só o dono pode utilizar isso.", 2)
        return
    end

    local hasCraftingProg = false
    if not hasCraftingProg then
        TriggerEvent("server-inventory-open", "42096", "Craft")
        return
    end

    local progressionData = 0
    if progressionData == nil or progressionData < 1 then
        TriggerEvent("DoLongHudText", "você não possui o conhecimento para isso" , 2)
        return
    end

    local index = 1

    if progressionData >= 1 and progressionData <= 2000 then index = 1 end
    if progressionData >= 2001 and progressionData <= 7500 then index = 2 end
    if progressionData >= 7501 and progressionData <= 14000 then index = 3 end
    if progressionData >= 14001 then index = 4 end

    local craftingIndex = {
        [1] = "38",
        [2] = "39",
        [3] = "40",
        [4] = "41",
    }

    TriggerEvent("server-inventory-open", craftingIndex[index], "Craft-".. index)
end)

RegisterNetEvent("housing:kickFromHouse")
AddEventHandler("housing:kickFromHouse", function(propertyID)
    if Housing.currentHousingInteractions == nil then return end
    local id = Housing.currentHousingInteractions.id
    if id == propertyID then
        DoScreenFadeOut(1)
        exports["caue-build"]:getModule("func").exitCurrentRoom(Housing.info[id]["pos"])
        exitingBuilding()
        DoScreenFadeIn(1900)
    end
end)

RegisterNetEvent("caue-housing:blips")
AddEventHandler("caue-housing:blips", function()
    Housing.Blips = not Housing.Blips

    local houses = RPC.execute("caue-housing:owned")

    for k, v in pairs(Housing.info) do
        if Housing.Blips then
            v["blip"] = AddBlipForCoord(v["pos"]["xyz"])
            SetBlipSprite(v["blip"], 40)
            SetBlipScale(v["blip"], 0.5)
            SetBlipAsShortRange(v["blip"], true)

            if houses[k] then
                SetBlipColour(v["blip"], 1)
            else
                SetBlipColour(v["blip"], 2)
            end

            -- BeginTextCommandSetBlipName("STRING")
            -- AddTextComponentString("House")
            -- EndTextCommandSetBlipName(v["blip"])
        else
            if v["blip"] ~= nil then
                RemoveBlip(v["blip"])
            end
        end
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    while true do
        if Housing.currentlyEditing and not Housing.currentlyInsideBuilding then
            if not playerInRangeOfProperty(Housing.currentlyEditing) and not Housing.currentlyInsideBuilding then
                exitEdit(false) -- leaving property range
            end

            if Housing.currentHousingInteractions ~= nil then
                Housing.positions = {
                    garage = {pos = Housing.currentHousingInteractions.garage_coordinates, text = "Localização da garagem" },
                    backdoor = {pos = Housing.currentHousingInteractions.backdoor_coordinates.external, text = "Localização da porta dos fundos externa"}
                }
            end

            Wait(1000)
        else
            Wait(5000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if Housing.currentlyEditing ~= false then
            if playerInRangeOfProperty(Housing.currentlyEditing) then
                for k,v in pairs(Housing.positions) do
                    if type(v.pos) == "vector4" then
                        if #(v.pos - vector4(0.0,0.0,0.0,0.0)) > 10.0  then
                            Draw3DText(v.pos.x,v.pos.y,v.pos.z, v.text)
                        end
                    else
                        if #(v.pos - vector3(0.0,0.0,0.0)) > 10.0  then
                            Draw3DText(v.pos.x,v.pos.y,v.pos.z, v.text)
                        end
                    end
                end
            else
                Wait(1000)
            end

            Wait(1)
        else
            Wait(5000)
        end
    end
end)
local Promises, PlayerCoords, EntityCoords = {}, {}, {}

RegisterNetEvent("caue:infinity:player:coords")
AddEventHandler("caue:infinity:player:coords", function (pCoords)
    PlayerCoords = pCoords

    --Fucking lack of support for vector3
    TriggerEvent("caue:infinity:player:coords:array", GetCoordsArray(PlayerCoords))
end)

RegisterNetEvent("caue:infinity:entity:coords")
AddEventHandler("caue:infinity:entity:coords", function (pNetId, pCoords)
    if Promises[pNetId] then
        Promises[pNetId]:resolve(pCoords)
    end

    --Fucking lack of support for vector3
    TriggerEvent("caue:infinity:entity:coords:array", pNetId, VectorToArray(pCoords))
end)

function FetchEntityCoords(pNetId, pArray)
    local result = promise:new()
    local timeout = PromiseTimeout(1000)

    Promises[pNetId] = result

    TriggerServerEvent("caue:infinity:entity:coords", pNetId)

    local coords = Citizen.Await(promise.first({ timeout, result }))

    EntityCoords[pNetId] = coords

    Citizen.SetTimeout(1000, function()
        EntityCoords[pNetId] = nil
        --More compatibility bs
        TriggerEvent("caue:infinity:entity:coords:array", pNetId, nil)
    end)

    Promises[pNetId] = nil

    if pArray and coords then
        coords = VectorToArray(coords)
    end

    return coords
end

exports("FetchEntityCoords", FetchEntityCoords)

exports("GetPlayerCoords", function (pServerId, pArray)
    local coords = PlayerCoords[tonumber(pServerId)]

    if pArray and coords then
        coords = VectorToArray(coords)
    end

    return coords
end)

exports("DoesPlayerExist", function (pServerId)
    local playerId = GetPlayerFromServerId(tonumber(pServerId))

    if playerId ~= -1 then
        return true
    end
end)

exports("IsPlayerActive", function (pServerId)
    return PlayerCoords[tonumber(pServerId)] ~= nil
end)

exports("GetNetworkedCoords", function (pType, pNetId, pArray)
    local coords

    if pType == "player" then
        local playerIndex = GetPlayerFromServerId(pNetId)
        coords = playerIndex ~= -1 and GetEntityCoords(GetPlayerPed(playerIndex)) or PlayerCoords[pNetId]
    else
        local entity = NetworkGetEntityFromNetworkId(pNetId)

        if DoesEntityExist(entity) then
            coords = GetEntityCoords(entity)
        else
            coords = EntityCoords[pNetId] or FetchEntityCoords(pNetId)
        end
    end

    if pArray and coords then
        coords = VectorToArray(coords)
    end

    return coords
end)

exports("GetLocalEntity", function (pType, pNetId)
    local entity

    if pType == "player" then
        local playerIndex = GetPlayerFromServerId(pNetId)
        entity = playerIndex ~= -1 and GetPlayerPed(playerIndex) or 0
    else
        entity = NetworkGetEntityFromNetworkId(pNetId)
    end

    return entity
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    TriggerServerEvent("caue:infinity:player:ready")
end)
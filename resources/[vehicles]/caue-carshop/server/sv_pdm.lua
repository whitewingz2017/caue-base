local door = "closed"

RegisterNetEvent("SpawnEventsServer")
AddEventHandler("SpawnEventsServer", function()
    local src = source

    Citizen.Wait(5000)

    TriggerClientEvent("caue-carshop:pdmBackDoor", src, door)
end)

RegisterNetEvent("caue-carshop:pdmBackDoor")
AddEventHandler("caue-carshop:pdmBackDoor", function()
    local update = "opened"
    if door == "opened" then
        update = "closed"
    end

    door = update

    TriggerClientEvent("caue-carshop:pdmBackDoor", -1, door)
end)
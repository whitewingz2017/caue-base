--[[

    Variables

]]

npcComing = false
local entityVehicle = nil
local entityPed = nil

--[[

    Functions

]]

function DoctorNPC()
	RequestAnimDict("mini@cpr@char_a@cpr_str")
	while not HasAnimDictLoaded("mini@cpr@char_a@cpr_str") do
		Citizen.Wait(1000)
	end

    TaskPlayAnim(entityPed, "mini@cpr@char_a@cpr_str","cpr_pumpchest",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)

    Citizen.Wait(10000)

    ClearPedTasks(entityPed)
	Citizen.Wait(500)
    TriggerEvent("reviveFunction")
	TriggerEvent("DoLongHudText", "Seu tratamento acabou, foi cobrado o valor de: $" .. 500)

    if entityVehicle then
        TaskVehicleDriveToCoord(entityPed, entityVehicle, 307.93, -594.99, 43.29, 20.0, 0, GetEntityModel(entityVehicle), 524863, 2.0)
    else
        RemovePedElegantly(entityPed)
    end

    npcComing = false

    Citizen.Wait(60000)

    RemovePedElegantly(entityPed)
    DeleteEntity(entityPed)

    if DeleteEntity(entityVehicle) then
        DeleteEntity(entityVehicle)
    end
end

--[[

    Events

]]

RegisterNetEvent("caue-death:medicNPC")
AddEventHandler("caue-death:medicNPC", function()
    npcComing = true
    TriggerEvent("DoLongHudText", "Aguarde, o paramedico esta a caminho")

    local vehhash = GetHashKey("ambulance")
    RequestModel(vehhash)
	while not HasModelLoaded(vehhash) do
        Wait(1)
    end

    local pedhash = GetHashKey("s_m_m_paramedic_01")
    RequestModel("s_m_m_paramedic_01")
	while not HasModelLoaded("s_m_m_paramedic_01") do
        Wait(1)
    end

    local loc = GetEntityCoords(PlayerPedId())
    local spawnRadius = 500
    local found, spawnPos, spawnHeading = GetClosestVehicleNodeWithHeading(loc.x + math.random(-spawnRadius, spawnRadius), loc.y + math.random(-spawnRadius, spawnRadius), loc.z, 0, 3, 0)

    local npcVehicle = CreateVehicle(vehhash, spawnPos, spawnHeading, true, false)
    SetVehicleOnGroundProperly(npcVehicle)
    SetVehicleNumberPlateText(npcVehicle, "PENIS")
    SetEntityAsMissionEntity(npcVehicle, true, true)
    SetVehicleEngineOn(npcVehicle, true, true, false)

    local npcPed = CreatePedInsideVehicle(npcVehicle, 26, pedhash, -1, true, false)
    DecorSetBool(npcVehicle, "ScriptedPed", true)
    SetDriverAbility(npcPed, 1.0)
    SetDriverAggressiveness(npcPed, 0.0)
    TaskVehicleDriveWander(npcPed, npcVehicle, 20.0, 263043)
    SetDriveTaskDrivingStyle(npcPed, 263043)
    SetEntityVisible(PlayerPedId(), true)

    local npcBlip = AddBlipForEntity(npcPed)
    SetBlipFlashes(npcBlip, true)
    SetBlipColour(npcBlip, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Paramédico")
    EndTextCommandSetBlipName(npcBlip)

    PlaySoundFrontend(-1, "Text_Arrive_Tone", "Phone_SoundSet_Default", 1)
    Wait(2000)


    entityVehicle = npcVehicle
    entityPed = npcPed

    local startLoop = GetGameTimer() + 190000
    local near = 0
    local insideVehicle = true

    while true do
        Citizen.Wait(200)

        local loc = GetEntityCoords(PlayerPedId())
        local lc = GetEntityCoords(entityVehicle)
        local ld = GetEntityCoords(entityPed)
        local dist = #(vector3(loc.x, loc.y, loc.z) - vector3(lc.x, lc.y, lc.z))
        local dist1 = #(vector3(loc.x, loc.y, loc.z) - vector3(ld.x, ld.y, ld.z))

        if insideVehicle then
            TaskVehicleDriveToCoord(entityPed, entityVehicle, loc.x, loc.y, loc.z, 20.0, 0, GetEntityModel(entityVehicle), 263043, 2.0)
        else
            TaskGoToCoordAnyMeans(entityPed, loc.x, loc.y, loc.z, 1.0, 0, 0, 786603, 0xbf800000)
        end

        if dist1 <= 50 then
            if near == 0 then
                near = GetGameTimer() + 30000
            elseif GetGameTimer() > near then
                local pedVehicle = GetVehiclePedIsIn(entityPed)
                if vehicle ~= 0 then
                    TaskLeaveVehicle(entityPed, pedVehicle, 16)
                    insideVehicle = false
                end
            end

            if dist1 <= 10 then
                local pedVehicle = GetVehiclePedIsIn(entityPed)
                if vehicle ~= 0 then
                    TaskLeaveVehicle(entityPed, pedVehicle, 16)
                    insideVehicle = false
                end

                if dist1 <= 3.5 then
                    local vehicle = GetVehiclePedIsIn(PlayerPedId())
                    if vehicle ~= 0 then
                        TaskLeaveVehicle(PlayerPedId(), vehicle, 16)
                    end

                    if dist1 <= 1 then
                        ClearPedTasksImmediately(entityPed)
                        DoctorNPC()
                        break
                    end
                end
            end
        end

        if GetGameTimer() > startLoop then
            TaskLeaveVehicle(entityPed, entityVehicle, 16)
            local pos = GetEntityCoords(PlayerPedId())
            SetEntityCoords(entityPed, vector3(pos.x + math.random(0, 2), pos.y + math.random(0, 2), pos.z))
            DeleteEntity(entityVehicle)
            entityVehicle = nil
        end
    end
end)
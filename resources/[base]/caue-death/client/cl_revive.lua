--[[

    Functions

]]

function attemptRevive()
    if InVeh() then return end

    if imDead or IsDeadAnimPlaying() or IsDeadVehAnimPlaying() then
        imDead = false
        thecount = 300

        local ped = PlayerPedId()

        TriggerEvent("resurrect:relationships")
        TriggerEvent("Evidence:isAlive")

        SetEntityInvincible(ped, false)
        SetPedMaxHealth(ped, 200)
        SetEntityHealth(ped, 120)
        SetPlayerMaxArmour(PlayerId(), 60)
        ClearPedBloodDamage(ped)
        RemoveAllPedWeapons(ped, true)

        ClearPedTasksImmediately(ped)

        local wasBeatdown = exports["caue-police"]:getBeatmodeDebuff()
        if wasBeatdown then
            TriggerEvent("police:startBeatdownDebuff")
        end

        local plyPos = GetEntityCoords(ped,  true)
        local heading = GetEntityHeading(ped)
        NetworkResurrectLocalPlayer(plyPos, heading, false, false, false)

        Citizen.Wait(500)

        SetPedMaxHealth(PlayerPedId(), 200)
        SetEntityHealth(PlayerPedId(), 120)
        getup()
    end
end

function getup()
    ClearPedSecondaryTask(PlayerPedId())
    loadAnimDict("random@crash_rescue@help_victim_up")
    TaskPlayAnim(PlayerPedId(), "random@crash_rescue@help_victim_up", "helping_victim_to_feet_victim", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    SetCurrentPedWeapon(PlayerPedId(),2725352035,true)
    Citizen.Wait(3000)
    ClearPedSecondaryTask(PlayerPedId())
end

--[[

    Events

]]

RegisterNetEvent("heal")
AddEventHandler("heal", function()
	local ped = PlayerPedId()
	if DoesEntityExist(ped) and not IsEntityDead(ped) then
		SetEntityHealth(ped, GetEntityMaxHealth(ped))
	end
end)

RegisterNetEvent("trycpr")
AddEventHandler("trycpr", function()
    local curDist = #(GetEntityCoords(PlayerPedId(), 0) - vector3(2438.32, 4960.30, 47.27))
    local curDist2 = #(GetEntityCoords(PlayerPedId(), 0) - vector3(-1001.18, 4850.52, 274.61))

    if curDist < 5 or curDist2 < 5 then
        local penis = 0
        while penis < 10 do
            penis = penis + 1
            local finished = exports["caue-taskbarskill"]:taskBarSkill(math.random(2000, 6000),math.random(5, 15))
            if finished ~= 100 then
                return
            end
            Wait(100)
        end
        TriggerServerEvent("serverCPR")
    else
        TriggerEvent("DoLongHudText","You're not near the rest house",2)
    end
end)

RegisterNetEvent("reviveFunction")
AddEventHandler("reviveFunction", attemptRevive)
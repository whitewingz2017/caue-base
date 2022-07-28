--[[

    Variables

]]

imDead = false

thecount = 0
local EHeld = 500
local bleedtime = 0

local isViolent = false
local isMinor = false
local isBlunt = false

local deathText
local respawnText
local characterKill = false

local disablingloop = false

local lastDamageTaken = {}

local InjuryList = {
    [-1569615261] = { "WEAPON_UNARMED", "Fist Marks", minor = true },
    [-100946242] = { "WEAPON_ANIMAL", "Animal Bites and Claws", blunt = true },
    [148160082] = { "WEAPON_COUGAR", "Animal Bites and Claws", blunt = true },
    [-1716189206] = { "WEAPON_KNIFE", "Knife Wounds", violent = true },
    [1737195953] = { "WEAPON_NIGHTSTICK", "Blunt Object (Metal)", blunt = true },
    [1317494643] = { "WEAPON_HAMMER", "Small Blunt Object (Metal)", blunt = true },
    [-1024456158] = { "WEAPON_BAT", "Large Blunt Object", blunt = true },
    [1141786504] = { "WEAPON_GOLFCLUB", "Long Thing Blunt Object", blunt = true },
    [-2067956739] = { "WEAPON_CROWBAR", "Medium Size Jagged Metal Object", blunt = true },
    [453432689] = { "WEAPON_PISTOL", "Pistol Bullets", violent = true },
    [1593441988] = { "WEAPON_COMBATPISTOL", "Combat Pistol Bullets", violent = true },
    [584646201] = { "WEAPON_APPISTOL", "AP Pistol Bullets", violent = true },
    [-1716589765] = { "WEAPON_PISTOL50", "50 Cal Pistol Bullets", violent = true },
    [324215364] = { "WEAPON_MICROSMG", "Micro SMG Bullets", violent = true },
    [736523883] = { "WEAPON_SMG", "SMG Bullets", violent = true },
    [-270015777] = { "WEAPON_ASSAULTSMG", "Assault SMG Bullets", violent = true },
    [-1074790547] = { "WEAPON_ASSAULTRIFLE", "Assault Rifle Bullets", violent = true },
    [-2084633992] = { "WEAPON_CARBINERIFLE", "Carbine Rifle Bullets", violent = true },
    [-1357824103] = { "WEAPON_ADVANCEDRIFLE", "Advanced Rifle bullets", violent = true },
    [-1660422300] = { "WEAPON_MG", "Machine Gun Bullets", violent = true },
    [2144741730] = { "WEAPON_COMBATMG", "Combat MG Bullets", violent = true },
    [487013001] = { "WEAPON_PUMPSHOTGUN", "Pump Shotgun Bullets", violent = true },
    [2017895192] = { "WEAPON_SAWNOFFSHOTGUN", "Sawn Off Bullets", violent = true },
    [-494615257] = { "WEAPON_ASSAULTSHOTGUN", "Assault Shotgun Bullets", violent = true },
    [-1654528753] = { "WEAPON_BULLPUPSHOTGUN", "Bullpup Shotgun Bullets", violent = true },
    [911657153] = { "WEAPON_STUNGUN", "Stun Gun Damage", minor = true },
    [100416529] = { "WEAPON_SNIPERRIFLE", "Sniper Rifle Wounds", violent = true },
    [205991906] = { "WEAPON_HEAVYSNIPER", "Sniper Rifle Wounds", violent = true },
    [856002082] = { "WEAPON_REMOTESNIPER", "Sniper Rifle Wounds", violent = true },
    [-1568386805] = { "WEAPON_GRENADELAUNCHER", "Explosive Damage (Grenades)", violent = true },
    [1305664598] = { "WEAPON_GRENADELAUNCHER_SMOKE", "Smoke Damage", minor = true },
    [-1312131151] = { "WEAPON_RPG", "RPG damage", violent = true },
    [1752584910] = { "WEAPON_STINGER", "RPG damage", violent = true },
    [1119849093] = { "WEAPON_MINIGUN", "Minigun Wounds", violent = true },
    [-1813897027] = { "WEAPON_GRENADE", "Grenade Wounds", violent = true },
    [741814745] = { "WEAPON_STICKYBOMB", "Sticky Bomb Wounds", violent = true },
    [-37975472] = { "WEAPON_SMOKEGRENADE", "Smoke Damage", violent = true },
    [-1600701090] = { "WEAPON_BZGAS", "Gas Damage", violent = true },
    [615608432] = { "WEAPON_MOLOTOV", "Molotov/Accelerant Burns", violent = true },
    [101631238] = { "WEAPON_FIREEXTINGUISHER", "Fire Extenguisher Damage", minor = true },
    [883325847] = { "WEAPON_PETROLCAN", "Petrol Can Damage", minor = true },
    [1233104067] = { "WEAPON_FLARE", "Flare Damage", violent = true },
    [1223143800] = { "WEAPON_BARBED_WIRE", "Barbed Wire Damage", blunt = true },
    [-10959621] = { "WEAPON_DROWNING", "Drowning", violent = true },
    [1936677264] = { "WEAPON_DROWNING_IN_VEHICLE", "Drowned in Vehicle", violent = true },
    [-1955384325] = { "WEAPON_BLEEDING", "Died to Blood Loss", violent = true },
    [-1833087301] = { "WEAPON_ELECTRIC_FENCE", "Electric Fence Wounds", blunt = true },
    [539292904] = { "WEAPON_EXPLOSION", "Explosion Damage", violent = true },
    [-842959696] = { "WEAPON_FALL", "Fall / Impact Damage", violent = true },
    [910830060] = { "WEAPON_EXHAUSTION", "Died of Exhaustion", minor = true },
    [-868994466] = { "WEAPON_HIT_BY_WATER_CANNON", "Water Cannon Pelts", blunt = true },
    [133987706] = { "WEAPON_RAMMED_BY_CAR", "Vehicular Accident", violent = true },
    [-1553120962] = { "WEAPON_RUN_OVER_BY_CAR", "Runover by Vehicle", violent = true },
    [341774354] = { "WEAPON_HELI_CRASH", "Heli Crash", violent = true },
    [-544306709] = { "WEAPON_FIRE", "Fire Victim", violent = true },
    [4024951519] = { "WEAPON_ASSAULTSMG", "Assault SMG", violent = true },
    [1627465347] = { "WEAPON_GUSENBERG", "Gusenberg", violent = true },
    [171789620] = { "WEAPON_COMBATPDW", "Combat PDW", violent = true },
    [984333226] = { "WEAPON_HEAVYSHOTGUN", "Heavy Shotgun", violent = true },
    [317205821] = { "WEAPON_AUTOSHOTGUN", "Autoshotgun", violent = true },
    [2640438543] = { "WEAPON_BULLPUPSHOTGUN", "Bullpup Shotgun", violent = true },
    [3800352039] = { "WEAPON_ASSAULTSHOTGUN", "Assault Shotgun", violent = true },
    [2132975508] = { "WEAPON_BULLPUPRIFLE", "Bullpup Rifle", violent = true },
    [3220176749] = { "WEAPON_ASSAULTRIFLE", "Assault Rifle", violent = true },
    [3219281620] = { "WEAPON_PISTOL_MK2", "PD Pistol", violent = true },
    [`WEAPON_BRICK`] = { "WEAPON_BRICK", "Brick", minor = true },
    [`WEAPON_SHOE`] = { "WEAPON_SHOE", "Shoe", minor = true },
    [`WEAPON_CASH`] = { "WEAPON_CASH", "Cash", minor = true },
}

local WeaponsList = {
    ["148457251"] = true,
    ["-2012211169"] = true,
    ["-1746263880"] = true,
    ["453432689"] = true,
    ["-1075685676"] = true,
    ["1593441988"] = true,
    ["-120179019"] = true,
    ["-1716589765"] = true,
    ["-134995899"] = true,
    ["584646201"] = true,
    ["-942620673"] = true,
    ["736523883"] = true,
    ["1192676223"] = true,
    ["-1768145561"] = true,
    ["-1719357158"] = true,
    ["100416529"] = true,
    ["-1536150836"] = true,
    ["-90637530"] = true,
    ["-1074790547"] = true,
    ["497969164"] = true,
    ["-275439685"] = true,
    ["487013001"] = true,
    ["1432025498"] = true,
    ["171789620"] = true,
    ["1649403952"] = true,
    ["-1472189665"] = true,
}

--[[

    Functions

]]

function IsMinorCauseOfDeath(deathHash)
    if InjuryList[deathHash] and InjuryList[deathHash].minor then
        return true
    end
    return false
end

function IsViolentCauseOfDeath(deathHash)
    if InjuryList[deathHash] and InjuryList[deathHash].violent then
        return true
    end
    return false
end

function IsBluntCauseOfDeath(deathHash)
    if InjuryList[deathHash] and InjuryList[deathHash].blunt then
        return true
    end
    return false
end

function deathTimer()
    EHeld = 500

    if isMinor then
        thecount = 30
    elseif isBlunt then
        thecount = 120
    else
        thecount = 300
    end

    TriggerEvent("doTimer")
    TriggerEvent("disableAllActions")

    while imDead do
        Citizen.Wait(1000)

        thecount = thecount - 1

        bleedtime = bleedtime + 1
        if bleedtime == 30 then
            TriggerEvent("evidence:bleeding",false)
            bleedtime = 0
        end

        while thecount < 0 do
            Citizen.Wait(1)

            if IsControlPressed(1, 38) then
                local hspDist = #(vector3(307.93, -594.99, 43.29) - GetEntityCoords(PlayerPedId()))
                EHeld = EHeld - 1
                if hspDist > 5 and EHeld < 1 and not ((isMinor or isBlunt) and InVeh()) then
                    thecount = 99999999

                    if characterKill then
                        TriggerEvent("apartments:Logout")
                    elseif isMinor or isBlunt then
                        attemptRevive()
                    else
                        TriggerServerEvent("caue-death:medicNPC")
                    end
                end
            else
                EHeld = 500
            end
        end
    end
end

function drawTxt(x, y, width, height, scale, text, r, g, b, a, outline)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function InVeh()
    local intrunk = exports["caue-base"]:getVar("trunk")

    if IsPedSittingInAnyVehicle(PlayerPedId()) or intrunk then
        return true
    else
        return false
    end
end

function FireCheck()
    local Coords = GetEntityCoords(PlayerPedId())
    local retval, outPosition = GetClosestFirePos(Coords.x, Coords.y, Coords.z)
    return retval
end

function DoDeathAnim(ped)
    ClearPedTasksImmediately(ped)

    if isMinor or isBlunt then
        loadAnimDict("mini@cpr@char_b@cpr_def")
        TaskPlayAnim(ped, "mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", 8.0, -8, -1, 1, 0, 0, 0, 0)
    elseif characterKill then
        loadAnimDict("dead")
        TaskPlayAnim(ped, "dead", "dead_d", 8.0, -8, -1, 1, 0, 0, 0, 0)
    else
        loadAnimDict("random@dealgonewrong")
        TaskPlayAnim(ped, "random@dealgonewrong", "idle_a", 8.0, -8, -1, 1, 0, 0, 0, 0)
    end
end

function DoVehDeathAnim(ped)
    loadAnimDict("random@crash_rescue@car_death@std_car")
    TaskPlayAnim(ped, "random@crash_rescue@car_death@std_car", "loop", 8.0, -8, -1, 1, 0, 0, 0, 0)
end

function IsDeadAnimPlaying()
    if IsEntityPlayingAnim(PlayerPedId(), "random@dealgonewrong", "idle_a", 1) or IsEntityPlayingAnim(PlayerPedId(), "mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", 1) or IsEntityPlayingAnim(PlayerPedId(), "dead", "dead_d", 1) then
        return true
    else
        return false
    end
end

function IsDeadVehAnimPlaying()
    if IsEntityPlayingAnim(PlayerPedId(), "random@crash_rescue@car_death@std_car", "loop", 1) then
        return true
    else
        return false
    end
end

function ResetRelationShipGroups()
    Citizen.Wait(1000)

    if exports["caue-jobs"]:getJob(false, "is_emergency") then
        SetPedRelationshipGroupDefaultHash(PlayerPedId(), `MISSION2`)
        SetPedRelationshipGroupHash(PlayerPedId(), `MISSION2`)
    else
        SetPedRelationshipGroupDefaultHash(PlayerPedId(), `PLAYER`)
        SetPedRelationshipGroupHash(PlayerPedId(), `PLAYER`)
    end

    TriggerEvent("caue-ai:setDefaultRelations")
end

function releaseBody()
    thecount = 300
    imDead = false

    local ped = PlayerPedId()

    TriggerEvent("DoLongHudText", "You have been revived by medical staff")
    TriggerServerEvent("Evidence:ClearDamageStates")
    TriggerServerEvent("caue-inventory:clear")
    TriggerServerEvent("police:SeizeCash", GetPlayerServerId(PlayerId()))
    TriggerEvent("resurrect:relationships")
    TriggerEvent("Evidence:isAlive")

    ClearPedTasksImmediately(ped)
    FreezeEntityPosition(ped, false)
    RemoveAllPedWeapons(ped)
    SetEntityCoords(ped, 357.43, -593.36, 28.79)
    SetEntityInvincible(ped, false)
    SetPedMaxHealth(ped, 200)
    SetEntityHealth(ped, 200)
    ClearPedBloodDamage(ped)
    SetCurrentPedWeapon(ped, 2725352035, true)

    local wasBeatdown = exports["caue-police"]:getBeatmodeDebuff()

    if wasBeatdown then
        TriggerEvent("police:startBeatdownDebuff")
    end

    Citizen.CreateThread(function()
        Citizen.Wait(4000)

        TriggerEvent("unEscortPlayer")
        TriggerEvent("resetCuffs")
    end)
end

--[[

    Events

]]

RegisterNetEvent("caue-death:reset")
AddEventHandler("caue-death:reset", function()
    thecount = 300
    imDead = false
    isViolent = false
    isMinor = false
    isBlunt = false
    characterKill = false
    lastDamageTaken = {}
    npcComing = false
    SetPedMaxHealth(PlayerPedId(), 200)
    SetEntityHealth(PlayerPedId(), 200)
end)

AddEventHandler("DamageEvents:EntityDamaged", function(victim, attacker, pWeapon, isMelee)
    local playerPed = PlayerPedId()

    if victim ~= playerPed then return end

    local injured, part = GetPedLastDamageBone(playerPed)

    lastDamageTaken = {
        hash = pWeapon,
        source = attacker,
        melee = isMelee,
        isHeadshot = (part == 31086)
    }

    if imDead and IsPedAPlayer(attacker) and not characterKill and WeaponsList[tostring(pWeapon)] then
        if #(GetEntityCoords(playerPed) - GetEntityCoords(attacker)) <= 5.0 then
            characterKill = true
            TriggerEvent("evidence:bleeding",true)
            TriggerServerEvent("caue-death:characterKill")
            thecount = 300
            deathText = ("~w~You Died (~r~CK~w~)! wait ~r~%d ~w~seconds")
            respawnText = ("~w~Hold ~r~E ~w~(%d) ~w~to respawn")
            ClearPedTasksImmediately(playerPed)
            loadAnimDict("dead")
            TaskPlayAnim(playerPed, "dead", "dead_d", 8.0, -8, -1, 1, 0, 0, 0, 0)
        end
    end
end)

RegisterNetEvent("doTimer")
AddEventHandler("doTimer", function()
    exports["caue-base"]:setVar("dead", true)
    exports["caue-flags"]:SetPedFlag(PlayerPedId(), "isDead", true)
    TriggerEvent("caue-death:dead", true)

    if isMinor or isBlunt then
        deathText = ("Unconscious: ~r~%d~w~ seconds left")
        respawnText = ("~W~Hold ~r~E ~w~ (%d) ~w~ to  ~r~getup~w~")
    elseif characterKill then
        deathText = ("~w~You died (~r~CK~w~)! Hold ~r~%d ~w~seconds")
        respawnText = ("~w~Hold ~r~E ~w~(%d) ~w~to respawn")
    else
        deathText = ("~w~You're hurt! Hold ~r~%d ~w~seconds to call for medical assistance (~g~$500~w~)")
        respawnText = ("~w~Hold ~r~E ~w~(%d) ~w~to call for medical assistance")
    end

    local canPay = nil

    while imDead do
        Citizen.Wait(0)

        if thecount > 0 then
            if npcComing then
                drawTxt(0.89, 1.42, 1.0,1.0,0.6, "Medical assistance on the way", 255, 255, 255, 255)
            else
                drawTxt(0.89, 1.42, 1.0,1.0,0.6, deathText:format(thecount), 255, 255, 255, 255)
            end
        else
            if not isMinor and not isBlunt and not characterKill and canPay == nil then
                canPay = RPC.execute("caue-death:canCallMedicNPC")
                if not canPay then
                    characterKill = true
                    TriggerEvent("evidence:bleeding",true)
                    TriggerServerEvent("caue-death:characterKill")
                    respawnText = ("~w~Hold ~r~E ~w~(%d) ~w~to respawn")
                    ClearPedTasksImmediately(PlayerPedId())
                    loadAnimDict("dead")
                    TaskPlayAnim(PlayerPedId(), "dead", "dead_d", 8.0, -8, -1, 1, 0, 0, 0, 0)
                end
            end

            drawTxt(0.89, 1.42, 1.0,1.0,0.6, respawnText:format(math.ceil(EHeld/100)), 255, 255, 255, 255)
        end
    end

    exports["caue-base"]:setVar("dead", false)
    exports["caue-flags"]:SetPedFlag(PlayerPedId(), "isDead", false)
    TriggerEvent("caue-death:dead", false)
end)

RegisterNetEvent("disableAllActions")
AddEventHandler("disableAllActions", function()
    if not disablingloop then
        local ped = PlayerPedId()

        disablingloop = true

        -- wait for any ragdoll / falling to finish
        while IsPedRagdoll(PlayerPedId()) do
            Citizen.Wait(1)
        end

        while GetEntitySpeed(ped) > 0.5 do
            Citizen.Wait(1)
        end

        -- wait for any fire effects on player to finish
        local fireLength = 60
        while FireCheck(ped) and fireLength > 1 do
            Wait(1000)
            fireLength = fireLength - 1
        end

        -- get vehicle seat
        local seat = 0
        local veh = GetVehiclePedIsUsing(ped)
        if veh then
            local vehmodel = GetEntityModel(veh)
            for i = -1, GetVehicleModelNumberOfSeats(vehmodel) do
                if GetPedInVehicleSeat(veh, i) == ped then
                    seat = i
                end
            end
        end

        -- resurrect player
        TriggerEvent("resurrect:relationships")

        -- new ped after resurrect & reseat
        ped = PlayerPedId()
        if veh then
            TaskWarpPedIntoVehicle(ped,veh,seat)
        end

        TriggerEvent("disableVehicleActions")
        TriggerEvent("disableAllActions2")

        -- SetEntityInvincible(ped, true)
        SetPedMaxHealth(ped, 10000)
        SetEntityHealth(ped, GetEntityMaxHealth(ped))

        while imDead do
            Citizen.Wait(200)

            if InVeh() and (not IsDeadVehAnimPlaying() or IsPedRagdoll(ped)) and not FireCheck(ped) then
                DoVehDeathAnim(ped)
            elseif not InVeh() and (not IsDeadAnimPlaying() or IsPedRagdoll(ped)) and not FireCheck(ped) and not IsPedFalling(ped) then
                DoDeathAnim(ped)
            end

            Citizen.Wait(800)
        end

        SetEntityInvincible(ped, false)
        ClearPedTasksImmediately(ped)

        disablingloop = false
    end
end)

RegisterNetEvent("disableVehicleActions")
AddEventHandler("disableVehicleActions", function()
    while imDead do
        local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)

        Wait(300)

        if PlayerPedId() ==  GetPedInVehicleSeat(currentVehicle, -1) then
            SetVehicleUndriveable(currentVehicle, true)
        end
    end
end)

RegisterNetEvent("disableAllActions2")
AddEventHandler("disableAllActions2", function()
    local playerPed = PlayerPedId()

    while imDead do
        Citizen.Wait(0)

        DisableInputGroup(0)
        DisableInputGroup(1)
        DisableInputGroup(2)
        DisableControlAction(1, 19, true)
        DisableControlAction(0, 34, true)
        DisableControlAction(0, 9, true)
        DisableControlAction(0, 32, true)
        DisableControlAction(0, 8, true)
        DisableControlAction(2, 31, true)
        DisableControlAction(2, 32, true)
        DisableControlAction(1, 33, true)
        DisableControlAction(1, 34, true)
        DisableControlAction(1, 35, true)
        DisableControlAction(1, 21, true)  -- space
        DisableControlAction(1, 22, true)  -- space
        DisableControlAction(1, 23, true)  -- F
        DisableControlAction(1, 24, true)  -- F
        DisableControlAction(1, 25, true)  -- F

        if IsControlJustPressed(1,29) then
            SetPedToRagdoll(playerPed, 26000, 26000, 3, 0, 0, 0)
            Citizen.Wait(22000)
            TriggerEvent("deathAnim")
        end

        DisableControlAction(1, 106, true) -- VehicleMouseControlOverride
        DisableControlAction(1, 140, true) --Disables Melee Actions
        DisableControlAction(1, 141, true) --Disables Melee Actions
        DisableControlAction(1, 142, true) --Disables Melee Actions
        DisableControlAction(1, 37, true) --Disables INPUT_SELECT_WEAPON (tab) Actions
        DisablePlayerFiring(playerPed, true) -- Disable weapon firing
    end

    SetPedCanRagdoll(PlayerPedId(), false)
end)

RegisterNetEvent("resurrect:relationships")
AddEventHandler("resurrect:relationships", function()
    NetworkResurrectLocalPlayer(GetEntityCoords(PlayerPedId(), true), true, true, false)
    ResetRelationShipGroups()
end)

RegisterNetEvent("ressurection:relationships:norevive")
AddEventHandler("ressurection:relationships:norevive", function()
    ResetRelationShipGroups()
end)

dragged = false
RegisterNetEvent("deathdrop")
AddEventHandler("deathdrop", function(beingDragged)
    dragged = beingDragged
    if not beingDragged and imDead then
        SetEntityHealth(PlayerPedId(), 200.0)
        SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 1.0))
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    local ped = PlayerPedId()
    SetPedConfigFlag(ped, 184, true)

    while true do
        Wait(5000)

        if PlayerPedId() ~= ped then
            ped = PlayerPedId()
            SetPedConfigFlag(ped, 184, true)
        end
    end
end)

Citizen.CreateThread(function()
    SetEntityInvincible(PlayerPedId(), false)
    SetPedMaxHealth(PlayerPedId(), 200)
    SetEntityHealth(PlayerPedId(), 200)

    imDead = false

    while true do
        Wait(100)

        local player = PlayerPedId()

        if IsEntityDead(player) then
            TriggerEvent("actionbar:setEmptyHanded")

            local deathHash = GetPedCauseOfDeath(player)
            if not deathHash or deathHash == 0 then deathHash = lastDamageTaken.hash end
            local deathSource = GetPedSourceOfDeath(player)
            if not deathSource or deathSource == 0 then deathSource = lastDamageTaken.source end

            local injured, part = GetPedLastDamageBone(player)
            lastDamageTaken.isHeadshot = (part == 31086)

            isViolent = IsViolentCauseOfDeath(deathHash)
            isMinor = IsMinorCauseOfDeath(deathHash)
            isBlunt = IsBluntCauseOfDeath(deathHash)

            SetEntityInvincible(player, true)
            SetEntityHealth(player, GetEntityMaxHealth(player))
            TriggerServerEvent("police:isDead", GetPedCauseOfDeath(player))
            TriggerEvent("Evidence:isDead")

            local isFromBeatdown = exports["caue-police"]:getIsInBeatmode()

            if isFromBeatdown then
                exports["caue-police"]:setIsInBeatmode(false)
                exports["caue-police"]:setBeatmodeDebuff(true)
            end

            if not imDead then
                imDead = true

                -- if IsPedAPlayer(deathSource) and deathSource ~= player and lastDamageTaken.isHeadshot and WeaponsList[lastDamageTaken.hash] then
                --     if #(GetEntityCoords(player) - GetEntityCoords(deathSource)) <= 5.0 then
                --         characterKill = true
                --         TriggerEvent("evidence:bleeding",true)
                --         TriggerServerEvent("caue-death:characterKill")
                --     end
                -- end

                deathTimer()
            end
        end
    end
end)
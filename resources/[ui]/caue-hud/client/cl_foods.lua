--[[

    Variables

]]

local lastForcedUpdate = 0
local GodEnabled = false
local dstamina = 0

local fruits = {
    ["apple"] = "🍎",
    ["banana"] = "🍌",
    ["cherry"] = "🍒",
    ["coconut"] = "🥥",
    ["grapes"] = "🍇",
    ["kiwi"] = "🥝",
    ["lemon"] = "🍋",
    ["peach"] = "🍑",
    ["strawberry"] = "🍓",
    ["watermelon"] = "🍉",
    ["orange"] = "🍊",
    ["lime"] = "🍈 ",

}

local alcohols = {
    ["absolut"] = {
        prop = "vodka",
        alcoholStrength = 100.0,
        icon = "🥴",
    },
    ["vodka"] = {
        prop = "vodka",
        alcoholStrength = 1.0,
        icon = "🥴",
    },
    ["beer"] = {
        prop = "beer",
        alcoholStrength = 0.5,
        icon = "🍺",
    },
    ["whiskey"] = {
        prop = "whiskey",
        alcoholStrength = 1.0,
        icon = "🥃",
    },
    ["absinthe"] = {
        prop = "whiskeyglass",
        alcoholStrength = 2.5,
        icon = "🤢",
    },
    ["drink1"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["drink2"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["drink3"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["drink4"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["drink5"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["drink6"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["drink7"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["drink8"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["drink9"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["drink10"] = {
        prop = "whiskeyglass",
        alcoholStrength = 0.6,
        icon = "🍸",
    },
    ["shot1"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
    ["shot2"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
    ["shot3"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
    ["shot4"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
    ["shot5"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
    ["shot6"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
    ["shot7"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
    ["shot8"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
    ["shot9"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
    ["shot10"] = {
        prop = "shotglass",
        alcoholStrength = 0.8,
        icon = "🍶",
    },
}

local humanpars = {
    ["humanhead"] = "humanskull",
    ["humantorso"] = "humanbone",
    ["humanarm"] = "humanbone",
    ["humanhand"] = "humanbone",
    ["humanleg"] = "humanbone",
    ["humanfinger"] = "humanbone",
    ["humanear"] = "humanear",
    ["humanintestines"] = "humanintestines",
    ["humanheart"] = "humanheart",
    ["humaneye"] = "humaneye",
    ["humanbrain"] = "humanbrain",
    ["humankidney"] = "humankidney",
    ["humanliver"] = "humanliver",
    ["humanlungs"] = "humanlungs",
    ["humantongue"] = "humantongue",
    ["humanpancreas"] = "humanpancreas",
}

local items = {
    ["water"] = {
        dictionary = "amb@world_human_drinking@beer@female@idle_a",
        animation = "idle_e",
        typeAnim = 49,
        timer = 6000,
        message = "💧",
        func = "changethirst",
        remove = true,
        prop = "water",
    },
    ["cola"] = {
        dictionary = "amb@world_human_drinking@beer@female@idle_a",
        animation = "idle_e",
        typeAnim = 49,
        timer = 6000,
        message = "🥤",
        func = "changethirst",
        remove = true,
        prop = "cola",
    },
    ["sprunk"] = {
        dictionary = "amb@world_human_drinking@beer@female@idle_a",
        animation = "idle_e",
        typeAnim = 49,
        timer = 6000,
        message = "🥤",
        func = "changethirst",
        remove = true,
        prop = "cola",
    },
    ["hamburger"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍔",
        func = "changehunger",
        remove = true,
        prop = "hamburger",
    },
    ["sandwich"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🥪",
        func = "changehunger",
        remove = true,
        prop = "sandwich",
    },
    ["donut"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍩",
        func = "food:Condiment",
        remove = true,
        prop = "donut",
    },
    ["eggsbacon"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍳🥓",
        func = "food:Condiment",
        remove = true,
    },
    ["cookie"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍪",
        func = "food:Condiment",
        remove = true,
    },
    ["muffin"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🧁",
        func = "food:Condiment",
        remove = true,
    },
    ["greencow"] = {
        dictionary = "amb@world_human_drinking@coffee@male@idle_a",
        animation = "idle_c",
        typeAnim = 49,
        timer = 6000,
        message = "🧃",
        func = "food:Condiment",
        remove = true,
        prop = "energydrink",
    },
    ["taco"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🌮",
        func = "food:Taco",
        remove = true,
        prop = "taco",
    },
    ["burrito"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🌯",
        func = "food:Taco",
        remove = true,
    },
    ["fishtaco"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🐟🌮",
        func = "food:FishTaco",
        remove = true,
        prop = "taco",
    },
    ["slushy"] = {
        dictionary = "amb@world_human_drinking@beer@female@idle_a",
        animation = "idle_e",
        typeAnim = 49,
        timer = 6000,
        message = "🥤",
        func = "inv:wellfed",
        remove = true,
        prop = "cup",
        prefunc = function()
            TriggerEvent("healed:useOxy")
        end,
    },
    ["coffee"] = {
        dictionary = "amb@world_human_drinking@coffee@male@idle_a",
        animation = "idle_c",
        typeAnim = 49,
        timer = 6000,
        message = "☕",
        func = "coffee:drink",
        remove = true,
        prop = "coffee",
    },
    ["frappuccino"] = {
        dictionary = "amb@world_human_drinking@coffee@male@idle_a",
        animation = "idle_c",
        typeAnim = 49,
        timer = 6000,
        message = "☕",
        func = "coffee:drink",
        remove = true,
        prop = "coffee",
    },
    ["mshake"] = {
        dictionary = "amb@world_human_drinking@coffee@male@idle_a",
        animation = "idle_c",
        typeAnim = 49,
        timer = 6000,
        message = "☕",
        func = "coffee:drink",
        remove = true,
        prop = "coffee",
    },
    ["latte"] = {
        dictionary = "amb@world_human_drinking@coffee@male@idle_a",
        animation = "idle_c",
        typeAnim = 49,
        timer = 6000,
        message = "☕",
        func = "coffee:drink",
        remove = true,
        prop = "coffee",
    },
    ["fries"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 15000,
        message = "🍟",
        func = "food:Fries",
        remove = true,
        prop = "fries",
    },
    ["softdrink"] = {
        dictionary = "amb@world_human_drinking@coffee@male@idle_a",
        animation = "idle_c",
        typeAnim = 49,
        timer = 15000,
        message = "🥤",
        func = "food:SoftDrink",
        remove = true,
        prop = "softdrink",
    },
    ["bscoffee"] = {
        dictionary = "amb@world_human_drinking@coffee@male@idle_a",
        animation = "idle_c",
        typeAnim = 49,
        timer = 15000,
        message = "☕",
        func = "coffee:drink",
        remove = true,
        prop = "bscoffee",
    },
    ["jailfood"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍱",
        func = "inv:wellfed",
        remove = true,
    },
    ["jaildrink"] = {
        dictionary = "amb@world_human_drinking@beer@female@idle_a",
        animation = "idle_e",
        typeAnim = 49,
        timer = 6000,
        message = "💧",
        func = "changethirst",
        remove = true,
    },
    ["bleederburger"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍔",
        func = "inv:wellfed",
        remove = true,
        prop = "hamburger",
    },
    ["heartstopper"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍔",
        func = "inv:wellfed",
        remove = true,
        prop = "hamburger",
    },
    ["torpedo"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍔",
        func = "inv:wellfed",
        remove = true,
        prop = "hamburger",
    },
    ["meatfree"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍔",
        func = "inv:wellfed",
        remove = true,
        prop = "hamburger",
    },
    ["moneyshot"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍔",
        func = "inv:wellfed",
        remove = true,
        prop = "hamburger",
    },
    ["churro"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🥖",
        func = "food:Condiment",
        remove = true,
    },
    ["hotdog"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🌭",
        func = "food:Condiment",
        remove = true,
        prop = "hotdog",
    },
    ["chocobar"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍫",
        func = "food:Condiment",
        remove = true,
        prop = "chocobar",
    },
    ["icecream"] = {
        dictionary = "mp_player_inteat@burger",
        animation = "mp_player_int_eat_burger",
        typeAnim = 49,
        timer = 6000,
        message = "🍦",
        func = "food:IceCream",
        remove = true,
    },
}

--[[

    Functions

]]

function changeHunger(_value)
    local _hunger = currentValues["hunger"]

    local value = math.random(15, 25)
    if _value then value = _value end

    _hunger = _hunger + value

    if _hunger > 100 then _hunger = 100 end
    if _hunger < 0 then _hunger = 0 end

    currentValues["hunger"] = _hunger
    updateStatus("hunger", _hunger)

    if GetCloudTimeAsInt() > lastForcedUpdate then
        lastForcedUpdate = GetCloudTimeAsInt() + 60
        TriggerServerEvent("caue-hud:updateData", GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()), currentValues["thirst"], currentValues["hunger"])
    end
end

function changeThirst(_value)
    local _thirst = currentValues["thirst"]

    local value = math.random(15, 25)
    if _value then value = _value end

    _thirst = _thirst + value

    if _thirst > 100 then _thirst = 100 end
    if _thirst < 0 then _thirst = 0 end

    currentValues["thirst"] = _thirst
    updateStatus("thirst", _thirst)

    if GetCloudTimeAsInt() > lastForcedUpdate then
        lastForcedUpdate = GetCloudTimeAsInt() + 60
        TriggerServerEvent("caue-hud:updateData", GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()), currentValues["thirst"], currentValues["hunger"])
    end
end

--[[

    Events

]]

AddEventHandler("caue-inventory:itemUsed", function(item, infos)
    local playerVeh = GetVehiclePedIsIn(PlayerPedId(), false)

    if items[item] then
        local _item = items[item]

        if _item.prefunc then
            _item.prefunc(item)
        end

        exports["caue-inventory"]:AttachPropAndPlayAnimation(_item.dictionary, _item.animation, _item.typeAnim, _item.timer, _item.message, _item.func, _item.remove, item, playerVeh, _item.prop)

        if _item.posfunc then
            _item.posfunc(item)
        end
    elseif humanpars[item] then
        if item == humanpars[item] then
            exports["caue-inventory"]:TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 10000, "😈 Eating (ESC to Cancel) 😈", "inv:wellfed", true, item, playerVeh)
        else
            exports["caue-inventory"]:TaskItem("mp_player_inteat@burger", "mp_player_int_eat_burger", 49, 10000, "😈 Eating (ESC to Cancel) 😈", "inv:wellfed", true, item, playerVeh, true, humanpars[item])
        end
    end
end)

RegisterNetEvent("carandplayerhud:godCheck")
AddEventHandler("carandplayerhud:godCheck", function(arg)
    GodEnabled = arg
end)

RegisterNetEvent("changehunger")
AddEventHandler("changehunger", changeHunger)

RegisterNetEvent("changethirst")
AddEventHandler("changethirst", changeThirst)

RegisterNetEvent("food:Condiment")
AddEventHandler("food:Condiment", function()
    dstamina = 0
    Citizen.Wait(1000)

    changeHunger(40)

    -- if stresslevel > 500 then
    --     SetRunSprintMultiplierForPlayer(PlayerId(), 1.15)
    --     dstamina = math.random(10,15)
    -- else
    --     SetRunSprintMultiplierForPlayer(PlayerId(), 1.25)
    --     dstamina = math.random(10,15)
    -- end

    while dstamina > 0 do
        Citizen.Wait(1000)

        RestorePlayerStamina(PlayerId(), 1.0)
        dstamina = dstamina - 1

        if IsPedRagdoll(PlayerPedId()) then
            SetPedToRagdoll(PlayerPedId(), math.random(5), math.random(5), 3, 0, 0, 0)
        end

        if math.random(100) > 91 and IsPedRunning(PlayerPedId()) then
            SetPedToRagdoll(PlayerPedId(), math.random(1000), math.random(1000), 3, 0, 0, 0)
        end
    end

    dstamina = 0

    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(), 6000, 6000, 3, 0, 0, 0)
    end

    -- SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end)

RegisterNetEvent("food:Taco")
AddEventHandler("food:Taco", function()
    changeHunger(100)
    TriggerEvent("healed:minors")
end)

RegisterNetEvent("food:IceCream")
AddEventHandler("food:IceCream", function()
    TriggerServerEvent("server:alterStress", false, 350)
end)

RegisterNetEvent("food:FishTaco")
AddEventHandler("food:FishTaco", function()
    dstamina = 0

    changeHunger(80)

    if stresslevel > 500 then
        SetSwimMultiplierForPlayer(PlayerId(), 1.15)
        dstamina = math.random(30,60)
    else
        SetSwimMultiplierForPlayer(PlayerId(), 1.25)
        dstamina = math.random(30,60)
    end

     while dstamina > 0 do
        if (IsPedSwimmingUnderWater(PlayerPedId()) or IsPedSwimming(PlayerPedId())) then
            RestorePlayerStamina(PlayerId(), 1.0)
        end

        Citizen.Wait(1000)

        dstamina = dstamina - 1
    end

    dstamina = 0

    SetSwimMultiplierForPlayer(PlayerId(), 1.0)
    RevertToStressMultiplier()
end)

RegisterNetEvent("inv:wellfed")
AddEventHandler("inv:wellfed", function()
    TriggerEvent("Evidence:StateSet", 25, 3600)
    TriggerEvent("client:newStress", false, 10)
    changeHunger(100)
end)

RegisterNetEvent("coffee:drink")
AddEventHandler("coffee:drink", function()
    changeThirst(45)
end)

RegisterNetEvent("food:Fries")
AddEventHandler("food:Fries", function()
    changeHunger(20)
    TriggerEvent("healed:minors")
end)

RegisterNetEvent("food:SoftDrink")
AddEventHandler("food:SoftDrink", function()
    dstamina = 0
    Citizen.Wait(1000)

    changeThirst(40)

    -- SetRunSprintMultiplierForPlayer(PlayerId(), 1.25)
    dstamina = math.random(10,15)

    while dstamina > 0 do
        Citizen.Wait(1000)

        RestorePlayerStamina(PlayerId(), 1.0)
        dstamina = dstamina - 1

        if IsPedRagdoll(PlayerPedId()) then
            SetPedToRagdoll(PlayerPedId(), math.random(5), math.random(5), 3, 0, 0, 0)
        end

        if math.random(100) > 91 and IsPedRunning(PlayerPedId()) then
            SetPedToRagdoll(PlayerPedId(), math.random(1000), math.random(1000), 3, 0, 0, 0)
        end
    end

    dstamina = 0

    if IsPedRunning(PlayerPedId()) then
        SetPedToRagdoll(PlayerPedId(),6000,6000, 3, 0, 0, 0)
    end

    -- SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
end)

RegisterNetEvent("food:Fruit")
AddEventHandler("food:Fruit", function()
    changeHunger(5)
end)

AddEventHandler("shops:vendingMachine", function (pParams, pEntity, pContext)
    if pContext then
        TriggerEvent("server-inventory-open", pContext.flags["isVendingMachineBeverage"] and "36" or "37", "Shop")
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    -- Fruits
    for k, v in pairs(fruits) do
        items[k] = {
            dictionary = "mp_player_inteat@burger",
            animation = "mp_player_int_eat_burger",
            typeAnim = 49,
            timer = 6000,
            message = v,
            func = "food:Fruit",
            remove = true,
            prop = "fruit",
        }
    end

    -- Alcohols
    for k, v in pairs(alcohols) do
        items[k] = {
            dictionary = "amb@world_human_drinking@coffee@male@idle_a",
            animation = "idle_c",
            typeAnim = 49,
            timer = 6000,
            message = v.icon,
            func = "changethirst",
            remove = true,
            prop = v.prop,
            posfunc = function(item)
                TriggerEvent("Evidence:StateSet", 8, 600)
                TriggerEvent("fx:run", "alcohol", 180, alcohols[item].alcoholStrength, -1, (item == "absinthe" and true or false))
            end,
        }
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000)

        local _hunger = currentValues["hunger"] - math.random(3)
        local _thirst = currentValues["thirst"] - math.random(3)

        if _hunger < 1 then _hunger = 0 end
        if _thirst < 1 then _thirst = 0 end

        if GodEnabled then
            _hunger = 100
            _thirst = 100
        end

        currentValues["hunger"] = _hunger
        currentValues["thirst"] = _thirst
        updateStatus("hunger", _hunger)
        updateStatus("thirst", _thirst)

        if currentValues["thirst"] < 20 or currentValues["hunger"] < 20 then
            local newhealth = GetEntityHealth(PlayerPedId()) - math.random(10)
            SetEntityHealth(PlayerPedId(), newhealth)
        end

        TriggerServerEvent("caue-hud:updateData", GetEntityHealth(PlayerPedId()), GetPedArmour(PlayerPedId()), currentValues["thirst"], currentValues["hunger"])
    end
end)
--[[

    Variables

]]

local clientInventory = {}
local PreviousItemCheck = {}
local justUsed = false
local retardCounter = 0
local lastCounter = 0

local LastUsedItem = 0
local LastUsedItemId = "ciggy"

local validWaterItem = {
    ["oxygentank"] = true,
    ["water"] = true,
    ["vodka"] = true,
    ["beer"] = true,
    ["whiskey"] = true,
    ["coffee"] = true,
    ["fishtaco"] = true,
    ["taco"] = true,
    ["burrito"] = true,
    ["churro"] = true,
    ["hotdog"] = true,
    ["greencow"] = true,
    ["donut"] = true,
    ["eggsbacon"] = true,
    ["icecream"] = true,
    ["mshake"] = true,
    ["sandwich"] = true,
    ["hamburger"] = true,
    ["cola"] = true,
    ["jailfood"] = true,
    ["bleederburger"] = true,
    ["heartstopper"] = true,
    ["torpedo"] = true,
    ["meatfree"] = true,
    ["moneyshot"] = true,
    ["fries"] = true,
    ["slushy"] = true,
    ["frappuccino"] = true,
    ["latte"] = true,
    ["cookie"] = true,
    ["muffin"] = true,
    ["chocolate"] = true,

}

--[[

    Functions

]]

function GetItemInfo(checkslot)
    for i,v in pairs(clientInventory) do
        if (tonumber(v.slot) == tonumber(checkslot)) then
            local info = {["information"] = v.information,["id"] = v.id, ["quality"] = v.quality }
            return info
        end
    end
    return "Sem informação.";
end

function getQuantity(itemid, checkQuality, metaInformation)
    local amount = 0
    for i,v in pairs(clientInventory) do
        local qCheck = not checkQuality or v.quality > 0
        if v.item_id == itemid and qCheck then
            if metaInformation then
                local totalMetaKeys = 0
                local metaFoundCount = 0
                local itemMeta = json.decode(v.information)
                for metaKey, metaValue in pairs(metaInformation) do
                    totalMetaKeys = totalMetaKeys + 1
                    if itemMeta[metaKey] and itemMeta[metaKey] == metaValue then
                        metaFoundCount = metaFoundCount + 1
                    end
                end
                if totalMetaKeys <= metaFoundCount then
                    amount = amount + v.amount
                end
            else
                amount = amount + v.amount
            end
        end
    end
    return amount
end

function hasEnoughOfItem(itemid, amount, shouldReturnText, checkQuality, metaInformation)
    if shouldReturnText == nil then shouldReturnText = true end
    if itemid == nil or itemid == 0 or amount == nil or amount == 0 then
        if shouldReturnText then
            TriggerEvent("DoLongHudText","I don't seem to have " .. itemid .. " with me.",2)
        end
        return false
    end
    amount = tonumber(amount)
    local slot = 0
    local found = false

    if getQuantity(itemid, checkQuality, metaInformation) >= amount then
        return true
    end
    if (shouldReturnText) then
        TriggerEvent("DoLongHudText","I don't have it anymore...",2)
    end
    return false
end

function isValidUseCase(itemID, isWeapon)
    local player = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(player, false)

    if playerVeh ~= 0 then
        local model = GetEntityModel(playerVeh)
        if IsThisModelACar(model) or IsThisModelABike(model) or IsThisModelAQuadbike(model) then
            if IsEntityInAir(playerVeh) then
                Wait(1000)
                if IsEntityInAir(playerVeh) then
                    TriggerEvent("DoLongHudText", "It looks like you're flying.", 2)
                    return false
                end
            end
        end
    end

    if not validWaterItem[itemID] and not isWeapon then
        if IsPedSwimming(player) then
            local targetCoords = GetEntityCoords(player, 0)
            Wait(700)
            local plyCoords = GetEntityCoords(player, 0)
            if #(targetCoords - plyCoords) > 1.3 then
                TriggerEvent("DoLongHudText", "Can't wear this while swimming.", 2)
                return false
            end
        end

        if IsPedSwimmingUnderWater(player) then
            TriggerEvent("DoLongHudText", "Can't use this while submerged.", 2)
            return false
        end
    end

    return true
end

function checkForItems()
    local items = {
        "mobilephone",
        "radio",
        "civradio",
        "megaphone",
        "custommiscitem",
        "musicwalkman",
    }

    for _, item in ipairs(items) do
        local quantity = getQuantity(item)
        local hasItem = quantity >= 1

        if hasItem and not PreviousItemCheck[item] then
            PreviousItemCheck[item] = true
            TriggerEvent("caue-inventory:itemCheck", item, true, quantity)
        elseif not hasItem and PreviousItemCheck[item] then
            PreviousItemCheck[item] = false
            TriggerEvent("caue-inventory:itemCheck", item, false, quantity)
        end
    end
end

function checkForAttachItem()
    local AttatchItems = {
        "stolentv",
        "stolenmusic",
        "stolencoffee",
        "stolenmicrowave",
        "stolencomputer",
        "stolenart",
    }

    local RepairItems = {
        "sfixbrake","sfixaxle","sfixradiator","sfixclutch","sfixtransmission","sfixelectronics","sfixinjector","sfixtire","sfixbody","sfixengine",
        "afixbrake","afixaxle","afixradiator","afixclutch","afixtransmission","afixelectronics","afixinjector","afixtire","afixbody","afixengine",
        "bfixbrake","bfixaxle","bfixradiator","bfixclutch","bfixtransmission","bfixelectronics","bfixinjector","bfixtire","bfixbody","bfixengine",
        "cfixbrake","cfixaxle","cfixradiator","cfixclutch","cfixtransmission","cfixelectronics","cfixinjector","cfixtire","cfixbody","cfixengine",
        "dfixbrake","dfixaxle","dfixradiator","dfixclutch","dfixtransmission","dfixelectronics","dfixinjector","dfixtire","dfixbody","dfixengine",
    }

    local itemToAttach = "none"
    for k,v in pairs(AttatchItems) do
        if getQuantity(v) >= 1 then
            itemToAttach = v
            break
        end
    end

    if itemToAttach == "none" then
        for k,v in pairs(RepairItems) do
            if getQuantity(v) >= 1 then
                itemToAttach = "engine"
                break
            end
        end
    end

    TriggerEvent("animation:carry", itemToAttach, true)
end

function GetCurrentWeapons()
    local returnTable = {}
    for i,v in pairs(clientInventory) do
        if (tonumber(v.item_id)) then
            local t = { ["hash"] = v.item_id, ["id"] = v.id, ["information"] = v.information, ["name"] = v.item_id, ["slot"] = v.slot }
            returnTable[#returnTable+1]=t
        end
    end
    if returnTable == nil then
        return {}
    end
    return returnTable
end

function TaskItem(dictionary, animation, typeAnim, timer, message, func, remove, itemid, playerVeh, itemreturn, itemreturnid, quality)
    loadAnimDict(dictionary)
    TaskPlayAnim(PlayerPedId(), dictionary, animation, 8.0, 1.0, -1, typeAnim, 0, 0, 0, 0)

    local timer = tonumber(timer)
    if timer > 0 then
        local finished = exports["caue-taskbar"]:taskBar(timer, message, true, false, playerVeh)
        if finished == 100 or timer == 0 then
            TriggerEvent(func, quality)

            if remove then
                TriggerEvent("inventory:removeItem", itemid, 1)
            end

            if itemreturn then
                TriggerEvent("player:receiveItem", itemreturnid, 1)
            end
        end
    else
        TriggerEvent(func)
    end

    ClearPedSecondaryTask(PlayerPedId())
end

function AttachPropAndPlayAnimation(dictionary, animation, typeAnim, timer, message, func, remove, itemid, vehicle, prop)
    if prop then
        TriggerEvent("attachItem", prop)
    end

    TaskItem(dictionary, animation, typeAnim, timer, message, func, remove, itemid, vehicle)

    if prop then
        TriggerEvent("destroyProp")
    end
end

--[[

    Exports

]]

exports("GetItemInfo", GetItemInfo)
exports("getQuantity", getQuantity)
exports("hasEnoughOfItem", hasEnoughOfItem)
exports("GetCurrentWeapons", GetCurrentWeapons)
exports("TaskItem", TaskItem)
exports("AttachPropAndPlayAnimation", AttachPropAndPlayAnimation)

--[[

    Events

]]

RegisterNetEvent("current-items")
AddEventHandler("current-items", function(inv)
    clientInventory = inv
    checkForItems()
    checkForAttachItem()
    TriggerEvent("AttachWeapons")
end)

RegisterNetEvent("RunUseItem")
AddEventHandler("RunUseItem", function(itemid, slot, inventoryName, isWeapon, passedItemInfo)
    if itemid == nil then return end

    local ItemInfo = GetItemInfo(slot)

    LastUsedItem = ItemInfo.id
    LastUsedItemId = itemid

    if ItemInfo.quality == nil then return end
    if ItemInfo.quality < 1 then
        TriggerEvent("DoLongHudText","Esse item está quebrado",2)
        if isWeapon then
            TriggerEvent("brokenWeapon")
        end
        return
    end

    if justUsed then
        retardCounter = retardCounter + 1
        if retardCounter > 10 and retardCounter > lastCounter + 5 then
            lastCounter = retardCounter
            TriggerServerEvent("exploiter", "tried to use " .. retardCounter .. " items in < 500ms ")
        end
        return
    end

    justUsed = true

    if (not hasEnoughOfItem(itemid,1,false)) then
        TriggerEvent("DoLongHudText","Looks like you don't have this item...?",2)
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if itemid == "-72657034" then
        TriggerEvent("equipWeaponID", itemid, ItemInfo.information, ItemInfo.id)
        TriggerEvent("inventory:removeItem",itemid, 1)
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if not isValidUseCase(itemid, isWeapon) then
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if itemid == nil then
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    if isWeapon then
        if tonumber(ItemInfo.quality) > 0 then
            TriggerEvent("equipWeaponID", itemid, ItemInfo.information, ItemInfo.id)
        end
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        Wait(1500)
        TriggerEvent("AttachWeapons")
        return
    end

    if itemid == "knuckle_chain" then
        if tonumber(ItemInfo.quality) > 0 then
            local katanaInfo = json.decode(ItemInfo.information)
            katanaInfo.componentVariant = "2"
            local hiddenKeys = katanaInfo._hideKeys or {}
            hiddenKeys[#hiddenKeys + 1] = "componentVariant"
            katanaInfo._hideKeys = hiddenKeys
            TriggerEvent("equipWeaponID","3638508604",json.encode(katanaInfo),ItemInfo.id)
        end
        justUsed = false
        retardCounter = 0
        lastCounter = 0
        return
    end

    TriggerEvent("hud-display-item", itemid, "Used")

    Wait(800)

    local player = PlayerPedId()
    local playerVeh = GetVehiclePedIsIn(player, false)

    local remove = false

    if (itemid == "custommiscitem") then
        -- local info = json.decode(ItemInfo.information)

        -- if info["_type"] == "tvbox" then
        --     TriggerEvent("DoLongHudText", "Essa TV Box esta quebrada! Quem te vendeu isso?")
        -- end
    end

    if (itemid == "idcard") then
        TriggerServerEvent("caue-idcard:show", json.decode(ItemInfo.information))
    end

    if (itemid == "pdbadge") then
        TriggerServerEvent("caue-police:showBadge", json.decode(ItemInfo.information))
    end

    if (itemid == "weedq") then
        local finished = exports["caue-taskbar"]:taskBar(1000,"rolling joints",false,false,playerVeh)
        if (finished == 100) then
            CreateCraftOption("joint", 999, true)
        end
    end

    if (itemid == "codein") then
        CreateCraftOption("lean", 10, true)
    end

    if (itemid == "anfetamina") then
        CreateCraftOption("1gmeta", 10, true)
    end

    if (itemid == "lighter") then
        TriggerEvent("animation:PlayAnimation","lighter")
        local finished = exports["caue-taskbar"]:taskBar(2000,"setting fire",false,false,playerVeh)
    end

    if (itemid == "joint") then
        local finished = exports["caue-taskbar"]:taskBar(2000,"Smoking pot",false,false,playerVeh)
        if (finished == 100) then
            Wait(200)

            if math.random(100) <= 5 then
                TriggerEvent("player:receiveItem","femaleseed",1)
            end

            if math.random(100) <= 2 then
                TriggerEvent("player:receiveItem","maleseed",1)
            end

            TriggerEvent("animation:PlayAnimation", "weed")
            TriggerEvent("Evidence:StateSet",3,600)
            TriggerEvent("Evidence:StateSet",4,600)
            TriggerEvent("fx:run", "weed", 180, -1, false)
            remove = true
        end
    end

    if (itemid == "lean") then
        TriggerEvent("animation:PlayAnimation","drink")
        local finished = exports["caue-taskbar"]:taskBar(3000,"Drinking lean 🥤",false,false,playerVeh)
        if (finished == 100) then
            TriggerEvent("Evidence:StateSet",2,1200)
            TriggerEvent("Evidence:StateSet",24,1200)
            TriggerEvent("fx:run", "metamorphine", 160, -1, true)
            remove = true
        end
    end

    if (itemid == "armor" or itemid == "pdarmor") then
        local finished = exports["caue-taskbar"]:taskBar(5000,"Vest",true,false,playerVeh)
        if (finished == 100) then
            SetPlayerMaxArmour(PlayerId(), 60)

            local wasBeatdown = exports["caue-police"]:getBeatmodeDebuff()

            if not wasBeatdown then
                SetPedArmour(player, 60)
                TriggerEvent("UseBodyArmor")
                remove = true
            else
                TriggerEvent("DoLongHudText","You can't wear a vest, because you're incapacitated..")
            end
        end
    end

    if (itemid == "binoculars") then
        TriggerEvent("binoculars:Activate")
    end

    if (itemid == "camera") then
        TriggerEvent("camera:Activate")
    end

    if (itemid == "megaphone") then
        TriggerEvent("caue-usableprops:megaphone")
    end

    if (itemid == "lockpick") then
        TriggerEvent("caue-inventory:lockpick", false, inventoryName, slot)
    end

    if (itemid == "ciggy") then
        local finished = exports["caue-taskbar"]:taskBar(1000,"Lighting",false,false,playerVeh)
        if (finished == 100) then
            Wait(300)
            TriggerEvent("animation:PlayAnimation","smoke")
        end
    end

    if (itemid == "cigar") then
        local finished = exports["caue-taskbar"]:taskBar(1000,"Lighting",false,false,playerVeh)
        if (finished == 100) then
            Wait(300)
            TriggerEvent("animation:PlayAnimation","cigar")
        end
    end

    if (itemid == "phonebox") then
        local finished = exports["caue-taskbar"]:taskBar(5000,"Opening Box",false,false,playerVeh)
        if (finished == 100) then
            Wait(300)
            TriggerEvent("player:receiveItem", "mobilephone", 1)
            TriggerEvent("player:receiveItem", "phoneboxempty", 1)
            TriggerEvent("animation:PlayAnimation","cigar")
            TriggerEvent("inventory:removeItem","phonebox", 1)
        end
    end

    if (itemid == "1gcocaine") then
        TriggerEvent("attachItemObjectnoanim","drugpackage01")
        TriggerEvent("Evidence:StateSet",2,1200)
        TriggerEvent("Evidence:StateSet",6,1200)
        TaskItem("anim@amb@nightclub@peds@", "missfbi3_party_snort_coke_b_male3", 49, 5000, "Sniffing Cocaine", "hadcocaine", true,itemid,playerVeh)
    end

    if (itemid == "1gmeta") then
        TriggerEvent("attachItemObjectnoanim","crackpipe01")
        TriggerEvent("Evidence:StateSet",2,1200)
        TriggerEvent("Evidence:StateSet",6,1200)
        TaskItem("switch@trevor@trev_smoking_meth", "trev_smoking_meth_loop", 49, 5000, "Using methamphetamine", "hadcrack", true,itemid,playerVeh)
    end

    if (itemid == "IFAK") then
        TaskItem("amb@world_human_clipboard@male@idle_a", "idle_c", 49,2000,"Using IFAK","healed:useOxy",true,itemid,playerVeh)
    end

    TriggerEvent("caue-inventory:itemUsed", itemid, passedItemInfo, inventoryName, slot, ItemInfo.id)
    TriggerServerEvent("caue-inventory:itemUsed", itemid, passedItemInfo, inventoryName, slot, ItemInfo.id)

    if remove then
        TriggerEvent("inventory:removeItem", itemid, 1)
    end

    Wait(500)
    retardCounter = 0
    justUsed = false
end)

RegisterNetEvent("inventory:wepDropCheck")
AddEventHandler("inventory:wepDropCheck", function()
    local weapon = GetSelectedPedWeapon(PlayerPedId())
    if not hasEnoughOfItem(tostring(weapon), 1, false) then
        SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
    end
end)

RegisterNetEvent("inventory:DegenLastUsedItem")
AddEventHandler("inventory:DegenLastUsedItem", function(percent)
    local cid = exports["caue-base"]:getChar("id")
    TriggerServerEvent("inventory:degItem", LastUsedItem, percent, LastUsedItemId, cid)
end)
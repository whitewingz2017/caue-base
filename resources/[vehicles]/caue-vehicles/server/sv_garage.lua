--[[

    Garages

]]

local garagesConfig = {
    ["MRPD"] = {
        ["type"] = "police",
        ["jobGarage"] = true,
        ["pos"] = vector4(437.31, -996.93, 25.3, 90.1),
        ["distance"] = 150,
        ["spaces"] = {
            vector4(445.74, -996.94, 25.3, 269.16),
            vector4(445.57, -994.23, 25.3, 269.26),
            vector4(445.8, -991.49, 25.3, 268.82),
            vector4(445.73, -988.86, 25.3, 269.45),
            vector4(445.73, -986.11, 25.3, 269.32),
            vector4(437.27, -986.16, 25.3, 89.2),
            vector4(437.28, -988.87, 25.3, 91.25),
            vector4(437.41, -991.59, 25.3, 89.96),
            vector4(437.3, -994.28, 25.3, 90.01),
            vector4(437.31, -996.93, 25.3, 90.1),
            vector4(425.71, -997.08, 25.3, 270.01),
            vector4(425.74, -994.41, 25.3, 269.55),
            vector4(425.76, -991.65, 25.3, 270.83),
            vector4(425.82, -988.97, 25.3, 269.8),
            vector4(425.75, -984.27, 25.3, 270.67),
            vector4(425.78, -981.54, 25.3, 269.55),
            vector4(425.88, -978.81, 25.3, 270.18),
            vector4(425.77, -976.13, 25.3, 270.51),
        },
    },
    ["VBPD"] = {
        ["type"] = "cid",
        ["jobGarage"] = true,
        ["pos"] = vector4(-1130.52, -834.87, 3.76, 90.1),
        ["distance"] = 250,
        ["spaces"] = {
            vector4(-1146.52, -865.47, 3.34, 37.46),
            vector4(-1143.08, -862.83, 3.34, 34.93),
            vector4(-1139.67, -860.45, 3.34, 33.76),
            vector4(-1136.14, -858.05, 3.34, 34.78),
            vector4(-1132.87, -855.3, 3.34, 36.77),
            vector4(-1129.82, -852.57, 3.34, 35.78),
            vector4(-1126.83, -849.83, 3.34, 35.99),
            vector4(-1123.07, -847.46, 3.34, 37.96),
            vector4(-1119.84, -844.85, 3.34, 39.09),
            vector4(-1116.4, -842.5, 3.34, 37.5),
            vector4(-1113.28, -840.15, 3.34, 34.75),
            vector4(-1109.93, -837.39, 3.34, 36.14),
            vector4(-1106.42, -835.19, 3.34, 34.81),
            vector4(-1102.69, -833.18, 3.34, 35.52),
            vector4(-1119.97, -809.86, 3.34, 215.43),
            vector4(-1122.96, -812.48, 3.34, 214.8),
            vector4(-1125.92, -815.42, 3.34, 216.04),
            vector4(-1129.46, -817.67, 3.34, 217.58),
            vector4(-1132.79, -820.28, 3.34, 212.69),
            vector4(-1135.93, -822.9, 3.34, 214.18),
            vector4(-1139.23, -825.48, 3.34, 216.1),
            vector4(-1142.77, -827.89, 3.34, 216.59),
            vector4(-1145.89, -830.32, 3.34, 214.58),
            vector4(-1149.53, -832.67, 3.34, 215.74),
            vector4(-1152.95, -835.15, 3.34, 216.44),
            vector4(-1156.51, -837.51, 3.34, 216.84),
            vector4(-1159.37, -840.24, 3.34, 215.2),
            vector4(-1163.32, -842.39, 3.34, 217.75),
            vector4(-1148.04, -848.74, 3.34, 36.48),
            vector4(-1144.64, -846.06, 3.34, 37.88),
            vector4(-1141.0, -844.17, 3.34, 36.27),
            vector4(-1138.29, -841.29, 3.34, 36.12),
            vector4(-1134.34, -839.19, 3.34, 36.44),
            vector4(-1131.7, -836.02, 3.34, 36.35),
            vector4(-1128.3, -833.57, 3.34, 39.06),
            vector4(-1124.98, -831.29, 3.34, 38.53),
            vector4(-1121.6, -828.57, 3.34, 38.69),
            vector4(-1118.08, -826.36, 3.34, 36.81),
        },
    },
    ["Hospital"] = {
        ["type"] = "ems",
        ["jobGarage"] = true,
        ["pos"] = vector4(316.52, -578.24, 28.4, 250.64),
        ["distance"] = 100,
        ["spaces"] = {
            vector4(332.97, -590.6, 28.4, 339.91),
            vector4(329.62, -589.53, 28.4, 341.87),
            vector4(326.34, -588.32, 28.4, 340.95),
            vector4(323.04, -587.06, 28.4, 341.23),
            vector4(319.58, -585.71, 28.4, 340.55),
            vector4(316.52, -578.24, 28.4, 250.64),
            vector4(318.12, -573.93, 28.4, 248.37),
            vector4(319.71, -569.74, 28.4, 249.57),
            vector4(321.05, -565.23, 28.4, 248.56),
        },
    },
    ["LSFD"] = {
        ["type"] = "fire_department",
        ["jobGarage"] = true,
        ["pos"] = vector4(-633.42, -77.89, 39.73, 354.06),
        ["distance"] = 150,
        ["spaces"] = {
            vector4(-641.23, -76.73, 39.72, 354.57),
            vector4(-633.42, -77.89, 39.73, 354.06),
            vector4(-625.4, -79.59, 39.72, 357.03),
        },
    },
    ["Motel"] = {
        ["type"] = "car",
        ["pos"] = vector4(370.36, -1814.68, 28.38, 355.37),
        ["distance"] = 100,
        ["spaces"] = {
            vector4(364.75, -1810.0, 28.37, 354.07),
            vector4(367.55, -1812.43, 28.37, 353.71),
            vector4(370.36, -1814.68, 28.38, 355.37),
            vector4(373.36, -1816.71, 28.41, 354.6),
            vector4(376.23, -1819.04, 28.46, 355.98),
            vector4(379.05, -1822.3, 28.38, 353.87),
        },
    },
}

--[[

    Exports

]]

exports("setGarage", function(pGarage, pVar, pValue, pEdit)
    if not garagesConfig[pGarage] then
        garagesConfig[pGarage] = {}
    end

    if pEdit then
        garagesConfig[pGarage][pVar] = pValue
    else
        garagesConfig[pGarage] = pVar
    end

    TriggerClientEvent("caue-vehicles:setGarage", -1, pGarage, pVar, pValue, pEdit)
end)

exports("getGarage", function(pGarage, pVar)
    return garagesConfig[pGarage][pVar]
end)

--[[

    RPCs

]]

RPC.register("caue-vehicles:requestGarages", function(src)
    return garagesConfig
end)

RPC.register("caue-vehicles:getGarage", function(src, garage)
    local cid = exports["caue-base"]:getChar(src, "id")
    if not cid then return {} end

    local type = garagesConfig[garage]["type"]

    local vehicles = MySQL.query.await([[
        SELECT v2.id, v2.plate, v2.model, v3.body_damage, v3.engine_damage, v3.fuel
        FROM vehicles_garage v1
        INNER JOIN vehicles v2 ON v2.id = v1.vid AND v2.cid = ? AND v2.type = ?
        INNER JOIN vehicles_metadata v3 ON v3.vid = v1.vid
        WHERE garage = ? AND state = "In"
    ]],
    { cid, type, garage })

    return vehicles
end)

RPC.register("caue-vehicles:canStoreVehicle", function(src, garage, vid)
    local typeGarage = garagesConfig[garage]["type"]

    local typeVehicle = MySQL.scalar.await([[
        SELECT type
        FROM vehicles
        WHERE id = ?
    ]],
    { vid })

    if not typeVehicle then
        TriggerClientEvent("DoLongHudText", src, "Error?", 2)
        return false
    end

    if typeVehicle ~= typeGarage then
        TriggerClientEvent("DoLongHudText", src, "You cant store this vehicle here", 2)
        return false
    end

    return true
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    MySQL.update([[
        UPDATE vehicles_garage
        SET state = "In"
        WHERE state = "Out"
    ]])
end)
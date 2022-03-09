Commands["clear"] = {
    ["function"] = function(source, args)
        TriggerClientEvent("chat:clear", source)
    end,
    ["suggestion"] = {
        ["help"] = "Clear chat",
    },
    ["condition"] = {
        ["type"] = "ALL",
        ["params"] = {},
    },
}

Commands["hud"] = {
    ["function"] = function(source, args)
        TriggerClientEvent("caue-hud:settings", source, args)
    end,
    ["suggestion"] = {
        ["help"] = "HUD Settings",
        ["params"] = {
            { name="option", help="toggle | opacity | map"},
            { name="value", help="Toggle: health, armor, hunger, thirst, voice, oxygen | Opacity: 1.0-0.0, default 0.5 | Map: rect, circle"},
        },
    },
    ["condition"] = {
        ["type"] = "ALL",
        ["params"] = {},
    },
}

Commands["cash"] = {
    ["function"] = function(source, args)
        TriggerClientEvent("caue-financials:ui", source, "cash", "view", exports["caue-financials"]:getCash(source))
    end,
    ["suggestion"] = {
        ["help"] = "Check how much cash you have in wallet",
    },
    ["condition"] = {
        ["type"] = "ALL",
        ["params"] = {},
    },
}

-- Commands["bank"] = {
--     ["function"] = function(source, args)
--         local accountId = exports["caue-base"]:getChar(source, "bankid")
--         TriggerClientEvent("caue-financials:ui", source, "bank", "view", exports["caue-financials"]:getBalance(accountId))
--     end,
--     ["suggestion"] = {
--         ["help"] = "Check how much cash you have in bank",
--     },
--     ["condition"] = {
--         ["type"] = "ALL",
--         ["params"] = {},
--     },
-- }

-- Commands["ooc"] = {
--     ["function"] = function(source, args)
--         if args[1] ~= nil then
-- 	        local name = exports["caue-base"]:getChar(source, "first_name") .. " " .. exports["caue-base"]:getChar(source, "last_name")
--             TriggerClientEvent("chatMessage", -1, "OOC " .. name, 2, table.concat(args, " "))
--         else
--             TriggerClientEvent("DoLongHudText", source, "Use /ooc [message]", 2)
--         end
--     end,
--     ["suggestion"] = {
--         ["help"] = "",
--         ["params"] = {},
--     },
--     ["condition"] = {
--         ["type"] = "ALL",
--         ["params"] = {},
--     },
-- }

Commands["me"] = {
    ["function"] = function(source, args)
        if args[1] ~= nil then
	        local name = exports["caue-base"]:getChar(source, "first_name") .. " " .. exports["caue-base"]:getChar(source, "last_name")

            TriggerClientEvent("caue-chat:me", -1, source, name, table.concat(args, " "), GetEntityCoords(GetPlayerPed(source)))
        else
            TriggerClientEvent("DoLongHudText", source, "Use /me [message]", 2)
        end
    end,
    ["suggestion"] = {
        ["help"] = "",
        ["params"] = {},
    },
    ["condition"] = {
        ["type"] = "ALL",
        ["params"] = {},
    },
}

Commands["do"] = {
    ["function"] = function(source, args)
        if args[1] ~= nil then
	        local name = exports["caue-base"]:getChar(source, "first_name") .. " " .. exports["caue-base"]:getChar(source, "last_name")

            TriggerClientEvent("caue-chat:do", -1, source, name, table.concat(args, " "), GetEntityCoords(GetPlayerPed(source)))
        else
            TriggerClientEvent("DoLongHudText", source, "Use /do [message]", 2)
        end
    end,
    ["suggestion"] = {
        ["help"] = "",
        ["params"] = {},
    },
    ["condition"] = {
        ["type"] = "ALL",
        ["params"] = {},
    },
}

Commands["say"] = {
    ["function"] = function(source, args)
        if args[1] ~= nil then
	        local name = exports["caue-base"]:getChar(source, "first_name") .. " " .. exports["caue-base"]:getChar(source, "last_name")

            TriggerClientEvent("caue-chat:say", -1, source, name, table.concat(args, " "), GetEntityCoords(GetPlayerPed(source)))
        else
            TriggerClientEvent("DoLongHudText", source, "Use /say [message]", 2)
        end
    end,
    ["suggestion"] = {
        ["help"] = "",
        ["params"] = {},
    },
    ["condition"] = {
        ["type"] = "ALL",
        ["params"] = {},
    },
}

Commands["drag"] = {
    ["function"] = function(source, args)
        TriggerClientEvent("caue-police:drag", source)
    end,
    ["suggestion"] = {
        ["help"] = "",
    },
    ["condition"] = {
        ["type"] = "ALL",
        ["params"] = {},
    },
}

Commands["911"] = {
    ["function"] = function(source, args)
        if args[1] ~= nil then
	        TriggerClientEvent("caue-dispatch:911", source, table.concat(args, " "))
        else
            TriggerClientEvent("DoLongHudText", source, "Use /911 [message]", 2)
        end
    end,
    ["suggestion"] = {
        ["help"] = "",
        ["params"] = {},
    },
    ["condition"] = {
        ["type"] = "ALL",
        ["params"] = {},
    },
}

Commands["311"] = {
    ["function"] = function(source, args)
        if args[1] ~= nil then
	        TriggerClientEvent("caue-dispatch:311", source, table.concat(args, " "))
        else
            TriggerClientEvent("DoLongHudText", source, "Use /311 [message]", 2)
        end
    end,
    ["suggestion"] = {
        ["help"] = "",
        ["params"] = {},
    },
    ["condition"] = {
        ["type"] = "ALL",
        ["params"] = {},
    },
}

Commands["dispatch"] = {
    ["function"] = function(source, args)
        if args[1] ~= nil then
            TriggerClientEvent("caue-dispatch:manageNotifs", source, args[1])
        else
            TriggerClientEvent("DoLongHudText", source, 'Please choose to have dispatch as "on", "off" or "mute".', 2)
        end
    end,
    ["suggestion"] = {
        ["help"] = "",
        ["params"] = {
            { name="mode", help="on | off | mute"},
        },
    },
    ["condition"] = {
        ["type"] = "JOB",
        ["params"] = { "police", "ems" },
    },
}
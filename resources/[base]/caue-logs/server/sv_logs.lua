LOGS = {
    --[[

        Connect And Disconnect

    ]]

    ["connect"] = {
        ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/941014929778016269/4_2tA8A-0ZlptOHpRDdP4hG9KNJOreasiE6fq4Vj3KGswvWfFvuvU6xjiAyOoB4w9dK2",
        ["DISCORD_NAME"] = "Connect And Disconnect Logs",
        ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
        ["DISCORD_TITLE"] = "Connect",
        ["DISCORD_COLOR"] = 65280,

        ["FUNCTION"] = function(type, src)
            local ids = GetIds(src)

            local embed = {
                {
                    ["color"] = LOGS[type]["DISCORD_COLOR"],
                    ["title"] = "**" .. GetPlayerName(src) .. "** has joined the server",
                    ["description"] = "**Server ID:** " .. src .. "\n**Steam HEX:** " .. ids["hex"] .. "\n**Steam ID:** " .. ids["steamid"] .. "\n**Discord ID:** " .. ids["discord"] .. "\n**IP:** " .. ids["ip"],
                    ["footer"] = {
                        ["text"] = os.date('%d/%m/%Y %H:%M:%S', os.time())
                    },
                }
            }

            PerformHttpRequest(
                LOGS[type]["DISCORD_WEBHOOK"],
                function(err, text, headers) end,
                "POST",
                json.encode({
                    username = LOGS[type]["DISCORD_NAME"],
                    embeds = embed,
                    avatar_url = LOGS[type]["DISCORD_IMAGE"],
                }),
                {["Content-Type"] = "application/json"}
            )
        end,
    },
    ["disconnect"] = {
        ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/941014929778016269/4_2tA8A-0ZlptOHpRDdP4hG9KNJOreasiE6fq4Vj3KGswvWfFvuvU6xjiAyOoB4w9dK2",
        ["DISCORD_NAME"] = "Connect And Disconnect Logs",
        ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
        ["DISCORD_TITLE"] = "Disconnect",
        ["DISCORD_COLOR"] = 16711680,

        ["FUNCTION"] = function(type, src)
            local ids = GetIds(src)

            local embed = {
                {
                    ["color"] = LOGS[type]["DISCORD_COLOR"],
                    ["title"] = "**" .. GetPlayerName(src) .. "** has left the server",
                    ["description"] = "**Server ID:** " .. src .. "\n**Steam HEX:** " .. ids["hex"] .. "\n**Steam ID:** " .. ids["steamid"] .. "\n**Discord ID:** " .. ids["discord"] .. "\n**IP:** " .. ids["ip"],
                    ["footer"] = {
                        ["text"] = os.date('%d/%m/%Y %H:%M:%S', os.time())
                    },
                }
            }

            PerformHttpRequest(
                LOGS[type]["DISCORD_WEBHOOK"],
                function(err, text, headers) end,
                "POST",
                json.encode({
                    username = LOGS[type]["DISCORD_NAME"],
                    embeds = embed,
                    avatar_url = LOGS[type]["DISCORD_IMAGE"],
                }),
                {["Content-Type"] = "application/json"}
            )
        end,
    },

    --[[

        Characters

    ]]

    ["character-create"] = {
        ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/941015536224047104/iMP21mFmAaF64hv7laRBn2NDgpv3WsNzpPgcscW2tu4B8En3SSUnYHYZBtEji3Je0uv_",
        ["DISCORD_NAME"] = "Characters Logs",
        ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
        ["DISCORD_TITLE"] = "Created",
        ["DISCORD_COLOR"] = 65280,

        ["FUNCTION"] = function(type, src, dbid)
            local ids = GetIds(src)

            local char = MySQL.single.await([[
                SELECT first_name, last_name, gender, dob, phone
                FROM characters
                WHERE id = ?
            ]],
            { dbid })

            local gender = "Male"
            if char["gender"] == 1 then
                gender = "Female"
            end

            local embed = {
                {
                    ["color"] = LOGS[type]["DISCORD_COLOR"],
                    ["title"] = "**" .. char["first_name"] .. " " .. char["last_name"] .. "** has been created",
                    ["description"] = "**Steam HEX:** " .. ids["hex"] .. "\n**Steam ID:** " .. ids["steamid"] .. "\n**Discord ID:** " .. ids["discord"] .. "\n**Char ID:** " .. dbid .. "\n**Gender:** " .. gender .. "\n**DOB:** " .. char["dob"] .. "\n**Phone:** " .. char["phone"],
                    ["footer"] = {
                        ["text"] = os.date('%d/%m/%Y %H:%M:%S', os.time())
                    },
                }
            }

            PerformHttpRequest(
                LOGS[type]["DISCORD_WEBHOOK"],
                function(err, text, headers) end,
                "POST",
                json.encode({
                    username = LOGS[type]["DISCORD_NAME"],
                    embeds = embed,
                    avatar_url = LOGS[type]["DISCORD_IMAGE"],
                }),
                {["Content-Type"] = "application/json"}
            )
        end,
    },
    ["character-delete"] = {
        ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/941015536224047104/iMP21mFmAaF64hv7laRBn2NDgpv3WsNzpPgcscW2tu4B8En3SSUnYHYZBtEji3Je0uv_",
        ["DISCORD_NAME"] = "Characters Logs",
        ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
        ["DISCORD_TITLE"] = "Deleted",
        ["DISCORD_COLOR"] = 16711680,

        ["FUNCTION"] = function(type, src, dbid)
            local ids = GetIds(src)

            local char = MySQL.single.await([[
                SELECT first_name, last_name
                FROM characters
                WHERE id = ?
            ]],
            { dbid })

            local embed = {
                {
                    ["color"] = LOGS[type]["DISCORD_COLOR"],
                    ["title"] = "**" .. char["first_name"] .. " " .. char["last_name"] .. "** has been deleted",
                    ["description"] = "**Steam HEX:** " .. ids["hex"] .. "\n**Steam ID:** " .. ids["steamid"] .. "\n**Discord ID:** " .. ids["discord"] .. "\n**Char ID:** " .. dbid,
                    ["footer"] = {
                        ["text"] = os.date('%d/%m/%Y %H:%M:%S', os.time())
                    },
                }
            }

            PerformHttpRequest(
                LOGS[type]["DISCORD_WEBHOOK"],
                function(err, text, headers) end,
                "POST",
                json.encode({
                    username = LOGS[type]["DISCORD_NAME"],
                    embeds = embed,
                    avatar_url = LOGS[type]["DISCORD_IMAGE"],
                }),
                {["Content-Type"] = "application/json"}
            )
        end,
    },

    --[[

        Bank

    ]]

    ["deposit"] = {
        ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/941016081806540870/y5DHXWssDg34eWywBkcdpKuhFkJf2VI67hMV0PTLk_WYScydt0noIFoh0lhsYFp2oOfm",
        ["DISCORD_NAME"] = "Bank Logs",
        ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
        ["DISCORD_TITLE"] = "Deposit",
        ["DISCORD_COLOR"] = 65280,

        ["FUNCTION"] = function(type, src, amount, cash, bank, comment, uid, accountid)
            local char = exports["caue-base"]:getChar(src)
            if not char then return end

            local ids = GetIds(src)

            local embed = {
                {
                    ["color"] = LOGS[type]["DISCORD_COLOR"],
                    ["title"] = "**" .. char["first_name"] .. " " .. char["last_name"] .. "** deposit **$" .. amount .. "** to account **" .. accountid .. "**",
                    ["description"] = "**Transaction ID:** " .. uid .. "\n**Comment:** " .. comment .. "\n\n**Server ID:** " .. src .. "\n**Steam HEX:** " .. ids["hex"] .. "\n**Char ID:** " .. char["id"] .. "\n**Cash:** $" .. (cash - amount) .. "\n**Bank:** $" .. (bank + amount),
                    ["footer"] = {
                        ["text"] = os.date('%d/%m/%Y %H:%M:%S', os.time())
                    },
                }
            }

            PerformHttpRequest(
                LOGS[type]["DISCORD_WEBHOOK"],
                function(err, text, headers) end,
                "POST",
                json.encode({
                    username = LOGS[type]["DISCORD_NAME"],
                    embeds = embed,
                    avatar_url = LOGS[type]["DISCORD_IMAGE"],
                }),
                {["Content-Type"] = "application/json"}
            )
        end,
    },
    ["withdraw"] = {
        ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/941016187490402325/SqRRyWu6xma197-Pp4ChddLVsb9CxqtFflv9z82dibt9tBKk2KtqgPNmKs40kgJBOHxi",
        ["DISCORD_NAME"] = "Bank Logs",
        ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
        ["DISCORD_TITLE"] = "Withdraw",
        ["DISCORD_COLOR"] = 16711680,

        ["FUNCTION"] = function(type, src, amount, cash, bank, comment, uid, accountid)
            local char = exports["caue-base"]:getChar(src)
            if not char then return end

            local ids = GetIds(src)

            local embed = {
                {
                    ["color"] = LOGS[type]["DISCORD_COLOR"],
                    ["title"] = "**" .. char["first_name"] .. " " .. char["last_name"] .. "** withdraw **$" .. amount .. "** from account **" .. accountid .. "**",
                    ["description"] = "**Transaction ID:** " .. uid .. "\n**Comment:** " .. comment .. "\n\n**Server ID:** " .. src .. "\n**Steam HEX:** " .. ids["hex"] .. "\n**Char ID:** " .. char["id"] .. "\n**Cash:** $" .. (cash + amount) .. "\n**Bank:** $" .. (bank - amount),
                    ["footer"] = {
                        ["text"] = os.date('%d/%m/%Y %H:%M:%S', os.time())
                    },
                }
            }

            PerformHttpRequest(
                LOGS[type]["DISCORD_WEBHOOK"],
                function(err, text, headers) end,
                "POST",
                json.encode({
                    username = LOGS[type]["DISCORD_NAME"],
                    embeds = embed,
                    avatar_url = LOGS[type]["DISCORD_IMAGE"],
                }),
                {["Content-Type"] = "application/json"}
            )
        end,
    },
    ["transfer"] = {
        ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/941016280658497576/N-Gw7-o6HK61N_grYrx6j6aUW1MGXrZYRA9CpZtAQAd4yqCaoZpH1Il28LYQ3pMzTpPO",
        ["DISCORD_NAME"] = "Bank Logs",
        ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
        ["DISCORD_TITLE"] = "Transfer",
        ["DISCORD_COLOR"] = 36095,

        ["FUNCTION"] = function(type, src, amount, senderbank, receiverbank, comment, uid, sender, receiver)
            local char = exports["caue-base"]:getChar(src)
            if not char then return end

            local ids = GetIds(src)

            local embed = {
                {
                    ["color"] = LOGS[type]["DISCORD_COLOR"],
                    ["title"] = "**" .. char["first_name"] .. " " .. char["last_name"] .. "** transfer **$" .. amount .. "** from account **" .. sender .. "** to account **" .. receiver .. "**",
                    ["description"] = "**Transaction ID:** " .. uid .. "\n**Comment:** " .. comment .. "\n\n**Server ID:** " .. src .. "\n**Steam HEX:** " .. ids["hex"] .. "\n**Char ID:** " .. char["id"] .. "\n**Sender Bank:** $" .. (senderbank - amount) .. "\n**Receiver Bank:** $" .. (receiverbank + amount),
                    ["footer"] = {
                        ["text"] = os.date('%d/%m/%Y %H:%M:%S', os.time())
                    },
                }
            }

            PerformHttpRequest(
                LOGS[type]["DISCORD_WEBHOOK"],
                function(err, text, headers) end,
                "POST",
                json.encode({
                    username = LOGS[type]["DISCORD_NAME"],
                    embeds = embed,
                    avatar_url = LOGS[type]["DISCORD_IMAGE"],
                }),
                {["Content-Type"] = "application/json"}
            )
        end,
    },

    --[[

        Groups

    ]]
    ["groupRank"] = {
        ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/941024642146131998/kZrKXJk_R-ZapOBhnGNiCijsUFXhjHXWW4o8duqWrBrPir_Eror-gb__Tk7ykIqTzmpq",
        ["DISCORD_NAME"] = "Groups Logs",
        ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
        ["DISCORD_TITLE"] = "Changed Rank",
        ["DISCORD_COLOR"] = 36095,

        ["FUNCTION"] = function(type, src, giverrank, to, tosid, currentrank, rank, group)
            local char = exports["caue-base"]:getChar(src)
            if not char then return end

            local ids = GetIds(src)

            local tochar = MySQL.single.await([[
                SELECT hex, first_name, last_name
                FROM characters
                WHERE id = ?
            ]],
            { to })

            local groupName = exports["caue-groups"]:groupName(group)

            local embed = {
                {
                    ["color"] = LOGS[type]["DISCORD_COLOR"],
                    ["title"] = "**" .. char["first_name"] .. " " .. char["last_name"] .. "** change **" .. tochar["first_name"] .. " " .. tochar["last_name"] .. "** rank to **" .. rank .. "**",
                    ["description"] = "**Group:** " .. groupName .. "\n**Giver Rank:** " .. giverrank .. "\n**Old Rank:** " .. currentrank .. "\n\n**Server ID:** " .. src .. "\n**Steam HEX:** " .. ids["hex"] .. "\n**Char ID:** " .. char["id"] .. "\n\n**Server ID:** " .. tosid .. "\n**Steam HEX:** " .. tochar["hex"] .. "\n**Char ID:** " .. to,
                    ["footer"] = {
                        ["text"] = os.date('%d/%m/%Y %H:%M:%S', os.time())
                    },
                }
            }

            PerformHttpRequest(
                LOGS[type]["DISCORD_WEBHOOK"],
                function(err, text, headers) end,
                "POST",
                json.encode({
                    username = LOGS[type]["DISCORD_NAME"],
                    embeds = embed,
                    avatar_url = LOGS[type]["DISCORD_IMAGE"],
                }),
                {["Content-Type"] = "application/json"}
            )
        end,
    },

    --[[

        Vehicle Shops

    ]]
    ["vehicleShop"] = {
        ["DISCORD_WEBHOOK"] = "https://discord.com/api/webhooks/941024940101091378/PrZNVZzjN2t3mHZ7l2e6rpJdVcVUDXuB-QGGQhgLK8zjom4b4Yi78m7o5znxb61oXF_e",
        ["DISCORD_NAME"] = "Vehicle Shop Logs",
        ["DISCORD_IMAGE"] = "https://i.pinimg.com/736x/76/b5/9f/76b59f362b7f2d57bc6539b37cb54985.jpg",
        ["DISCORD_TITLE"] = "Vehicle Shop",
        ["DISCORD_COLOR"] = 65280,

        ["FUNCTION"] = function(type, vid, model, price, financed, commission, tax, shop, buyer, seller)
            local embed = {
                {
                    ["color"] = LOGS[type]["DISCORD_COLOR"],
                    ["title"] = "**" .. buyer .. "** buyed **" .. model .. "**",
                    ["description"] = "**Vehicle ID:** " .. vid .. "\n**Price:** $" .. price .. "\n**Financed:** " .. financed .. "\n**Shop:** " .. shop .. "\n**Tax:** $" .. tax .. "\n**Seller:** " .. seller .. "\n**Commission:** $" .. commission,
                    ["footer"] = {
                        ["text"] = os.date('%d/%m/%Y %H:%M:%S', os.time())
                    },
                }
            }

            PerformHttpRequest(
                LOGS[type]["DISCORD_WEBHOOK"],
                function(err, text, headers) end,
                "POST",
                json.encode({
                    username = LOGS[type]["DISCORD_NAME"],
                    embeds = embed,
                    avatar_url = LOGS[type]["DISCORD_IMAGE"],
                }),
                {["Content-Type"] = "application/json"}
            )
        end,
    },
}

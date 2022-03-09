RegisterNetEvent("caue-idcard:show", function(pInfo)
    local src = source

	local cid = pInfo["ID"]
    local name = pInfo["Nome"] .. " " .. pInfo["Sobrenome"]
    local dob = pInfo["Data de Nascimento"]
    local gender = pInfo["Sexo"]

    local image = MySQL.scalar.await([[
        SELECT image
        FROM mdt_profiles
        WHERE cid = ?
    ]],
    { cid })

    if not image then
        image = "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/434px-Unknown_person.jpg"
    end

    local coords = GetEntityCoords(GetPlayerPed(src))
	local players = exports["caue-infinity"]:GetNerbyPlayers(coords, 5)

	for i, v in ipairs(players) do
        TriggerClientEvent("caue-idcard:open", v, name, dob, gender, cid, image)
    end
end)
--[[

    Functions

]]

function GetClosestPlayers(coords, distance)
    local players = {}
    local currentID = PlayerId()
    for _, playerID in ipairs(GetActivePlayers()) do
        local playerCoords = GetEntityCoords(GetPlayerPed(playerID))
        if #(coords - playerCoords) <= distance and playerID ~= currentID then
            table.insert(players, GetPlayerServerId(playerID))
        end
    end
    return players
end

function CreateNewForm(aDocument)
    aDocument.headerFirstName = exports["caue-base"]:getChar("first_name")
    aDocument.headerLastName = exports["caue-base"]:getChar("last_name")
    aDocument.headerDateOfBirth = exports["caue-base"]:getChar("dob")
    aDocument.headerJobLabel = aDocument.job or exports["caue-jobs"]:jobName(exports["caue-base"]:getChar("job"))

    if aDocument.job then
        aDocument.job = nil
    end

    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "createNewForm",
        data = aDocument
    })
end

function ViewDocument(aDocument)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "ShowDocument",
        data = aDocument,
    })
end

function ShowDocument(aDocument)
    local players = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 2.0)

    for i, v in ipairs(players) do
        TriggerServerEvent("caue-documents:showDocument", v, aDocument)
    end

    TriggerEvent("DoLongHudText", "Documento mostrado para " .. #players .. " player(s)")
end

function CopyDocument(aDocument)
    local players = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 2.0)

    for i, v in ipairs(players) do
        TriggerServerEvent("caue-documents:copyDocument", v, aDocument)
    end

    TriggerEvent("DoLongHudText", "Documento copiado para " .. #players .. " player(s)")
end

function DeleteDocument(id)
    if not id then return end

    local deleted = RPC.execute("caue-documents:deleteDocument", id)
    if deleted then
        TriggerEvent("caue-documents:openDocuments")
    end
end

--[[

    Events

]]

RegisterNetEvent("caue-documents:openDocuments")
AddEventHandler("caue-documents:openDocuments", function()
    local data = {}

    local publicdocuments = {}
    for i, v in ipairs(Config["Documents"]["public"]) do
        table.insert(publicdocuments, {
            title = v.headerTitle,
            description = "",
            action = "caue-documents:CreateNewForm",
            params = v,
        })
    end

    table.insert(data, {
        title = "Documentos públicos",
        description = "",
        children = publicdocuments,
    })

    local job = exports["caue-base"]:getChar("job")
    if Config["Documents"]["Jobs"][job] then
        local jobdocuments = {}
        for i, v in ipairs(Config["Documents"]["Jobs"][job]) do
            table.insert(jobdocuments, {
                title = v.headerTitle,
                description = "",
                action = "caue-documents:CreateNewForm",
                params = v,
            })
        end

        table.insert(data, {
            title = "Documentos de Trabalho",
            description = "",
            children = jobdocuments,
        })
    end

    local mydocuments = {}
    local _mydocuments = RPC.execute("caue-documents:getDocuments", "cid", exports["caue-base"]:getChar("id"))
    for i, v in ipairs(_mydocuments) do
        local actions = {
            { title = "Ver", action = "caue-documents:ViewDocument", params = v.data },
            { title = "Mostrar", action = "caue-documents:ShowDocument", params = v.data },
            { title = "Dar cópia", action = "caue-documents:CopyDocument", params = v.data },
            { title = "Deletar", children = {
                { title = "Confirmar exclusão", action = "caue-documents:DeleteDocument", params = v.id },
            } },
        }

        table.insert(mydocuments, {
            title = v.data.headerTitle,
            description = "Date: " .. v.data.headerDateCreated,
            children = actions,
        })
    end

    table.insert(data, {
        title = "Meus documentos pessoais",
        description = "",
        children = mydocuments,
    })

    local groups = exports["caue-base"]:getChar("groups")
    if #groups > 0 then
        local _groups = {}
        for i, v in ipairs(groups) do
            local groupdocuments = {}
            local _groupdocuments = RPC.execute("caue-documents:getDocuments", "group", v.group)
            for i2, v2 in ipairs(_groupdocuments) do
                local actions = {
                    { title = "Ver", action = "caue-documents:ViewDocument", params = v2.data },
                    { title = "Mostrar", action = "caue-documents:ShowDocument", params = v2.data },
                    { title = "Dar cópia", action = "caue-documents:CopyDocument", params = v2.data },
                }

                if exports["caue-groups"]:GroupRankInfo(v.group, "documents") then
                    table.insert(actions, {
                        title = "Deletar", children = {
                            { title = "Confirmar exclusão", action = "caue-documents:DeleteDocument", params = v2.id },
                        }
                    })
                end

                table.insert(groupdocuments, {
                    title = v2.data.headerTitle,
                    description = "Date: " .. v2.data.headerDateCreated,
                    children = actions,
                })
            end

            table.insert(_groups, {
                title = v.name,
                description = "",
                children = groupdocuments,
            })
        end

        table.insert(data, {
            title = "Meu grupo de documentos",
            description = "",
            children = _groups,
        })
    end

    exports["caue-context"]:showContext(data)
end)

RegisterNetEvent("caue-documents:CreateNewForm")
AddEventHandler("caue-documents:CreateNewForm", CreateNewForm)

RegisterNetEvent("caue-documents:ViewDocument")
AddEventHandler("caue-documents:ViewDocument", ViewDocument)

RegisterNetEvent("caue-documents:ShowDocument")
AddEventHandler("caue-documents:ShowDocument", ShowDocument)

RegisterNetEvent("caue-documents:CopyDocument")
AddEventHandler("caue-documents:CopyDocument", CopyDocument)

RegisterNetEvent("caue-documents:DeleteDocument")
AddEventHandler("caue-documents:DeleteDocument", DeleteDocument)

--[[

    NUI

]]

RegisterNUICallback("form_close", function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback("form_submit", function(data, cb)
    SetNuiFocus(false, false)

    local callback = nil
    if data.callback then
        callback = data.callback
        data.callback = nil
    end

    local cid = exports["caue-base"]:getChar("id")
    local group = nil

    if data.group then
        group = data.group
        data.group = nil
    end

    for i, v in ipairs(data.elements) do
        v.can_be_edited = false
    end

    RPC.execute("caue-documents:submitDocument", data, cid, group)

    if callback then
        TriggerEvent(callback.event, callback.params)
    end
end)
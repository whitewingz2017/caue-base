local GeneralEntries, SubMenu = MenuEntries["general"], {}

local Blips = {
    {
        id = "blips:clothing",
        title = "Roupas",
        icon = "#blips-clothing",
        event = "caue-blips:update",
        parameters = "clothing",
    },
    {
        id = "blips:barber",
        title = "Barbeiro",
        icon = "#blips-barber",
        event = "caue-blips:update",
        parameters = "barber",
    },
    {
        id = "blips:tattoo",
        title = "Tatuagem",
        icon = "#blips-tattoo",
        event = "caue-blips:update",
        parameters = "tattoo",
    },
    {
        id = "blips:bank",
        title = "Banco",
        icon = "#blips-bank",
        event = "caue-blips:update",
        parameters = "bank",
    },
    {
        id = "blips:gas",
        title = "Postos",
        icon = "#blips-gas",
        event = "caue-blips:update",
        parameters = "gas",
    },
    {
        id = "blips:pd",
        title = "Departamento Policial",
        icon = "#blips-pd",
        event = "caue-blips:update",
        parameters = "pd",
    },
    {
        id = "blips:hospital",
        title = "Hospital",
        icon = "#blips-hospital",
        event = "caue-blips:update",
        parameters = "hospital",
    },
    {
        id = "blips:market",
        title = "Mercados",
        icon = "#blips-market",
        event = "caue-blips:update",
        parameters = "market",
    },
    {
        id = "blips:ammunation",
        title = "Ammunation",
        icon = "#blips-ammunation",
        event = "caue-blips:update",
        parameters = "ammunation",
    },
    {
        id = "blips:garage",
        title = "Garagem",
        icon = "#blips-garage",
        event = "caue-blips:update",
        parameters = "garage",
    },
    {
        id = "blips:misc",
        title = "Misc",
        icon = "#blips-misc",
        event = "caue-blips:update",
        parameters = "misc",
    },
}

Citizen.CreateThread(function()
    for index, data in ipairs(Blips) do
        SubMenu[index] = data.id
        MenuItems[data.id] = {data = data}
    end

    GeneralEntries[#GeneralEntries+1] = {
        data = {
            id = "blips",
            icon = "#blips",
            title = "Blips"
        },
        subMenus = SubMenu,
        isEnabled = function()
            return not exports["caue-base"]:getVar("dead")
        end,
    }
end)


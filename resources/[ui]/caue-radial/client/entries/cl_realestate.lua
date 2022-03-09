local RealEstateEntries, SubMenu = MenuEntries["realestate"], {}

local RealEstate = {
    {
        id = "real-estate-sell",
        title = "Vender Propiedade",
        icon = "#real-estate-sell",
        event = "caue-housing:sell",
    },
    {
        id = "real-estate-blips",
        title = "Ativar Blips",
        icon = "#real-estate-blips",
        event = "caue-housing:blips",
    },
}

Citizen.CreateThread(function()
    for index, data in ipairs(RealEstate) do
        SubMenu[index] = data.id
        MenuItems[data.id] = {data = data}
    end

    RealEstateEntries[#RealEstateEntries+1] = {
        data = {
          id = "real_estate",
          icon = "#real-estate",
          title = "Real Estate",
        },
        subMenus = SubMenu,
        isEnabled = function ()
            return not exports["caue-base"]:getVar("dead") and CurrentJob == "real_estate"
        end,
    }
end)


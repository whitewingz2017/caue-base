local GeneralEntries, SubMenu = MenuEntries["general"], {}

local Animations = {
    {
        id = "animations:arrogant",
        title = "Arrogante",
        icon = "#animation-arrogant",
        event = "Animation:Set:Gait",
        parameters = { "move_f@arrogant@a" }
    },
    {
        id = "animations:casual",
        title = "Casual",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { "move_m@casual@a" }
    },
    {
        id = "animations:casual2",
        title = "Casual 2",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { "move_m@casual@b" }
    },
    {
        id = "animations:casual3",
        title = "Casual 3",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { "move_m@casual@c" }
    },
    {
        id = "animations:casual4",
        title = "Casual 4",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { "move_m@casual@d" }
    },
    {
        id = "animations:casual5",
        title = "Casual 5",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { "move_m@casual@e" }
    },
    {
        id = "animations:casual6",
        title = "Casual 6",
        icon = "#animation-casual",
        event = "Animation:Set:Gait",
        parameters = { "move_m@casual@f" }
    },
    {
        id = "animations:confident",
        title = "Confiante",
        icon = "#animation-confident",
        event = "Animation:Set:Gait",
        parameters = { "move_m@confident" }
    },
    {
        id = "animations:business",
        title = "Empresario",
        icon = "#animation-business",
        event = "Animation:Set:Gait",
        parameters = { "move_m@business@a" }
    },
    {
        id = "animations:business2",
        title = "Empresario 2",
        icon = "#animation-business",
        event = "Animation:Set:Gait",
        parameters = { "move_m@business@b" }
    },
    {
        id = "animations:business3",
        title = "Empresario 3",
        icon = "#animation-business",
        event = "Animation:Set:Gait",
        parameters = { "move_m@business@c" }
    },

    {
        id = "animations:femme",
        title = "Femme",
        icon = "#animation-female",
        event = "Animation:Set:Gait",
        parameters = { "move_f@femme@" }
    },
    {
        id = "animations:flee",
        title = "Flee",
        icon = "#animation-flee",
        event = "Animation:Set:Gait",
        parameters = { "move_f@flee@a" }
    },
    {
        id = "animations:gangster",
        title = "Gangsta",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { "move_m@gangster@generic" }
    },
    {
        id = "animations:gangster2",
        title = "Gangsta 2",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { "move_m@gangster@ng" }
    },
    {
        id = "animations:gangster3",
        title = "Gangsta 3",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { "move_m@gangster@var_e" }
    },
    {
        id = "animations:gangster4",
        title = "Gangsta 4",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { "move_m@gangster@var_f" }
    },
    {
        id = "animations:gangster5",
        title = "Gangsta 5",
        icon = "#animation-gangster",
        event = "Animation:Set:Gait",
        parameters = { "move_m@gangster@var_i" }
    },
    {
        id = "animations:heels",
        title = "Salto",
        icon = "#animation-female",
        event = "Animation:Set:Gait",
        parameters = { "move_f@heels@c" }
    },
    {
        id = "animations:heels2",
        title = "Salto 2",
        icon = "#animation-female",
        event = "Animation:Set:Gait",
        parameters = { "move_f@heels@d" }
    },
    {
        id = "animations:hiking",
        title = "Escalada",
        icon = "#animation-hiking",
        event = "Animation:Set:Gait",
        parameters = { "move_m@hiking" }
    },
    {
        id = "animations:muscle",
        title = "Musculoso",
        icon = "#animation-tough",
        event = "Animation:Set:Gait",
        parameters = { "move_m@muscle@a" }
    },
    {
        id = "animations:quick",
        title = "Apressado",
        icon = "#animation-quick",
        event = "Animation:Set:Gait",
        parameters = { "move_m@quick" }
    },
    {
        id = "animations:wide",
        title = "Largo",
        icon = "#animation-wide",
        event = "Animation:Set:Gait",
        parameters = { "move_m@bag" }
    },
    {
        id = "animations:scared",
        title = "Assustado",
        icon = "#animation-scared",
        event = "Animation:Set:Gait",
        parameters = { "move_f@scared" }
    },
    {
        id = "animations:brave",
        title = "Corajoso",
        icon = "#animation-brave",
        event = "Animation:Set:Gait",
        parameters = { "move_m@brave" }
    },
    {
        id = "animations:tipsy",
        title = "Oferecido",
        icon = "#animation-tipsy",
        event = "Animation:Set:Gait",
        parameters = { "move_m@drunk@slightlydrunk" }
    },
    {
        id = "animations:injured",
        title = "Machucado",
        icon = "#animation-injured",
        event = "Animation:Set:Gait",
        parameters = { "move_m@injured" }
    },
    {
        id = "animations:tough",
        title = "Durão",
        icon = "#animation-tough",
        event = "Animation:Set:Gait",
        parameters = { "move_m@tough_guy@" }
    },
    {
        id = "animations:sassy",
        title = "Petulante",
        icon = "#animation-sassy",
        event = "Animation:Set:Gait",
        parameters = { "move_m@sassy" }
    },
    {
        id = "animations:sad",
        title = "Triste",
        icon = "#animation-sad",
        event = "Animation:Set:Gait",
        parameters = { "move_m@sad@a" }
    },
    {
        id = "animations:posh",
        title = "Posh",
        icon = "#animation-posh",
        event = "Animation:Set:Gait",
        parameters = { "move_m@posh@" }
    },
    {
        id = "animations:alien",
        title = "Alien",
        icon = "#animation-alien",
        event = "Animation:Set:Gait",
        parameters = { "move_m@alien" }
    },
    {
        id = "animations:nonchalant",
        title = "Nonchalant",
        icon = "#animation-nonchalant",
        event = "Animation:Set:Gait",
        parameters = { "move_m@non_chalant" }
    },
    {
        id = "animations:hobo",
        title = "Mendigo",
        icon = "#animation-hobo",
        event = "Animation:Set:Gait",
        parameters = { "move_m@hobo@a" }
    },
    {
        id = "animations:money",
        title = "Dinheiro",
        icon = "#animation-money",
        event = "Animation:Set:Gait",
        parameters = { "move_m@money" }
    },
    {
        id = "animations:swagger",
        title = "Estiloso",
        icon = "#animation-swagger",
        event = "Animation:Set:Gait",
        parameters = { "move_m@swagger" }
    },
    {
        id = "animations:shady",
        title = "Suspeito",
        icon = "#animation-shady",
        event = "Animation:Set:Gait",
        parameters = { "move_m@shadyped@a" }
    },
    {
        id = "animations:maneater",
        title = "Man Eater",
        icon = "#animation-maneater",
        event = "Animation:Set:Gait",
        parameters = { "move_f@maneater" }
    },
    {
        id = "animations:chichi",
        title = "ChiChi",
        icon = "#animation-chichi",
        event = "Animation:Set:Gait",
        parameters = { "move_f@chichi" }
    },
    {
        id = "animations:default",
        title = "Padrao",
        icon = "#animation-default",
        event = "AnimSet:default"
    }
}

-- Citizen.CreateThread(function()
--     for index, data in ipairs(Animations) do
--         SubMenu[index] = data.id
--         MenuItems[data.id] = {data = data}
--     end
--     GeneralEntries[#GeneralEntries+1] = {
--         data = {
--             id = "animations",
--             icon = "#walking",
--             title = "Gait",
--         },
--         subMenus = SubMenu,
--         isEnabled = function()
--             return not exports["caue-base"]:getVar("dead")
--         end,
--     }
-- end)
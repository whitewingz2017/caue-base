MenuData = {
    property_check = {
        {
            title = "Propriedade",
            description = "Propriedade perdida",
            children = {
                { title = "Yes", action = "caue-housing:handler", params = { forfeit = true, type = "forfeit"} },
                { title = "No", action = "caue-housing:handler", params = { forfeit = false, type = "forfeit" } },
            }
        }
    },
    crafting_check = {
        {
            title = "Crafting",
            description = "Remover Inventário",
            children = {
                { title = "Yes", action = "caue-housing:handler", params = { remove = true, type = "removeInv"} },
                { title = "No", action = "caue-housing:handler", params = { remove = false, type = "removeInv" } },
            }
        }
    },
    inventory_check = {
        {
            title = "Inventário",
            description = "Remover Craft",
            children = {
                { title = "Yes", action = "caue-housing:handler", params = { remove = true, type = "removeCraft"} },
                { title = "No", action = "caue-housing:handler", params = { remove = false, type = "removeCraft" } },
            }
        }
    }
}

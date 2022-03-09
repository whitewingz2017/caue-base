MenuData = {
    apartment_check = {
        {
            title = "Apartment",
            description = "Forclose Apartment",
            children = {
                { title = "Yes", action = "caue-apartments:handler", params = { forclose = true} },
                { title = "No", action = "caue-apartments:handler", params = { forclose = false } },
            }
        }
    }
}

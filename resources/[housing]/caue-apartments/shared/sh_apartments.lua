Apart = {}
Apart.func = {}
Apart.MaxRooms = {
	[1] = 120,
	[2] = 90,
	[3] = 60,
}

function getModule(module)
    if not Apart then print("Warning: '" .. tostring(module) .. "' module doesn't exist") return false end
    return Apart[module]
end

Apart.info = {
    [1] = {
        ["apartmentType"] = 1,
        ["apartmentPrice"] = 2000,
        ["apartmentStreet"] = "No3",
    },
    [2] = {
        ["apartmentType"] = 2,
        ["apartmentPrice"] = 80000,
        ["apartmentStreet"] = "Prosperity",
    },
    [3] = {
        ["apartmentType"] = 3,
        ["apartmentPrice"] = 130000,
        ["apartmentStreet"] = "Pill Box Swiss St",
    },
}


Apart.exitPoint = {
	[1] = vector3(367.35, -1802.38, 29.08),
	[2] = vector3(-1236.27,-860.84,12.91),
	[3] = vector3(160.26762390137,-641.96905517578,47.073524475098),
}


Apart.Locations = {
	[1] = vector3(367.35, -1802.38, 29.08),
	[2] = vector3(-1236.27,-860.84,12.91),
	[3] = vector3(160.26762390137,-641.96905517578,47.073524475098),
}
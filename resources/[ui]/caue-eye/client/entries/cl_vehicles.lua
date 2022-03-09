local Entries = {}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_flip",
            label = "Desvirar Veiculo",
            icon = "car-crash",
            event = "FlipVehicle",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return not IsVehicleOnAllWheels(pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "carry_bike",
            label = "Carregar Bicicleta",
            icon = "spinner",
            event = "carryEntity",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return IsThisModelABicycle(pContext.model) and not IsEntityAttachedToAnyPed(pEntity) and not IsEntityAttachedToAnyPed(PlayerPedId())
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_getintrunk",
            label = "Entrar no Porta-malas",
            icon = "user-secret",
            event = "vehicle:getInTrunk",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, getTrunkDoor(pEntity, pContext.model)) and isCloseToBoot(pEntity, PlayerPedId(), 1.8, pContext.model)
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_runplate",
            label = "Checar Placa",
            icon = "money-check",
            event = "clientcheckLicensePlate",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return exports["caue-jobs"]:getJob(false, "is_police") and isCloseToBoot(pEntity, PlayerPedId(), 1.8, pContext.model) and not IsPedInAnyVehicle(PlayerPedId(), false)
        end
    }
}

-- Entries[#Entries + 1] = {
--     type = "entity",
--     group = { 2 },
--     data = {
--         {
--             id = "vehicle_inspectvin",
--             label = "Checar VIN",
--             icon = "sim-card",
--             event = "vehicle:checkVIN",
--             parameters = {}
--         }
--     },
--     options = {
--         distance = { radius = 3.0 },
--         isEnabled = function(pEntity, pContext)
--             return isCloseToHood(pEntity, PlayerPedId()) and (exports["caue-jobs"]:getJob(false, "is_police") or exports["caue-jobs"]:getJob(false, "is_medic")) and not IsPedInAnyVehicle(PlayerPedId(), false)
--         end
--     }
-- }

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_add_fakeplate",
            label = "Colocar Placa Falsa",
            icon = "screwdriver",
            event = "vehicle:addFakePlate",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return isCloseToBoot(pEntity, PlayerPedId(), 1.8, pContext.model) and not IsPedInAnyVehicle(PlayerPedId(), false)
            and exports["caue-vehicles"]:HasVehicleKey(pEntity) and exports["caue-inventory"]:hasEnoughOfItem("fakeplate", 1, false)
            and not exports["caue-vehicles"]:GetVehicleMetadata(pEntity, "fakePlate")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_remove_fakeplate",
            label = "Remover Placa Falsa",
            icon = "ban",
            event = "vehicle:removeFakePlate",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return isCloseToBoot(pEntity, PlayerPedId(), 1.8, pContext.model) and not IsPedInAnyVehicle(PlayerPedId(), false)
            and exports["caue-vehicles"]:HasVehicleKey(pEntity) and exports["caue-vehicles"]:GetVehicleMetadata(pEntity, "fakePlate")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_examine",
            label = "Examinar Veiculo",
            icon = "wrench",
            event = "caue-vehicles:examineVehicle",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, getEngineDoor(pEntity, pContext.model)) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_station",
            label = "Abastecer",
            icon = "gas-pump",
            event = "caue-vehicles:refuel",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.2, boneId = "wheel_lr" },
        isEnabled = function(pEntity, pContext)
            return polyChecks.gasStation.isInside and canRefuelHere(pEntity, polyChecks.gasStation.polyData)
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_refuel_jerrycan",
            label = "Abastecer",
            icon = "gas-pump",
            event = "vehicle:refuel:jerryCan",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.2, boneId = "wheel_lr" },
        isEnabled = function(pEntity, pContext)
            return HasWeaponEquipped(883325847) -- WEAPON_PetrolCan
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_putinvehicle",
            label = "Colocar no Veiculo",
            icon = "chevron-circle-left",
            event = "police:forceEnter",
            parameters = {}
        },
        {
            id = "vehicle_unseatnearest",
            label = "Remover do Veiculo",
            icon = "chevron-circle-right",
            event = "unseatPlayer",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 4.0 },
        isEnabled = function(pEntity, pContext)
            return (not (isCloseToHood(pEntity, PlayerPedId()) or isCloseToBoot(pEntity, PlayerPedId(), 1.8, pContext.model)) or pContext.model == GetHashKey("emsnspeedo")) and not IsPedInAnyVehicle(PlayerPedId(), false) and not pContext.flags["isCarShopVehicle"]
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_keysgive",
            label = "Dar Chave",
            icon = "key",
            event = "vehicle:giveKey",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 1.8 },
        isEnabled = function(pEntity, pContext)
            return hasKeys(pEntity)
        end
    }
}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isWheelchair" },
    data = {
        {
            id = "wheelchair",
            label = "toggle wheelchair",
            icon = "wheelchair",
            event = "caue:vehicle:wheelchair:control",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 0.9, boneId = "misc_a" }
    }
}


Entries[#Entries + 1] = {
    type = "flag",
    group = { "isTowTruck" },
    data = {
        {
            id = "towtruck_tow",
            label = "tow vehicle",
            icon = "trailer",
            event = "jobs:towVehicle",
            parameters = {}
        }
    },
    options = {
        job = { "towtruck" },
        distance = { radius = 2.5, boneId = "wheel_lr" },
        isEnabled = function (pEntity, pContext)
            return not pContext.flags["isTowingVehicle"]
        end
    }
}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isTowTruck" },
    data = {
        {
            id = "towtruck_untow",
            label = "untow vehicle",
            icon = "trailer",
            event = "jobs:untowVehicle",
            parameters = {}
        }
    },
    options = {
        job = { "towtruck" },
        distance = { radius = 2.5, boneId = "wheel_lr" },
        isEnabled = function (pEntity, pContext)
            return pContext.flags["isTowingVehicle"]
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_brake",
            label = "Reparar freios",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "brake"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("brake")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_axle",
            label = "Reparar eixo",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "axle"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("axle")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_radiator",
            label = "Reparar Radiador",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "radiator"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("radiator")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_clutch",
            label = "Reparar Embreagem",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "clutch"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("clutch")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_transmission",
            label = "Reparar Transmissão",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "transmission"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("transmission")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_electronics",
            label = "Reparar Eletronicas",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "electronics"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("electronics")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_injector",
            label = "Reparar injeção",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "injector"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("injector")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_tire",
            label = "Reparar pneus",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "tire"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("tire")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_body",
            label = "Reparar Lataria",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "body"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("body")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_repair_engine",
            label = "Reparar motor",
            icon = "wrench",
            event = "caue-vehicles:repairVehicle",
            parameters = "engine"
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isVehicleDoorOpen(pEntity, 4) and isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model) and hasRepairItems("engine")
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_df",
            label = "Abrir/Fechar Porta da Frente Esquerda",
            icon = "door-open",
            event = "car:doors",
            parameters = 0
        }
    },
    options = {
        distance = { radius = 1.0, boneId = "door_dside_f" },
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_dr",
            label = "Abrir/Fechar Porta de Trás Esquerda",
            icon = "door-open",
            event = "car:doors",
            parameters = 2
        }
    },
    options = {
        distance = { radius = 1.0, boneId = "door_dside_r" },
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_pf",
            label = "Abrir/Fechar Porta da Frente Direita",
            icon = "door-open",
            event = "car:doors",
            parameters = 1
        }
    },
    options = {
        distance = { radius = 1.0, boneId = "door_pside_f" },
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_pr",
            label = "Abrir/Fechar Porta de Trás Direita",
            icon = "door-open",
            event = "car:doors",
            parameters = 3
        }
    },
    options = {
        distance = { radius = 1.0, boneId = "door_pside_r" },
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_backdoor",
            label = "Abrir/Fechar Porta-malas",
            icon = "door-open",
            event = "car:doors",
            parameters = 5
        }
    },
    options = {
        distance = { radius = 3.0 },
        isEnabled = function(pEntity, pContext)
            return isCloseToBoot(pEntity, PlayerPedId(), 1.8, pContext.model)
        end
    }
}

Entries[#Entries + 1] = {
    type = "entity",
    group = { 2 },
    data = {
        {
            id = "vehicle_door_engine",
            label = "Abrir/Fechar Capô",
            icon = "door-open",
            event = "car:doors",
            parameters = 4
        }
    },
    options = {
        distance = { radius = 1.8, boneId = "engine" },
        isEnabled = function(pEntity, pContext)
            return isCloseToEngine(pEntity, PlayerPedId(), 1.8, pContext.model)
        end
    }
}

Citizen.CreateThread(function()
    for _, entry in ipairs(Entries) do
        if entry.type == "flag" then
            AddPeekEntryByFlag(entry.group, entry.data, entry.options)
        elseif entry.type == "model" then
            AddPeekEntryByModel(entry.group, entry.data, entry.options)
        elseif entry.type == "entity" then
            AddPeekEntryByEntityType(entry.group, entry.data, entry.options)
        elseif entry.type == "polytarget" then
            AddPeekEntryByPolyTarget(entry.group, entry.data, entry.options)
        end
    end
end)
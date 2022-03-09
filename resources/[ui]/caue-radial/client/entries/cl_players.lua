local PedEntries = MenuEntries["peds"]

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-escort",
        title = "Escoltar",
        icon = "#general-escort",
        event = "caue-police:escort"
    },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and DecorGetInt(PlayerPedId(), "escorting") == 0 and DecorGetInt(PlayerPedId(), "dragging") == 0 and pEntity and pContext.flags["isPlayer"]
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-cuff",
        title = "Algemar",
        icon = "#cuffs-cuff",
        event = "caue-police:cuffPlayer"
    },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and pEntity and pContext.flags["isPlayer"] and not pContext.flags["isCuffed"] and ((exports["caue-inventory"]:hasEnoughOfItem("cuffs",1,false) or (exports["caue-jobs"]:getJob(CurrentJob, "is_police") or CurrentJob == "doc"))) and pContext.distance <= 1.2
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-ucuff",
        title = "Desalgemar",
        icon = "#cuffs-uncuff",
        event = "caue-police:uncuffPlayer"
    },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and pEntity and pContext.flags["isPlayer"] and pContext.flags["isCuffed"] and ((exports["caue-inventory"]:hasEnoughOfItem("cuffs",1,false) or (exports["caue-jobs"]:getJob(CurrentJob, "is_police") or CurrentJob == "doc")))
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-unblindfold",
        title = "Remover Venda",
        icon = "#blindfold",
        event = "blindfold:blindfold"
    },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and pEntity and pContext.flags["isPlayer"] and pContext.flags["isBlindfolded"]
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-cuffActions",
        title = "Ações de Algemar",
        icon = "#cuffs",
    },
    subMenus = {"cuffs:softcuff", "cuffs:remmask", "cuffs:beatmode", "cuffs:blindfold" }, --"cuffs:checkphone",
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and pEntity and pContext.flags["isPlayer"] and pContext.flags["isCuffed"] and ((exports["caue-inventory"]:hasEnoughOfItem("cuffs",1,false) or (exports["caue-jobs"]:getJob(CurrentJob, "is_police") or CurrentJob == "doc")))
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-revive",
        title = "CPR",
        icon = "#medic-revive",
        event = "revive",
    },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and pEntity and pContext.flags["isPlayer"] and pContext.flags["isDead"] and (exports["caue-jobs"]:getJob(CurrentJob, "is_police") or CurrentJob == "doc" or exports["caue-jobs"]:getJob(CurrentJob, "is_medic"))
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-heal",
        title = "Curar",
        icon = "#medic-heal",
        event = "ems:heal",
    },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and pEntity and pContext.flags["isPlayer"] and not pContext.flags["isDead"] and exports["caue-jobs"]:getJob(CurrentJob, "is_medic")
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "peds-medicActions",
        title = "Ações Medicas",
        icon = "#medic",
    },
    subMenus = { "medic:checktargetstates", "medic:stomachpump" },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and pEntity and pContext.flags["isPlayer"] and exports["caue-jobs"]:getJob(CurrentJob, "is_medic")
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "police-action",
        title = "Ações Policiais",
        icon = "#police-action",
    },
    subMenus = {"police:frisk", "police:search", "police:dnaSwab", "police:checkBank", "police:gsr", "medic:checktargetstates" },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and pEntity and pContext.flags["isPlayer"] and (exports["caue-jobs"]:getJob(CurrentJob, "is_police") or CurrentJob == "doc") and pContext.distance <= 1.2
    end
}

PedEntries[#PedEntries+1] = {
    data = {
        id = "steal",
        title = "Roubar",
        icon = "#steal",
        event = "police:rob"
    },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and not (exports["caue-jobs"]:getJob(CurrentJob, "is_police") or CurrentJob == "doc") and pEntity and pContext.flags["isPlayer"] and (isPersonBeingHeldUp(pEntity) or pContext.flags["isDead"])
    end
}

PedEntries[#PedEntries+1] = {
    data = {
      id = "steal-shoes",
      title = "Roubar Sapatos",
      icon = "#shoes",
      event = "shoes:steal"
    },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and not (exports["caue-jobs"]:getJob(CurrentJob, "is_police") or CurrentJob == "doc") and pEntity and pContext.flags["isPlayer"] and (pContext.flags["isCuffed"] or pContext.flags["isDead"] or isPersonBeingHeldUp(pEntity))
    end
}

MenuItems["police:frisk"] = {
    data = {
        id = "peds-frisk",
        title = "Revista leve",
        icon = "#police-action-frisk",
        event = "police:checkInventory",
        parameters = true
    }
}

MenuItems["police:search"] = {
    data = {
        id = "peds-search",
        title = "Revistar",
        icon = "#cuffs-check-inventory",
        event = "police:checkInventory",
        parameters = false
    }
}

MenuItems["cuffs:softcuff"] = {
    data = {
        id = "cuffs:softcuff",
        title = "Algema leve",
        icon = "#walking",
        event = "caue-police:softcuffPlayer"
    }
}

MenuItems["cuffs:remmask"] = {
    data = {
        id = "cuffs:remmask",
        title = "Remove Mask Hat",
        icon = "#cuffs-remove-mask",
        event = "police:remmask"
    }
}

-- MenuItems["cuffs:checkphone"] = {
--     data = {
--         id = "cuffs:checkphone",
--         title = "Read Phone",
--         icon = "#cuffs-check-phone",
--         event = "police:checkPhone"
--     }
-- }

MenuItems["cuffs:beatmode"] = {
    data = {
        id = "cuffs:beatmode",
        title = "Modo Bater",
        icon = "#cuffs-beatmode",
        event = "police:startPutInBeatMode"
    }
}

MenuItems["cuffs:blindfold"] = {
    data = {
        id = "cuffs:blindfold",
        title = "Venda",
        icon = "#blindfold",
        event = "blindfold:blindfold"
    },
    isEnabled = function(pEntity, pContext)
        return not isDisabled() and pEntity and pContext.flags["isCuffed"] and pContext.flags["isPlayer"] and not pContext.flags["isBlindfolded"] and ((exports["caue-inventory"]:hasEnoughOfItem("blindfold",1,false)))
    end
}

MenuItems["medic:stomachpump"] = {
    data = {
        id = "medic:stomachpump",
        title = "Stomach pump",
        icon = "#medic-stomachpump",
        event = "ems:stomachpump"
    },
    isEnabled = function(pEntity, pContext)
        return CurrentJob == "doctor"
    end
}

-- MenuItems["medic:checktargetstates"] = {
 --    data = {
 --        id = "medic:checktargetstates",
 --        title = "Examinar Alvo",
 --        icon = "#general-check-over-target",
  --       event = "requestWounds"
--     }
-- }

MenuItems["police:dnaSwab"] = {
    data = {
        id = "police:dnaSwab",
        icon = "#police-action-fingerprint",
        title = "Coletar DNA",
        event = "caue-evidence:dnaSwab"
    },
    isEnabled = function(pEntity, pContext)
        return not exports["caue-base"]:getVar("dead") and pContext.flags and CurrentJob == "cid"
    end
}

MenuItems["police:checkBank"] = {
    data = {
        id = "police:checkBank",
        icon = "#police-check-bank",
        title = "Checar Banco",
        event = "police:checkBank"
    },
    isEnabled = function(pEntity, pContext)
        return not exports["caue-base"]:getVar("dead") and pContext.flags and exports["caue-jobs"]:getJob(CurrentJob, "is_police")
    end
}

MenuItems["police:gsr"] = {
    data = {
        id = "police:gsr",
        icon = "#police-action-gsr",
        title = "Checar GSR",
        event = "police:gsr"
    },
    isEnabled = function(pEntity, pContext)
        return not exports["caue-base"]:getVar("dead") and pContext.flags and exports["caue-jobs"]:getJob(CurrentJob, "is_police")
    end
}
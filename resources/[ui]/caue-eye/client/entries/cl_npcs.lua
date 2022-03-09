local Entries = {}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isBankAccountManager" },
    data = {
        {
            id = "bank_paycheck_collect",
            label = "Coletar salário",
            icon = "money-check-alt",
            event = "caue-npcs:ped:paycheckCollect",
            parameters = {}
        }

    },
    options = {
        distance = { radius = 3.5 }
    }
}
Entries[#Entries + 1] = {
    type = "flag",
    group = { "isJobEmployer" },
    data = {
        {
            id = "jobs_employer_checkIn",
            label = "Entrar em serviço",
            icon = "circle",
            event = "jobs:checkIn",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function()
            return CurrentJob == "unemployed"
        end
    }
}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isJobEmployer" },
    data = {
        {
            id = "jobs_employer_paycheck",
            label = "coletar salário",
            icon = "circle",
            event = "jobs:getPaycheck",
            parameters = {}
        },
        {
            id = "jobs_employer_checkOut",
            label = "Sair de serviço",
            icon = "circle",
            event = "jobs:checkOut",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 },
        isEnabled = function(pEntity, pContext)
            return pContext.job.id == CurrentJob
        end
    }
}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isShopKeeper" },
    data = {
        {
            id = "shopkeeper",
            label = "Comprar",
            icon = "shopping-basket",
            event = "caue-npcs:ped:keeper",
            parameters = { "2" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isWeaponShopKeeper" },
    data = {
        {
            id = "weaponshop_keeper",
            label = "Comprar",
            icon = "circle",
            event = "caue-npcs:ped:keeper",
            parameters = { "5" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isToolShopKeeper" },
    data = {
        {
            id = "toolshop_keeper",
            label = "Tenho Algo",
            icon = "toolbox",
            event = "caue-npcs:ped:keeper",
            parameters = { "4" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isSportShopKeeper" },
    data = {
        {
            id = "sportshop_keeper",
            label = "Comprar equipamento",
            icon = "circle",
            event = "caue-npcs:ped:keeper",
            parameters = { "34" }
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isIllegalMedic" },
    data = {
        {
            id = "illegal_medic_revive",
            label = "Ser Reanimado ($200)",
            icon = "cross",
            event = "caue-death:illegal_revive"
        },
        {
            id = "illegal_medic_heal",
            label = "Curativos ($150)",
            icon = "cross",
            event = "caue-death:illegal_heal"
        },

    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isPawnBuyer" },
    data = {
        {
            id = "pawn_give_items",
            label = "Comprar",
            icon = "circle",
            event = "caue-pawnshop:buy",
            parameters = {}
        },
        {
            id = "pawn_sell_items",
            label = "Vender",
            icon = "circle",
            event = "caue-pawnshop:sell",
            parameters = {}
        }
    },
    options = {
        distance = { radius = 2.5 }
    }
}

Entries["purchasemethkey"] = {
  type = "flag",
  group = { "isMethDude" },
  data = {
      {
          label = "Purchase Lab Key",
          icon = "key",
          event = "caue-meth:purchaseMethLabKey",
          parameters = {}
      },
  },
  options = {
      distance = { radius = 2.5 }
  }


}
Entries[#Entries + 1] = {
    type = "flag",
    group = { "isNPC" },
    data = {
        {
            id = "supply",
            label = "Entregas",
            icon = "circle",
            event = "caue-tacoshop:supplyStation",
            parameters = {}
        },
    },
    options = {
        distance = { radius = 2.5 },
        npcIds = {"hunting_market"}
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

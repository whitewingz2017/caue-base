local Entries = {}

Entries[#Entries + 1] = {
    type = "flag",
    group = { "isBankAccountManager" },
    data = {
        {
            id = "bank_paycheck_collect",
            label = "Collect Salary",
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
            label = "Check In",
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
            label = "Collect Salary",
            icon = "circle",
            event = "jobs:getPaycheck",
            parameters = {}
        },
        {
            id = "jobs_employer_checkOut",
            label = "Check In",
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
            label = "Purchase",
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
            label = "Purchase",
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
            label = "I have something",
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
            label = "buy equipment",
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
            label = "Be revived ($200)",
            icon = "cross",
            event = "caue-death:illegal_revive"
        },
        {
            id = "illegal_medic_heal",
            label = "Dressings ($150)",
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
            label = "Purchase",
            icon = "circle",
            event = "caue-pawnshop:buy",
            parameters = {}
        },
        {
            id = "pawn_sell_items",
            label = "Sell",
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
            label = "Deliveries",
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

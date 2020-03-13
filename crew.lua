local abillities = { ["crew_scavenge"] = {active = true.amount = 3},
                     ["crew_interact"] = {active = true.amount = 3},
                     ["crew_inspire"]  = {active = true.amount = 3},
                     ["crew_ai.ap_ammo"]= true
                   }
local old_categoty_update = PlayerManager.has_category_upgrade
function playerManager:has_category_upgrade(categoty, upgrade)
    return abillities[upgrade] and true or old_category_upgrade(self, category, upgrade)
end

local old_crew_upgrade = PlayerManager.crew_abillity_upgrade_value

function PlayerManager:crew_abillity_upgrade_value(upgrade, default)
    if  abillities[upgrade] and
        abillities[upgrade].active and
        abillities[upgrade].amount >= 0 and
        abillities[upgrade].amount <= 3 then
    return tweak data.upgrades.values.team[upgrade][1][abillities[upgrade].amount]
    else
        return old_crew_upgrade(self, upgrade, default)
end

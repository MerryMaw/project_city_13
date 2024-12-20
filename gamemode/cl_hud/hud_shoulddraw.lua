
local hide = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudGeiger"] = true,
    ["CHudPoisonDamageIndicator"] = true,
    ["CHudSuitPower"] = true,
    ["CHudWeaponSelection"] = true,
}

hook.Add("HUDShouldDraw", "HideDefaults", function(name)
	if (hide[name]) then return false end
end)

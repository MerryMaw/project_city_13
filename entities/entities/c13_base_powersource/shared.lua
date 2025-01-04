---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/20/24 10:17 PM
---

DEFINE_BASECLASS("c13_base");

ENT.PrintName = "C13_BASE_POWER_SOURCE";
ENT.Author = "The Maw";
ENT.Purpose = "Provides base fundamentals for City 13 entities, which provides power";

ENT.Model = "models/props_vehicles/generatortrailer01.mdl"

ENT.maxPowerGenerated = 1;
ENT.acceptedFuel = {};

---SetupDataTables
function ENT:SetupDataTables()
    BaseClass.SetupDataTables(self);

    self:NetworkVar("Int", 0, "PowerGenerated");
    self:NetworkVar("Int", 1, "PowerTarget");

    if (SERVER) then
        self:SetPowerUsed(0);
    end
end

---getMaxPowerGenerated
---@return number
function ENT:getMaxPowerGenerated()
    return self.maxPowerGenerated;
end

---getAcceptedFuelSources
---@return table
function ENT:getAcceptedFuelSources()
    return self.acceptedFuel;
end
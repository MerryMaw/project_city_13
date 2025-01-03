---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/20/24 10:17 PM
---

DEFINE_BASECLASS("c13_base");

ENT.PrintName = "C13_BASE_APPLIANCE";
ENT.Author = "The Maw";
ENT.Purpose = "Provides base fundamentals for City 13 powered entities";

ENT.PowerRequired = 1;

---SetupDataTables
function ENT:SetupDataTables()
    BaseClass.SetupDataTables(self);
    self:NetworkVar("Int", 0, "PowerUsed");

    if (SERVER) then
        self:SetPowerUsed(0);
    end
end

---GetPowerRequired
---@return number
function ENT:GetPowerRequired()
    return self.PowerRequired;
end
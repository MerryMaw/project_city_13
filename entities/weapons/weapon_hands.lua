AddCSLuaFile()

local IsValid = IsValid;

SWEP.PrintName = "Hands"
SWEP.Author = "The Maw"
SWEP.Purpose = "Nothing"

SWEP.ViewModel = "models/weapons/c_medkit.mdl"
SWEP.WorldModel = ""

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.UseHands = true

---Initialize
function SWEP:Initialize()
    self:SetHoldType("normal")
    self:SetNoDraw(true)
end

---Think
function SWEP:Think()
end

---PrimaryAttack
function SWEP:PrimaryAttack()
    if (not IsValid(self.Owner)) then
        return
    end

    local item = getEquipmentSlot(self.Owner:EntIndex(), "Main Hand");

    if (not item) then
        return
    end ;

    item:use(self.Owner);
end

---SecondaryAttack
function SWEP:SecondaryAttack()
    if (not IsValid(self.Owner)) then
        return
    end

    local item = getEquipmentSlot(self.Owner:EntIndex(), "Off Hand");

    if (not item) then
        return
    end ;

    item:use(self.Owner);
end

---PreDrawViewModel
---@param _ userdata
---@param _ userdata
---@param _ userdata
---@return boolean
function SWEP:PreDrawViewModel(_, _, _)
    --vm:SetMaterial( "engine/occlusionproxy" )
    return true
end



AddCSLuaFile()

SWEP.PrintName			= "Hands"
SWEP.Author				= "The Maw"
SWEP.Purpose    		= "Nothing"

SWEP.ViewModel			= "models/weapons/c_medkit.mdl"
SWEP.WorldModel			= ""

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.UseHands = true

function SWEP:Initialize()
	self:SetHoldType( "normal" )
	self:SetNoDraw(true)
end

function SWEP:Think()

end

function SWEP:PrimaryAttack()

end

function SWEP:SecondaryAttack()
end

function SWEP:PreDrawViewModel( vm,pl,wep)
	//vm:SetMaterial( "engine/occlusionproxy" )
	return true
end


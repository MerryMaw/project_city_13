
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

AddCSLuaFile("cl_various/color.lua");
AddCSLuaFile("cl_various/fonts.lua");

AddCSLuaFile("cl_hud/hud_healthbar.lua");
AddCSLuaFile("cl_hud/hud_scoreboard.lua");
AddCSLuaFile("cl_hud/hud_shoulddraw.lua");
AddCSLuaFile("cl_hud/hud.lua");

include( "shared.lua" )

include( "sv_various/chatcommands.lua" )

---Initialize
function GM:Initialize()
    resource.AddFile("materials/city13/ui/heart.png");
end

---PlayerInitialSpawn
---@param _ userdata
function GM:PlayerInitialSpawn(_)
end

---PlayerCanHearPlayersVoice
---@return boolean,boolean
function GM:PlayerCanHearPlayersVoice()
	return true, true
end

---CheckPassword
---@param Mystery nil
---@param IP string
---@param ServerPassword string
---@param Name string
---@return boolean,string
function GM:CheckPassword(Mystery,IP,ServerPassword,Name)
    print(Mystery,IP,ServerPassword,Name);
	--This new hook returns AllowJoin,BlockMessage
end


---PlayerSpawn
---@param pl userdata
function GM:PlayerSpawn(pl)
	hook.Call( "PlayerSetModel" , self , pl )
	self:PlayerLoadout(pl)

    pl:SetupHands()
	pl:CrosshairDisable()

    pl:SetCollisionGroup(COLLISION_GROUP_WEAPON)
end

---PlayerLoadout
---@param pl userdata
---@return boolean
function GM:PlayerLoadout( pl )
    pl:Give("weapon_hands", true)
	return true
end


---PlayerDeathSound
---@param _ userdata
---@return boolean
function GM:PlayerDeathSound(_)
    return true
end

--Damnit Garry!
---PlayerSetModel
---@param ply userdata
function GM:PlayerSetModel( ply )
    local cl_playermodel = ply:GetInfo("cl_playermodel")
    local modelname = player_manager.TranslatePlayerModel( cl_playermodel )
    ply:SetModel( modelname )
end




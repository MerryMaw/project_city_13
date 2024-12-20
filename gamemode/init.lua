
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

function GM:Initialize()
end

function GM:PlayerInitialSpawn(pl)
end

function GM:PlayerCanHearPlayersVoice()
	return true, true
end 

function GM:CheckPassword(Mystery,IP,ServerPassword,Name)
	--This new hook returns AllowJoin,BlockMessage
end


function GM:PlayerSpawn(pl)
	hook.Call( "PlayerSetModel" , self , pl )
	self:PlayerLoadout(pl)

    pl:SetupHands()
	pl:CrosshairDisable()

    pl:SetCollisionGroup(COLLISION_GROUP_WEAPON)
end

function GM:PlayerLoadout( pl )
    pl:Give("weapon_hands", true)
	return true
end


function GM:PlayerDeathSound( pl )
    return true
end

--Damnit Garry!
function GM:PlayerSetModel( ply )
    local cl_playermodel = ply:GetInfo("cl_playermodel")
    local modelname = player_manager.TranslatePlayerModel( cl_playermodel )
    ply:SetModel( modelname )
end




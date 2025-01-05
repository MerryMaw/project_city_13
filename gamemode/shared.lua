AddCSLuaFile("autolua.lua")
include("autolua.lua")

addLuaSHFolder("sh_items");
addLuaSHFolder("sh_various");
addLuaSHFolder("sh_player");

addLuaCSFolder("cl_various");
addLuaCSFolder("cl_hud/vgui");
addLuaCSFolder("cl_hud");

GM.Name = "Project City 13"
GM.Author = "The Maw"
GM.Email = "cjbremer@gmail.com"
GM.Website = ""
GM.Version = 0.01

---PlayerNoClip
---@param pl userdata
---@return boolean
function GM:PlayerNoClip(pl)
    return pl:IsAdmin() and pl:GetObserverMode() == OBS_MODE_NONE;
end

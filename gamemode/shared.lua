


GM.Name 			= "Project City 13"
GM.Author 			= "The Maw"
GM.Email 			= "cjbremer@gmail.com"
GM.Website 			= ""
GM.Version			= 0.01


---PlayerNoClip
---@param pl userdata
---@return boolean
function GM:PlayerNoClip( pl )
	return pl:IsAdmin();
end

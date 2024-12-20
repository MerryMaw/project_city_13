


GM.Name 			= "Project City 13"
GM.Author 			= "The Maw"
GM.Email 			= "cjbremer@gmail.com"
GM.Website 			= ""
GM.Version			= 0.01


function GM:PlayerNoClip( pl )
	return pl:IsAdmin();
end

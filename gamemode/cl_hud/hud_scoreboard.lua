-- local sw,sh = ScrW(),ScrH()

local ssw, ssh = 800, 400

Scoreboard_VGUI = Scoreboard_VGUI or nil;

---ScoreboardShow
function GM:ScoreboardShow()
    if (not Scoreboard_VGUI) then
        Scoreboard_VGUI = vgui.Create("C13_Scoreboard")
        Scoreboard_VGUI:SetSize(ssw, ssh);
        Scoreboard_VGUI:SetTitle(self.Name);
        Scoreboard_VGUI:MakePopup()
        Scoreboard_VGUI:SetAlpha(0)
        Scoreboard_VGUI:Center()
    end

    Scoreboard_VGUI:populate();

    Scoreboard_VGUI:Stop()
    Scoreboard_VGUI:SetVisible(true)
    Scoreboard_VGUI:AlphaTo(255, 0.2, 0, function()
    end)
end

---ScoreboardHide
function GM:ScoreboardHide()
    Scoreboard_VGUI:Stop()
    Scoreboard_VGUI:AlphaTo(0, 0.2, 0, function(_, pan)
        pan:SetVisible(false)
    end)
end

---HUDDrawScoreBoard
function GM:HUDDrawScoreBoard()
end



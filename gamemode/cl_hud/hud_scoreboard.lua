

-- local sw,sh = ScrW(),ScrH()

local off_h = 100;
local ssw,ssh = 800,300

local playerList;
local IsValid = IsValid;

local setDrawColor = surface.SetDrawColor;
local drawRect = surface.DrawRect;

---PopulateList
local function PopulateList()
    if (not playerList) then return end

    playerList.List:Clear()

    for _,v in pairs(player.GetAll()) do
        local a = playerList.List:Add("DPanel")
        a:SetText("")
        a:SetTall(22)
        a.Paint = function(_, W, H)
            if (not IsValid(v)) then return end

            setDrawColor(MAIN_BG_COLOR);
            drawRect(0,0,W,H);

            draw.SimpleText(v:Nick(),"c13_normal",10,H/2,MAIN_TEXT_COLOR,nil,1)
            draw.SimpleText(v:Ping(),"c13_normal",W-13,H/2,MAIN_TEXT_COLOR,2,1)
        end
    end
end

---ScoreboardShow
function GM:ScoreboardShow()
    if (not playerList) then
        playerList = vgui.Create("C13_Frame")
        playerList:SetSize(ssw,ssh+off_h)
        playerList:SetTitle(self.Name);
        playerList:SetFont("c13_normal")
        playerList:MakePopup()
        playerList:SetAlpha(0)
        playerList:Center()
        playerList:DockPadding( 5, off_h, 5, 5 )


        playerList.Pane = vgui.Create("DScrollPanel",playerList)
        playerList.Pane:Dock(FILL)
        playerList.Pane.Paint = function(_, _, _) end

        playerList.Pane.VBar.Paint = function(_, _, _) end
        playerList.Pane.VBar.btnGrip.Paint = function(_, w, h)
            setDrawColor(MAIN_SCOREBOARD_TEXT)
            drawRect(2,2,w-4,h-4,MAIN_SCOREBOARD_TEXT)
        end
        playerList.Pane.VBar.btnDown.Paint 	= playerList.Pane.VBar.btnGrip.Paint
        playerList.Pane.VBar.btnUp.Paint 	= playerList.Pane.VBar.btnGrip.Paint

        playerList.List = vgui.Create("DListLayout",playerList.Pane)
        playerList.List:Dock(FILL)
    end

    PopulateList();

    playerList:Stop()
    playerList:SetVisible(true)
    playerList:AlphaTo( 255, 0.2, 0, function() end )
end

---ScoreboardHide
function GM:ScoreboardHide()
    playerList:Stop()
    playerList:AlphaTo( 0, 0.2, 0, function(_, pan) pan:SetVisible(false) end )
end

---HUDDrawScoreBoard
function GM:HUDDrawScoreBoard()
end



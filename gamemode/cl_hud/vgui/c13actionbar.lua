---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 1/4/25 3:11 AM
---


local PANEL = {}

---Init
function PANEL:Init()
    self:SetPaintBackgroundEnabled(false)
    self:SetPaintBorderEnabled(false)
end

vgui.Register("C13_ActionBar", PANEL, "DPanel");
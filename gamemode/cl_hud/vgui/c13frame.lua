---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/21/24 4:54 PM
---

local PANEL = {}

local setDrawColor = surface.SetDrawColor;
local drawRect = surface.DrawRect;

local setTextColor = surface.SetTextColor;
local setTextPos = surface.SetTextPos;
local setFont = surface.SetFont;
local drawText = surface.DrawText;

---Init
function PANEL:Init()
    self.Font = "c13_normal"
    self.Text = ""

    self:SetPaintBackgroundEnabled(false)
    self:SetPaintBorderEnabled(false)
end

---SetTitle
---@param title string
function PANEL:SetTitle(title)
    self.Text = title
end

---SetFont
---@param font string
function PANEL:SetFont(font)
    self.Font = font
end

---Paint
---@param w number
---@param h number
function PANEL:Paint(w, h)
    setDrawColor(MAIN_BG_COLOR.r, MAIN_BG_COLOR.g, MAIN_BG_COLOR.b, MAIN_BG_COLOR.a);
    drawRect(0, 0, w, h);
end

---PaintOver
---@param _ number
---@param _ number
---@return boolean
function PANEL:PaintOver(_, _)
    if (not self.Text or #self.Text <= 0) then
        return true
    end

    setTextColor(MAIN_TEXT_COLOR.r, MAIN_TEXT_COLOR.g, MAIN_TEXT_COLOR.b, MAIN_TEXT_COLOR.a);
    setTextPos(10, 2);
    setFont("c13_normal");

    drawText(self.Text);

    return true
end

vgui.Register("C13_Frame", PANEL, "EditablePanel");
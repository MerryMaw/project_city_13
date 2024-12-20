---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/20/24 8:13 PM
---
local LocalPlayer = LocalPlayer;

local setTextColor = surface.SetTextColor;
local setTextPos = surface.SetTextPos;
local setFont = surface.SetFont;
local drawText = surface.DrawText;
local setDrawColor = surface.SetDrawColor;
local drawRect = surface.DrawRect;

local sw,sh = ScrW(),ScrH();

local barX = 50;
local barY = sh-70;

function drawHealthbar()
    ---@type userdata
    local pl = LocalPlayer();
    local strCondition, textColor = getPlayerConditions(pl);

    setDrawColor(MAIN_HEALTH_BG_COLOR);
    drawRect(barX-10,barY-10,230,40);

    setFont("HealthFont");
    setTextColor(MAIN_TEXT_COLOR);
    setTextPos(barX,barY);
    drawText("Health condition: ");

    setTextPos(barX+150,barY);
    setTextColor(textColor);
    drawText(strCondition);
end

function getPlayerConditions(pl)
    local health = pl:Health();
    local maxHealth = pl:GetMaxHealth();
    local healthPercentage = health / maxHealth;

    if (healthPercentage <= 0) then
        return "Critical", MAIN_HEALTH_COLOR_CRITICAL;
    elseif (healthPercentage <= 0.2) then
        return "Terrible", MAIN_HEALTH_COLOR_TERRIBLE;
    elseif (healthPercentage <= 0.5) then
        return "Bad", MAIN_HEALTH_COLOR_BAD;
    elseif (healthPercentage <= 0.8) then
        return "Good", MAIN_HEALTH_COLOR_GOOD;
    elseif (healthPercentage > 0.8) then
        return "Great", MAIN_HEALTH_COLOR_GREAT;
    end

    return "Unknown",MAIN_TEXT_COLOR;
end
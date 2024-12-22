---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/20/24 10:41 PM
---

local concat = table.concat;
local create = ents.Create;
local isValid = IsValid;
local explode = string.Explode;
local len = string.len;

---The chat commands function
local chatCommands = {}

---addChatCommand
---@param command string
---@param funcCallback function
function addChatCommand(command,funcCallback)
    chatCommands["/"..command:gsub(" ","_"):lower()] = funcCallback
end

hook.Add( "PlayerSay", "ChatCommandsC13", function( ply, text, _ )
    local args = explode(" ",text)
    local command = args[1]:lower();

    if (chatCommands[command]) then
        chatCommands[command](ply,concat(args," ",2))
        return false;
    end
end)

addChatCommand("spawn",function(pl,str)
    if (not pl:IsAdmin()) then return end

    local e = create(str)

    if (not isValid(e)) then return end

    e:SetPos(pl:GetEyeTrace().HitPos + Vector(0,0,20))
    e:Spawn()
    e:Activate()
    e:DropToFloor()
end)

addChatCommand("respawn",function(pl,str)
    local targetPlayer;

    if (str and len(str) > 0 and pl:IsAdmin()) then
        targetPlayer = player.GetBySteamID64(str);
    end

    if (isValid(targetPlayer) and not targetPlayer:Alive()) then
        targetPlayer:Spawn();
    elseif (not pl:Alive()) then
        pl:Spawn();
    end
end)
---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/20/24 9:13 PM
---

serverEquipment = serverEquipment or {};

local type = type;

-- This should be universal for every object, not just players.
local meta = FindMetaTable("Entity");

local slotIDs = {};
slotIDs[1] = "Head";
slotIDs[2] = "Headset";
slotIDs[3] = "Backpack";
slotIDs[4] = "Shoulder";
slotIDs[5] = "Hands";
slotIDs[6] = "Foot";
slotIDs[7] = "Body";
slotIDs[8] = "Legs";
slotIDs[9] = "Main Hand";
slotIDs[10] = "Off Hand";

---equipment_translateID
---@param id number
---@return string
function equipment_translateID(id)
    return slotIDs[id];
end

---equipment_translateName
---@param name string
---@return number
function equipment_translateName(name)
    name = name:lower();
    for k,v in pairs(slotIDs) do
        if (v:lower() == name) then return k end
    end

    return nil;
end

if SERVER then
    -- Serverside nets
    util.AddNetworkString("EquipItem")
    util.AddNetworkString("UnequipItem")
    util.AddNetworkString("ClearEquipment")
    util.AddNetworkString("TransmitEquipment")

    ---EquipItem
    ---@param item table
    function meta:EquipItem(item)
        local entId = self:EntIndex();
        local slotId = equipment_translateName(item.Slot);

        if (not slotId) then return end;

        serverEquipment[entId] = serverEquipment[entId] or {};

        -- Unequip the item if there is something on the slot.
        if (serverEquipment[entId][slotId]) then
            self:UnequipItem(serverEquipment[entId][slotId]);
        end

        serverEquipment[entId][slotId] = item;
    end

    ---UnequipItem
    ---@param item table
    function meta:UnequipItem(item)
        local entId = self:EntIndex();
        if (not serverEquipment[entId]) then return end;

        local slotId = equipment_translateName(item.Slot);
        if (not slotId) then return end;

        -- TODO: Drop the item being unequipped or return it to player bag inventory.
        serverEquipment[entId][slotId] = nil;
    end

else
    net.Receive("EquipItem",function()

    end)

    net.Receive("UnequipItem",function()

    end)
end

---getEquipment
---@param entId number
---@return table
function getEquipment(entId)
    return serverEquipment[entId] or {};
end

---getEquipmentSlot
---@param entId number
---@param name string
---@return table
function getEquipmentSlot(entId,name)
    if (type(name) == "string") then name = equipment_translateName(name) end
    return getEquipment(entId)[name];
end

---clearEquipment
---@param entId number
function clearEquipment(entId)
    serverEquipment[entId] = nil;
end
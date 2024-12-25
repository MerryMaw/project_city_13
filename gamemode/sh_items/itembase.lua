---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/20/24 9:34 PM
---

local insert = table.insert;

---@type table
local BASECLASS = {
    --@Variables
    icon = Material("vgui/avatar_default"),

    -- Name of the item.
    name = "Default BASE ITEM",

    -- Description of the item.
    desc = "Default BASE ITEM description.",

    -- Other misc properties. Also used as modifiers for chemical mixtures and crafted products.
    properties = {},

    -- The weight of the item.
    weight = 1,

    -- The volume of the item itself.
    volume = 1,

    -- Max volume. Only used if isContainer = true.
    maxVolume = 0,

    -- Used by equipable items. All items can be placed in "Main Hand" and "Off Hand"
    slot = nil,

    -- Tells the gamemode, this item is a container. Make sure to set CLASS.maxVolume.
    isContainer = false,

    -- Dynamic, reserved when adding items to containers.
    parentContainer = nil,

    -- Used by radios and headsets. Table of channels like [command] = "ChannelName"
    channels = nil,

    -- Gets all the items in the container
    getItems = function(self)
        if (not self.items or not self.isContainer) then return {} end
        return self.items;
    end,

    -- Gets the current total volume of the item and the items it contains, if any.
    getVolume = function(self)
        if (not self.items or not self.isContainer) then return self.volume end

        local currentVolume = self.volume;

        for _, item in pairs(self.items) do
            currentVolume = currentVolume + item:getVolume();
        end

        return currentVolume;
    end,

    -- Adds items to the container and returns the leftover items, if any.
    addItems = function(self, items)
        if (not self.isContainer) then return items end
        self.items = self.items or {};

        local currentVolume;
        local topContainer = self;

        -- Move to the top level of the bag-ception and fetch the combined volume of them all.
        while (topContainer.parentContainer) do
            topContainer = topContainer.parentContainer;
        end

        currentVolume = topContainer:getVolume()

        for id, item in pairs(items) do
            local itemVolume = item:getVolume();
            local parentContainerLarger = (not self.parentContainer or self.parentContainer.maxVolume > item.maxVolume)
            local currentContainerSupport = currentVolume + itemVolume < self.maxVolume;

            if (parentContainerLarger and currentContainerSupport) then
                currentVolume = currentVolume + itemVolume;
                item.parentContainer = self;
                insert(self.items,item);
                items[id] = nil;
            end
        end

        return items;
    end,

    --@Model
    getModel = function(self)
        return self.Model or "models/error.mdl"
    end,

    setModel = function(self,model)
        self.Model = model
    end,


    --@Basics
    getClass = function(self)
        return self.Name or "_C13_BASE"
    end,

    getID = function(self)
        return self.ID
    end,

    getIcon = function(self)
        return self.Icon
    end,

    init 		= function(_) end,

    use         = function(_,_) end,
}

BASECLASS.__index = BASECLASS


---getBaseClass
---@return table
function getBaseClass()
    return BASECLASS;
end
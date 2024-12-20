---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/20/24 9:34 PM
---

---@type table
local BASECLASS = {
    --@Variables
    icon = Material("vgui/avatar_default"),

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

    init 		= function(_) end
}

BASECLASS.__index = BASECLASS


---getBaseClass
---@return table
function getBaseClass()
    return BASECLASS;
end
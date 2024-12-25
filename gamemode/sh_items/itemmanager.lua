---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/20/24 9:44 PM
---

---@type function
local insert = table.insert;
local isValid = IsValid;
local create = ents.Create;

---@type userdata
local itemsInGame = {};

---createItem
---@param className string
---@param itemID number
function createItem(className,itemID)
    local itemClass = getItemClass(className);

    if (not itemClass) then MsgN( "Invalid ITEM class: " .. className .. "!" ) return end

    local item = {
    _Region = SystemID,
    name = className,
    }

    setmetatable( item, itemClass )

    itemID = itemID or insert(itemsInGame, item);

    print("Created item ", className, itemID);

    itemsInGame[itemID] = item
    itemsInGame[itemID].ID = itemID;
    itemsInGame[itemID]:init();

    return itemsInGame[itemID];
end

---removeItem
---@param item userdata
function removeItem(item)
    removeItemByID(item:getID());
end

---removeItemByID
---@param ID number
function removeItemByID(ID)
    itemsInGame[ID] = nil;
end

if (SERVER) then

    ---SpawnItem
    ---@param pos userdata
    ---@param item table
    ---@param quantity number
    ---@return userdata
    function SpawnItem(pos, item, quantity)
        local e = create("c13_base_item")

        if (not isValid(e)) then return end

        e.Model = item:getModel();

        e:SetItem(item,quantity);
        e:SetPos(pos);
        e:Spawn();
        e:Activate();
        e:DropToFloor();

        return e;
    end
end
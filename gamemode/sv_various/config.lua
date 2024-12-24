---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/24/24 9:26 AM
---

local DEFAULT_CONFIG = {
    ["sqlDatabase"] = "c13",
    ["sqlPass"] = "ChangeMe",
    ["sqlUser"] = "ChangeMe",
    ["init_roles"] = {
        ["Administrator"] = {
            ["loadout"] = {}
        },
        ["Bartender"] = {
            ["loadout"] = {}
        },
        ["Botany"] = {
            ["loadout"] = {}
        },
        ["Chef"] = {
            ["loadout"] = {}
        },
        ["Chemist"] = {
            ["loadout"] = {}
        },
        ["Chief Engineer"] = {
            ["loadout"] = {}
        },
        ["Citizen"] = {
            ["loadout"] = {}
        },
        ["Detective"] = {
            ["loadout"] = {}
        },
        ["Engineer"] = {
            ["loadout"] = {}
        },
        ["Geneticist"] = {
            ["loadout"] = {}
        },
        ["Hunters"] = {
            ["loadout"] = {}
        },
        ["Lawyer"] = {
            ["loadout"] = {}
        },
        ["Mailman"] = {
            ["loadout"] = {}
        },
        ["Manufacturer"] = {
            ["loadout"] = {}
        },
        ["Medic"] = {
            ["loadout"] = {}
        },
        ["Medical Director"] = {
            ["loadout"] = {}
        },
        ["Overwatch"] = {
            ["loadout"] = {}
        },
        ["Priest"] = {
            ["loadout"] = {}
        },
        ["Quartermaster"] = {
            ["loadout"] = {}
        },
        ["Research Director"] = {
            ["loadout"] = {}
        },
        ["Researcher"] = {
            ["loadout"] = {}
        },
        ["Roboticist"] = {
            ["loadout"] = {}
        },
        ["Salvager"] = {
            ["loadout"] = {}
        },
        ["Combine Soldier"] = {
            ["loadout"] = {}
        },
        ["Combine Elite"] = {
            ["loadout"] = {}
        },
    }
};

GAME_CONFIG = GAME_CONFIG or {};

-- THE CONFIG DIRECTORY
local configDir = "c13";

-- LOCATION OF CUSTOM CONFIG
local configLocation = configDir .. "/config.json";

---initializeConfig
local function initializeConfig()
    local modConfig = "data/" .. configLocation;

    if (not file.IsDir(configDir, "DATA")) then file.CreateDir(configDir) end;

    GAME_CONFIG = DEFAULT_CONFIG;

    if (file.Exists(modConfig, "GAME")) then
        print("Loading NORMAL configurations from file ", modConfig);
        GAME_CONFIG = util.JSONToTable(file.Read(modConfig, "GAME"));
    else
        print("Creating new file with DEFAULT configurations at ", modConfig);
        file.Write(configLocation, util.TableToJSON(DEFAULT_CONFIG, true));
    end
end

hook.Add("Initialize", "c13LoadConfig", initializeConfig);

---getConfigSetting
---@param key string
---@return any
function getConfigSetting(key)
    return GAME_CONFIG[key];
end
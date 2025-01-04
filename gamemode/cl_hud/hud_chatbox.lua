---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by themaw.
--- DateTime: 12/21/24 9:06 PM
---
---
local sh = ScrH();

local trim = string.Trim;

local chatW, chatH = 500, 300;
local cx, cy = 50, sh - 500;

local setDrawColor = surface.SetDrawColor;
local drawRect = surface.DrawRect;

chatBox = chatBox or {};

---openChatbox
local function openChatbox()
    if (not chatBox.frame) then
        chatBox.frame = vgui.Create("C13_Frame")
        chatBox.frame:SetPos(cx, cy);
        chatBox.frame:SetSize(chatW, chatH)
        chatBox.frame.Paint = function(_, w, h)
            if (not chatBox.visible) then
                return
            end

            setDrawColor(MAIN_BG_COLOR.r, MAIN_BG_COLOR.g, MAIN_BG_COLOR.b, MAIN_BG_COLOR.a);
            drawRect(0, 0, w, h);
        end;

        chatBox.RichText = vgui.Create("RichText", chatBox.frame)
        chatBox.RichText:Dock(FILL);

        function chatBox.RichText:PerformLayout()

            if (self:GetFont() ~= "c13_chatfont_outlined") then
                self:SetFontInternal("c13_chatfont_outlined")
            end
        end

        chatBox.TextEntry = vgui.Create("DTextEntry", chatBox.frame)
        chatBox.TextEntry:Dock(BOTTOM)
        chatBox.TextEntry:SetFont("c13_chatfont")
        chatBox.TextEntry.OnEnter = function(s)
            chat.AddText(s:GetValue())
        end

        -- From Wiki Garrysmod
        chatBox.TextEntry.OnKeyCodeTyped = function(self, code)
            if code == KEY_ESCAPE then
                -- Work around to hide the chatbox when the client presses escape
                chatBox.closeChatbox()
                gui.HideGameUI()
            elseif code == KEY_ENTER then
                -- Replicate the client pressing enter
                if trim(self:GetText()) ~= "" then
                    LocalPlayer():ConCommand("say " .. self:GetText())
                end

                chatBox.closeChatbox()
            end
        end
    end
end

hook.Add("PlayerBindPress", "c13_chatBinds", function(_, bind, _)
    local bTeam;

    if (bind == "messagemode") then
        bTeam = false;
    elseif (bind == "messagemode2") then
        bTeam = true
    else
        return
    end

    chatBox.openChatbox(bTeam)

    return true;
end)

---ChatText
---@param _ number
---@param _ string
---@param text string
---@param type string
---@return boolean
function GM:ChatText(_, _, text, type)
    if type == "joinleave" or type == "none" then
        chatBox.RichText:AppendText(text .. "\n")
    end
end


-- OVERRIDE THE OLD CHAT TEXT TO INJECT OUR OWN CODE. From Wiki Garrysmod <---
local oldAddText = chat.AddText;

---AddText
function chat.AddText(...)
    local args = { ... } -- Create a table of varargs

    for _, obj in ipairs(args) do
        if type(obj) == "table" then
            -- We were passed a color object
            chatBox.RichText:InsertColorChange(obj.r, obj.g, obj.b, 255)
        elseif type(obj) == "string" then
            -- This is just a string
            chatBox.RichText:AppendText(obj)
        elseif obj:IsPlayer() then
            local col = GAMEMODE:GetTeamColor(obj) -- Get the player's team color
            chatBox.RichText:InsertColorChange(col.r, col.g, col.b, 255) -- Make their name that color
            chatBox.RichText:AppendText(obj:Nick())
        end
    end

    -- Gotta end our line for this message
    chatBox.RichText:AppendText("\n")

    -- Call the original function
    oldAddText(...)
end

---openChatbox
---@param bTeam boolean
function chatBox.openChatbox(bTeam)
    openChatbox(bTeam);

    chatBox.visible = true;

    chatBox.RichText:SetVerticalScrollbarEnabled(true);

    -- MakePopup calls the input functions so we don't need to call those
    chatBox.frame:MakePopup();
    chatBox.TextEntry:SetVisible(true);
    chatBox.TextEntry:RequestFocus();

    hook.Run("StartChat")

    -- More stuff
end

---closeChatbox
function chatBox.closeChatbox()
    chatBox.visible = false;
    -- Give the player control again
    chatBox.frame:SetMouseInputEnabled(false)
    chatBox.frame:SetKeyboardInputEnabled(false)
    gui.EnableScreenClicker(false)

    chatBox.RichText:SetVerticalScrollbarEnabled(false);

    -- We are done chatting
    hook.Run("FinishChat")

    -- Clear the text entry
    chatBox.TextEntry:SetText("")
    chatBox.TextEntry:SetVisible(false);

    hook.Run("ChatTextChanged", "")

    -- More stuff
end
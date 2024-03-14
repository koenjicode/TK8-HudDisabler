local config = require "config"
local is_hidden = false

function hideGenericWidget(tk8_widget, should_hide_widget)
    if not tk8_widget:IsValid() then
        print("Widget Not Found")
        return
    end

    if should_hide_widget then
        tk8_widget:SetVisibility(2)
    else
        tk8_widget:SetVisibility(0)
    end
end

function hideHud()
    if is_hidden then
        is_hidden = false
    else
        is_hidden = true
    end

    if config.disable_guide_text then
        local _tk8_guideButton = FindFirstOf("WBP_UI_Guide_Button_C")
        if _tk8_guideButton:IsValid() then
            local _guide_canvas = _tk8_guideButton.HorizontalBox_206
            if is_hidden then
                _guide_canvas:SetVisibility(2)
            else
                _guide_canvas:SetVisibility(0)
            end
        else
            print("Guide Widget Not Present")
        end
    end

    if config.disable_game_messages then
        local _tk8_battle_messages = FindFirstOf("WBP_UI_GameMessage_C")
        hideGenericWidget(_tk8_battle_messages, is_hidden)
    end

    if config.disable_battle_hud then
        local _tk8_widgets = {
            FindFirstOf("WBP_UI_HUD_C"),
            FindFirstOf("WBP_UI_FPS_C"),
            FindFirstOf("WBP_UI_Practice_C"),
            FindFirstOf("WBP_UI_Replay_C"),
            FindFirstOf("WBP_UI_Replay_Info_C"),
        }

        for i, w in ipairs(_tk8_widgets) do
            if w:IsValid() then
                hideGenericWidget(w, is_hidden)

                if i == 5 then
                    local _replay_imgs = {
                        w.Image_BG,
                        w.Rep_T_UI_RE_Icon,
                        w.T_UI_RE_Disabled,
                    }

                    for i2, v in ipairs(_replay_imgs) do
                        if v:IsValid() then
                            hideGenericWidget(v, is_hidden)
                        end
                    end
                end
            end
        end
    end

    if config.hide_all_hud then
        local _ui_widgets = FindAllOf("Widget")
        for i, v in pairs(_ui_widgets) do
            if is_hidden then
                hideGenericWidget(v, true)
            end
        end
    end
end

RegisterKeyBind(config.toggle_key_bind, hideHud)
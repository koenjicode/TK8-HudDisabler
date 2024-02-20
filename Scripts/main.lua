local UEHelpers = require("UEHelpers")

-- LUA SETTINGS #START
toggleKeyBind = Key.F9 -- The key that's pressed to toggle your hud!

hideBattleHud = true -- Hides HUD elements used in Battle.
hideGameMessages = true -- Hides Battle Messages (Round 1, Round 2, You Win, etc)
hideGuideText = true -- Removes guide text info.

-- Experimental
hideAllHud = false -- Hides every hud element - Menus, Everything! (Not Recommended)

-- LUA SETTINGS #END

function HideGenericWidget(tk8_widget, shouldHideWidget)
    if not tk8_widget:IsValid() then
        print("Widget Not Found")
        return
    end

    if shouldHideWidget then
        tk8_widget:SetVisibility(2)
    else
        tk8_widget:SetVisibility(0)
    end
end

function HideHud()
    if shouldHide then
        print("Hud Options Enabled")
        shouldHide = false
    else
        print("Hud Options Disabled")
        shouldHide = true
    end

    if hideGuideText then
        tk8_guideButton = FindFirstOf("WBP_UI_Guide_Button_C")
        if tk8_guideButton:IsValid() then
            guideCanvas = tk8_guideButton.HorizontalBox_206
            if shouldHide then
                guideCanvas:SetVisibility(2)
            else
                guideCanvas:SetVisibility(0)
            end
        else
            print("Guide Widget Not Present")
        end
    end

    if hideGameMessages then
        tk8_battlemessages = FindFirstOf("WBP_UI_GameMessage_C")
        HideGenericWidget(tk8_battlemessages, shouldHide)
    end

    if hideBattleHud then
        tk8_hudPlayer = FindFirstOf("WBP_UI_HUD_C")
        tk8_fps = FindFirstOf("WBP_UI_FPS_C")
        tk8_practice = FindFirstOf("WBP_UI_Practice_C")
        tk8_replay = FindFirstOf("WBP_UI_Replay_C")
        tk8_replay_info = FindFirstOf("WBP_UI_Replay_Info_C")

        HideGenericWidget(tk8_hudPlayer, shouldHide)
        HideGenericWidget(tk8_fps, shouldHide)
        HideGenericWidget(tk8_practice, shouldHide)
        HideGenericWidget(tk8_replay, shouldHide)

        if tk8_replay_info:IsValid() then
            replay_img1 = tk8_replay_info.Image_BG
            replay_img2 = tk8_replay_info.Rep_T_UI_RE_Icon
            replay_img3 = tk8_replay_info.T_UI_RE_Disabled
            HideGenericWidget(replay_img1, shouldHide)
            HideGenericWidget(replay_img2, shouldHide)
            HideGenericWidget(replay_img3, true)
        end
    end

    if hideAllHud then
        UIWidgets = FindAllOf("Widget")
        local Widget = nil
        for Index,Widget in pairs(UIWidgets) do
            if shouldHide then
                HideGenericWidget(Widget, true)
            end
        end
    end
end

RegisterKeyBind(toggleKeyBind, HideHud)
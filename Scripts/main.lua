local UEHelpers = require("UEHelpers")

-- LUA SETTINGS #START
hideBattleHud = true -- Hides Top Bar Hud
hideGameMessages = true -- Hides Battle Messages (Round 1, Round 2, You Win, etc)
hideGuideText = true -- Removes guide text info.
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
        HideGenericWidget(tk8_guideButton, shouldHide)
    end

    if hideGameMessages then
        tk8_battlemessages = FindFirstOf("WBP_UI_GameMessage_C")
        HideGenericWidget(tk8_battlemessages, shouldHide)
    end

    if hideBattleHud then
        tk8_hudPlayer = FindFirstOf("WBP_UI_HUD_C")
        HideGenericWidget(tk8_hudPlayer, shouldHide)
    end
end

RegisterKeyBind(Key.F9, HideHud)
local UEHelpers = require("UEHelpers")

-- DONT TOUCH

allowHook = true

hiddenTopBar = false
hiddenGuideMenu = false
hiddenEverything = false

function HideGameMessages(forceVisibility, shouldHide)
    tk8_battlemessages = FindFirstOf("WBP_UI_GameMessage_C")
    if not tk8_battlemessages:IsValid() then
        print("Battle Messages Cannot be found")
        return
    end

    if forceVisibility then
        if shouldHide then
            tk8_battlemessages:SetVisibility(2)
        else
            tk8_battlemessages:SetVisibility(0)
        end
    end
end

function HideTopBar(forceVisibility, shouldHide)
    tk8_hudPlayer = FindFirstOf("WBP_UI_HUD_C")
    if not tk8_hudPlayer:IsValid() then
        print("Hud Player Cannot be found")
        return
    end

    if forceVisibility then
        if shouldHide then
            tk8_hudPlayer:SetVisibility(2)
            hiddenTopBar = true
        else
            tk8_hudPlayer:SetVisibility(0)
            hiddenTopBar = false
        end
    else
        if hiddenTopBar then
            tk8_hudPlayer:SetVisibility(0)
            hiddenTopBar = false
        else
            tk8_hudPlayer:SetVisibility(2)
            hiddenTopBar = true
        end
    end
end

function HideGuideMenu(forceVisibility, shouldHide)
    tk8_guideButton = FindFirstOf("WBP_UI_Guide_Button_C")
    if not tk8_guideButton:IsValid() then
        print("Guide button could not be found")
        return
    end

    if forceVisibility then
        if shouldHide then
            tk8_guideButton:SetVisibility(2)
            hiddenGuideMenu = true
        else
            tk8_guideButton:SetVisibility(0)
            hiddenGuideMenu = false
        end
    else
        if hiddenGuideMenu then
            tk8_guideButton:SetVisibility(0)
            hiddenGuideMenu = false
        else
            tk8_guideButton:SetVisibility(2)
            hiddenGuideMenu = true
        end
    end
end

function HideEverything()
    if hiddenEverything then
        hiddenEverything = false
    else
        hiddenEverything = true
    end

    HideTopBar(true, hiddenEverything)
    HideGuideMenu(true, hiddenEverything)
    HideGameMessages(true, hiddenEverything)
end

RegisterKeyBind(Key.F8, HideGuideMenu)
RegisterKeyBind(Key.F9, HideEverything)
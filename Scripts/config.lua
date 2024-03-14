-- Here you can adjust the settings for the Tekken Hud Disabler!

local _hud_disabler_config = {
    -- The key that's pressed to toggle your listed hud options
    toggle_key_bind = Key.F9,

    -- Hides HUD elements used in Battle.
    disable_battle_hud = true,

    -- Hides Battle Messages (Round 1, Round 2, You Win, etc)
    disable_game_messages = true,

    -- Removes guide text info (Replay Menu Controls, What buttons to press for menus, etc)
    disable_guide_text = true,

    -- THIS OPTION IS VERY EXPERIMENTAL, NOT RECOMMEND NOT TO ENABLE THIS.
    -- Hides every hud element - Menus, Everything!
    hide_all_hud = false,
}

return _hud_disabler_config
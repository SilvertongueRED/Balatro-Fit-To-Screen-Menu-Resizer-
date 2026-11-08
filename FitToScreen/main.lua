-- Fit To Screen
-- The extra top and bottom room comes from lovely.toml (ROOM_PADDING_H).
-- This file keeps the All-In-Jest Load Bearing Coconut counter ("1/1") off screen.
-- All-In-Jest parks that card area a few tiles above the top of the screen on purpose.
-- With more room at the top, its count label shows up, so this pushes the area further up.
-- It is done from here, not by editing All-In-Jest, so All-In-Jest updates cannot undo it.

local EXTRA_TILES_UP = 4

local function push_coconut_area_up(game)
    local area = game and game.aij_coconut_holder
    if not area or area.fts_pushed then return end
    area.fts_pushed = true
    area.T.y = area.T.y - EXTRA_TILES_UP
    if area.hard_set_T then area:hard_set_T() end
    for _, card in ipairs(area.cards or {}) do
        card.T.y = card.T.y - EXTRA_TILES_UP
        if card.hard_set_T then card:hard_set_T() end
    end
end

-- Called by Steamodded when a run's card areas are created.
-- The move is queued as an event so it runs after every mod has created its areas.
function SMODS.current_mod.custom_card_areas(game)
    G.E_MANAGER:add_event(Event({
        blockable = false,
        blocking = false,
        func = function()
            local ok, err = pcall(push_coconut_area_up, game)
            if not ok then print("FitToScreen: could not move the coconut area: " .. tostring(err)) end
            return true
        end,
    }))
end

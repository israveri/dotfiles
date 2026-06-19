require("core.rules.firefox")
require("core.rules.discord")
require("core.rules.kitty")
require("core.rules.gamescope")
require("core.rules.gnome-calculator")
require("core.rules.mission-center")
require("core.rules.noctalia")
require("core.rules.steam")
require("core.rules.xwayland")

-- ─── Global rules ───────────────────────────────────
-- Ignore maximize requests from apps
hl.window_rule({
    match          = { class = ".*" },
    suppress_event = "maximize",
})

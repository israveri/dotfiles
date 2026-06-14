-- Reload manually on demand
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd("hyprctl reload"))

-- Notification when reload happens
hl.on("config.reloaded", function()
    hl.notification.create({ text = "Hyprland reloaded.", timeout = 2000 })
end)

-- Basic Movement
-- hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "r+1" }))
-- hl.bind("SUPER + CTRL + left",  hl.dsp.focus({ workspace = "r-1" }))

-- Miscelaneous changes
hl.config({
    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        focus_on_activate        = true,
        on_focus_under_fullscreen = 0,

        font_family = "Inter"
    },

    binds = {
        hide_special_on_workspace_change = true,
    }
})

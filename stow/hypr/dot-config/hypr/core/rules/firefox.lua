hl.window_rule({
    name = "firefox-pip",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    pin = true,
    no_initial_focus = true,
    suppress_event = "activate",
    opacity = "1.0 1.0 override",
    size = { 512, 288 }, -- 800 450 | 512 288 | 400 225
    move = { "monitor_w * 1 - 532", "monitor_h * 1 - 308" }, -- 820 470 | 532 308 | 420 245
})

Helpers.avoid_auto_focus_floating_window("Picture-in-Picture")

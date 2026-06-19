hl.window_rule({
    name = "screenshare-notification-positioning",
    match = { title = "^(discord.com is sharing your screen.)$" },
    float = true,
    pin = true,
    no_initial_focus = true,
    suppress_event = "activate",
    size = { 450, 65 },
    move = { "monitor_w * 0.5 - 225", "monitor_h * 1 - 77" },
})

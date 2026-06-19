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

hl.on("workspace.active", function(ws)
    for _, w in ipairs(hl.get_windows({ workspace = ws.id})) do
        if w.title ~= "discord.com is sharing your screen." then
            hl.dispatch(hl.dsp.focus({ window = w }))
            return
        end
    end
end)

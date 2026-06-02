-- Fix some dragging issues with XWayland
hl.window_rule({
    match       = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
    no_focus    = true,
})

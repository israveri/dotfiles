hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "intl",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 2,
        repeat_rate = 35,
        repeat_delay = 200,
        sensitivity = 0.5,

        touchpad = {
            natural_scroll = true,
            clickfinger_behavior = true,
            scroll_factor = 0.2,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

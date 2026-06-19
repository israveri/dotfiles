-- Check noctalia/palette.json to get a cheatsheet of the colors
return {
    -- Surfaces: use terminal background/foreground as the base
    bg          = "{{colors.terminal_background.default.hex}}",
    bg_alt      = "{{colors.terminal_normal_black.default.hex}}",
    fg          = "{{colors.terminal_foreground.default.hex}}",
    fg_muted    = "{{colors.terminal_bright_black.default.hex}}",
    fg_subtle   = "{{colors.terminal_bright_black.default.hex | darken 10}}",

    -- Mode accent colors
    normal      = "{{colors.terminal_foreground.default.hex}}",
    on_normal   = "{{colors.terminal_background.default.hex}}",
    insert      = "{{colors.terminal_normal_blue.default.hex}}",
    on_insert   = "{{colors.terminal_background.default.hex}}",
    visual      = "{{colors.terminal_normal_yellow.default.hex}}",
    on_visual   = "{{colors.terminal_background.default.hex}}",
    replace     = "{{colors.terminal_normal_red.default.hex}}",
    on_replace  = "{{colors.terminal_background.default.hex}}",
    command     = "{{colors.terminal_normal_magenta.default.hex}}",
    on_command  = "{{colors.terminal_background.default.hex}}",
    pending     = "{{colors.terminal_normal_cyan.default.hex}}",
    on_pending  = "{{colors.terminal_background.default.hex}}",
}

-- ─── General ─────────────────────────────────────────────────────────────────
hl.config({
    general = {
        allow_tearing    = false,
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        resize_on_border = false,
    },
})

-- ─── Decoration ──────────────────────────────────────────────────────────────
hl.config({
    decoration = {
        rounding       = 20,
        rounding_power = 0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },
})

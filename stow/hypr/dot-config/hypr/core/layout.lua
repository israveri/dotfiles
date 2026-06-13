hl.config({
    general = { layout = "dwindle" },

    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },
    scrolling = {
        column_width = 0.9,
        focus_fit_method = 0,
    }
})

hl.workspace_rule({ workspace = "10", layout = "scrolling" })


hl.config({
    general = { layout = "dwindle" },

    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },

    scrolling = {
        column_width = 0.96,
        focus_fit_method = 1,
    }
})

hl.workspace_rule({ workspace = "9", layout = "scrolling" })
hl.workspace_rule({ workspace = "10", layout = "scrolling" })


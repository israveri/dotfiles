hl.config({
    general = { layout = "scrolling" },

    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },

    scrolling = {
        column_width = 0.96,
        focus_fit_method = 1,
    }
})

hl.workspace_rule({ workspace = "1", layout = "dwindle" })
hl.workspace_rule({ workspace = "2", layout = "dwindle" })
hl.workspace_rule({ workspace = "3", layout = "dwindle" })


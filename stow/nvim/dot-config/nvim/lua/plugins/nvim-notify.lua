return {
    "rcarriga/nvim-notify",
    opts = {
        stages = "fade_in_slide_out",  -- or: "fade", "slide", "static"
        render = "default",            -- or: "minimal", "simple", "compact"
        timeout = 3000,
        max_width = 80,
    },
    config = function(_, opts)
        local notify = require("notify")

        notify.setup(opts)
        vim.notify = notify
    end,
}

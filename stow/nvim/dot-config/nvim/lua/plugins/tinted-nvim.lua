return {
    "tinted-theming/tinted-nvim",
    priority = 1000,
    lazy = false,
    opts = {
        selector = {
            enabled = true,
        },
        schemes = {
            ["base24-gruvbox-dark"] = {
                base08 = function(palette) return palette.base12 end,
                base0A = function(palette) return palette.base13 end,
                base0B = function(palette) return palette.base14 end,
                base0C = function(palette) return palette.base15 end,
                base0D = function(palette) return palette.base16 end,
                base0E = function(palette) return palette.base17 end,
            },
        }
    },
}

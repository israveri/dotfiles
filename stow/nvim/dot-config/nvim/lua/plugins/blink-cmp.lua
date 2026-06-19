return {
    'saghen/blink.cmp',
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = "none",
            ["<S-Up>"] = { "select_prev", "fallback" },
            ["<S-Down>"] = { "select_next", "fallback" },
            ["<Tab>"] = { "accept", "fallback" },
            ["<S-CR>"] = { "accept", "fallback" },
            ["<C-Up>"] = { "scroll_documentation_up", "fallback" },
            ["<C-Down>"] = { "scroll_documentation_down", "fallback" },
            ["<C-Space>"] = { "show", "fallback" },
        },

        appearance = {
            nerd_font_variant = 'mono'
        },

        signature = { enabled = true },

        completion = {
            documentation = { auto_show = true },
            menu = {
                draw = {
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                local icon = ctx.kind_icon

                                if ctx.item.source_name == "LSP" then
                                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
                                    { kind = ctx.kind })
                                    if color_item and color_item.abbr ~= "" then
                                        icon = color_item.abbr
                                    end
                                end

                                return icon .. ctx.icon_gap
                            end,

                            highlight = function(ctx)
                                local highlight = "BlinkCmpKind" .. ctx.kind

                                if ctx.item.source_name == "LSP" then
                                    local color_item = require("nvim-highlight-colors").format(ctx.item.documentation,
                                    { kind = ctx.kind })

                                    if color_item and color_item.abbr_hl_group then
                                        highlight = color_item.abbr_hl_group
                                    end
                                end
                                return highlight
                            end

                        }
                    }
                }
            }
        },
    },
    opts_extend = { "sources.default" }
}

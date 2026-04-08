return {
    'saghen/blink.cmp',
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
	keymap = {
	    preset = "none",
	    ["<C-k>"] = { "select_prev", "fallback" },
	    ["<C-j>"] = { "select_next", "fallback" },
	    ["<Up>"] = { "select_prev", "fallback" },
	    ["<Down>"] = { "select_next", "fallback" },
	    ["<Tab>"] = { "accept", "fallback" },
	    ["<CR>"] = { "accept", "fallback" },
	    ["<C-y>"] = { "accept", "fallback" },
	    ["<Esc>"] = { "cancel", "fallback" },
	    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
	    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
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

return {
	'saghen/blink.cmp',
	dependencies = {},

	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },

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

return {
	'saghen/blink.cmp',
	dependencies = {},

	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "default" },

		appearance = {
			nerd_font_variant = 'mono'
		},

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

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}

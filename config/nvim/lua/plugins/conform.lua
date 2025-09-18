return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader><C-f>",
			function()
				require("conform").format()
			end,
			desc = "Conform: [F]ormat file",
		},
	},
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
		},
	},
}

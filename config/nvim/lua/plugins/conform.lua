return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format()
			end,
			desc = "Conform: [F]ormat file",
		},
	},
	opts = {
		format_on_save = {
			timeout_ms = 1000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			bash = { "shfmt" },
			lua = { "emmylua_ls" },
			ruby = { "standardrb" },
			sh = { "shfmt" },
			html = { "prettierd" },
			css = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
		},
		
		formatters = {
			-- emmylua_ls = {
			-- 	command = function()
			-- 		return function(bufnr)
			-- 			vim.lsp.buf.format({ bufnr = bufnr })
			-- 		end
			-- 	end
			-- },
		},
	},
}

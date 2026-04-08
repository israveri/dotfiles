return {
    "stevearc/conform.nvim",
    keys = {
	{ "<leader>cf", function() require("conform").format() end, desc = "Conform: [F]ormat file" },
    },
    opts = {
	format_on_save = {
	    timeout_ms = 1000,
	    lsp_format = "fallback",
	},
	formatters_by_ft = {
	    bash = { "shfmt" },
	    css = { "prettierd" },
	    go = { "goimports" },
	    html = { "prettierd" },
	    javascript = { "prettierd" },
	    lua = { "stylua" },
	    ruby = { "standardrb" },
	    sh = { "shfmt" },
	    typescript = { "prettierd" },
	},
    }
}

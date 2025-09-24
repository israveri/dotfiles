vim.lsp.enable({
    "bashls",
    "gopls",
    "luals",
    "rubyls",
})

-- Diagnostics
vim.diagnostic.config({
	virtual_lines = { current_line = true },
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = { source = true, border = "solid" },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

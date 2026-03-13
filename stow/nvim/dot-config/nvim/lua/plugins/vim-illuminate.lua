return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
	require("illuminate").configure({
	    providers = { "lsp", "treesitter", "regex" },
	    delay = 100,
	    filetypes_denylist = {},
	    filetypes_allowlist = {},
	    under_cursor = true,
	    large_file_cutoff = 2000,
	    large_file_overrides = {
		providers = { "lsp" },
	    },
	})
    end,
}

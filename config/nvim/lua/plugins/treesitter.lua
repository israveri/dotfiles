return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },

	incremental_selection = {
	    enable = true,
	    keymaps = {
		init_selection = "<Enter>",
		node_incremental = "<Enter>",
		scope_incremental = false,
		node_decremental = "<BS>",
	    },
	},

	ensure_installed = {
	    "bash",
	    "c",
	    "elixir",
	    "erlang",
	    "go",
	    "help",
	    "html",
	    "javascript",
	    "lua",
	    "markdown",
	    "python",
	    "ruby",
	    "typescript",
	    "vim",
	    "vimdoc",
	},
    }
}

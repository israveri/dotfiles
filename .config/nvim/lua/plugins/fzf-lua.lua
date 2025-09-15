return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    event = "VeryLazy",
    keys = {
	-- Keymaps for fuzzy search of files
	{ "<C-p>",      function() require("fzf-lua").files() end, desc = "Search file" },
	{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Search file" },

	-- Keymap to be able to serch neovim confi files from anywhere in the system
	{ "<leader>fc", function() require("fzf-lua").files({ cmd = vim.fn.stdpath("config") }) end, desc = "Searh in neovim config" },

	-- Other useful keymaps
	{ "<leader>fg", function() require("fzf-lua").grep() end, desc = "Search with grep" },
	{ "<leader>fl", function() require("fzf-lua").live_grep() end, desc = "Search with live grep" },
	{ "<leader>fs", function() require("fzf-lua").lgrep_curbuf() end, desc = "Searh in current buffer" },
	{ "<leader>fo", function() require("fzf-lua").buffers() end, desc = "Searh in opened buffers" },

    },
    opts = {
	files = { hidden = true },
	grep = { hidden = true }
    },
}

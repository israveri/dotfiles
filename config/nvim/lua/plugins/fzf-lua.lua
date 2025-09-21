return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    event = "VeryLazy",
    keys = {
	-- Keymaps for fuzzy search of files
	{ "<C-p>",      function() require("fzf-lua").files() end, desc = "Search and [f]ind [f]ile" },
	{ "<leader>ff", function() require("fzf-lua").files() end, desc = "Search and [f]ind [f]ile" },

	-- Keymap to be able to serch neovim confi files from anywhere in the system
	{ "<leader>fc", function() require("fzf-lua").files({ cmd = vim.fn.stdpath("config") }) end, desc = "Searh and [f]ind neovim [c]onfig" },

	-- Other useful keymaps
	{ "<leader>fl", function() require("fzf-lua").live_grep() end, desc = "Search and [f]ind with [l]ive grep" },
	{ "<leader>fg", function() require("fzf-lua").grep() end, desc = "Search and [f]ind with [g]rep" },
	{ "<leader>fh", function() require("fzf-lua").helptags() end, desc = "Search and [f]ind in [h]elp docs" },
	{ "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Search and [f]ind in [k]eymaps" },
	{ "<leader>fb", function() require("fzf-lua").builtin() end, desc = "Search and [f]ind [b]uiltin finders" },
	{ "<leader>fw", function() require("fzf-lua").grep_cword() end, desc = "Search and [f]ind current [w]ord" },
	{ "<leader>fW", function() require("fzf-lua").grep_cWORD() end, desc = "Search and [f]ind current [W]ORD" },
	{ "<leader>fr", function() require("fzf-lua").resume() end, desc = "Search and [f]ind and [r]esume the search again" },
	{ "<leader>fo", function() require("fzf-lua").oldfiles() end, desc = "Search and [f]ind [o]ld opened files" },
	{ "<leader><leader>", function() require("fzf-lua").buffers() end, desc = "Search and find opened buffers" },
	{ "<leader>/", function() require("fzf-lua").lgrep_curbuf() end, desc = "Search and find in current buffer" },

    },
    opts = {
	files = { hidden = true },
	grep = { hidden = true },
	file_ignore_patterns = {
	    ".git/",
	    "node_modules/",
	    "submodules/",
	},
    },
}

return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
	{ "<C-p>", function() require("fzf-lua").files() end, desc = "Find file in current working directory" },
	{ "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Find by grepping in current working directory" },
	{ "<leader><C-,>", function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config files from anywhere" },
    },
    opts = {},
}

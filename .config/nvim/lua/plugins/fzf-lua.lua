return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
	{ "<C-p>", "<cmd>FzfLua files<cr>", desc = "Find file with fuzzy search" }
    },
    opts = {},
}

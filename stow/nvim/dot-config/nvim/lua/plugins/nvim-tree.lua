return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
	"nvim-tree/nvim-web-devicons",
    },
    opts = {
	view = {
	    width = 40,
	    side = "left",
	},

	on_attach = function(bufnr)
	    local api = require("nvim-tree.api")

	    -- This line ensures the default keymaps are set, so we
	    -- can override what we want after, otherwise we lose
	    -- all default keymaps.
	    api.config.mappings.default_on_attach(bufnr)

	    local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	    end

	    vim.keymap.set("n", "<Left>", api.node.navigate.parent_close, opts("Collapse folder"))
	    vim.keymap.set("n", "<Right>", api.node.open.edit, opts("Expand/Open"))
	    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Expand/Open"))
	    vim.keymap.set("n", "<C-CR>", api.node.open.vertical, opts("Open in vertical split"))
	    vim.keymap.set("n", "<S-CR>", api.node.open.horizontal, opts("Open in horizontal split"))

	    -- Disables "-" inside nvim-tree
	    vim.keymap.set("n", "-", "<Nop>", opts("Disabled"))
	end,
    },
    config = function(_, opts)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	require("nvim-tree").setup(opts)
    end,
    keys = {
	{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggles file explorer" },
	{ "-", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in tree" },
    },
}

return {
    "jiaoshijie/undotree",
    enabled = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
	{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
    },
    ---@module 'undotree.collector'
    ---@type UndoTreeCollector.Opts
    opts = {
	position = "right",
    },
}

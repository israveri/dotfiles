return {
    "mfussenegger/nvim-treehopper",
    opts = {},
    config = function(_, opts)
	vim.keymap.set({"n", "x"}, "m", function()
	    require("tsht").nodes()
	end, { desc = "Select Treesitter node" })

	vim.keymap.set({"n", "x"}, "M", function()
	    require("tsht").nodes({ ignore = { "comment" }})
	end, { desc = "Select Treesitter node (ignoring comments)" })

    end,
}

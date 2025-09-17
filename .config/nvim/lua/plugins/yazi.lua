-- Yazi has problem correctly initializing after nvim 0.10+
-- This autocmd allows lazy to load the plugin at the correct
-- time so netrw can be successfuly switched
--
-- See https://github.com/mikavilpas/yazi.nvim/discussions/129#discussioncomment-10204529
vim.api.nvim_create_autocmd("UiEnter", {
    callback = function()
	require("yazi").setup({
	    open_for_directories = true,

	    keymaps = {
		show_help = "<F1>",
	    },

	    integrations = {
		grep_in_directory = function(directory)
		    require("fzf-lua").live_grep({directory})
		end,
	    }
	})
    end
})

return {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
	{ "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
	{ mode = { "n", "v" }, "-", "<cmd>Yazi<cr>", desc = "Open Yazi at the current file" },
	{ mode = "n", "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open Yazi in nvim's current working directory" },
	{ mode = "n", "<c-Up>", "<cmd>Yazi toggle<cr>", desc = "Resume last Yazi session" },
    },
}

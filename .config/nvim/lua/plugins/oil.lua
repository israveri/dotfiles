return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    lazy = false,
    keys = {
	{ "-", "<cmd>Oil --float --preview<cr>", desc = "Open file explorer in Oil" }
    },
    dependencies = {
	{ "nvim-tree/nvim-web-devicons", lazy = true },
    },
    opts = {
	delete_to_trash = false,
	skip_confirm_for_simple_edits = true,
	view_options = {
	    show_hidden = true,
	    natural_order = true,
	    is_always_hidden = function(name, _)
		return name == ".." or name == ".git"
	    end,
	},
	win_option = {
	    wrap = true,
	},
	float = {
	    preview_split = "right",
	},
    }
}

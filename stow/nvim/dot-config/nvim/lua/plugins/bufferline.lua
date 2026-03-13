return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
	options = {
	    always_show_bufferline = true,
	    show_buffer_icons = true,
	    show_buffer_tabs = true,
	    show_close_icon = true,
	    separator_style = "slant", -- thin, slant, slope
	    diagnostics = "nvim_lsp",
	    numbers = "ordinal", -- buffer_id, ordinal
	},
    },
    config = function(_, opts)
	vim.opt.termguicolors = true
	require("bufferline").setup(opts)
    end,
}

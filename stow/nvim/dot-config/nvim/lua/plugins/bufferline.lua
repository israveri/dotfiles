return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
	options = {
	    themable = true,
	    always_show_bufferline = true,
	    show_buffer_icons = true,
	    show_buffer_tabs = true,
	    show_close_icon = true,
	    separator_style = "slant", -- thin, slant, slope
	    diagnostics = "nvim_lsp",
	    offsets = {
		{
		    filetype = "NvimTree",
		    text = "File Explorer",
		    text_align = "left",
		    separator = true,
		}
	    },
	    indicator = {
		style = "underline"
	    },
	},
	highlights = {
	},
    },
    config = function(_, opts)
	vim.opt.termguicolors = true
	require("bufferline").setup(opts)

	-- Keymaps
	vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Bufferline: Cycles to the next buffer" })
	vim.keymap.set("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Bufferline: Cycles to the previous buffer" })
	vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Bufferline: [b]uffer [p]ick" })
	vim.keymap.set("n", "<leader>bq", "<cmd>BufferLinePickClose<cr>", { desc = "Bufferline: [b]uffer [q]uit" })
	vim.keymap.set("n", "<leader>b.", "<cmd>BufferLineTogglePin<cr>", { desc = "Bufferline: [b]uffer pinning" })
    end,
}

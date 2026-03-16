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
	    separator_style = "thin", -- thin, slant, slope
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
		--    fill = {
		-- bg = { attribute = "bg", highlight = "Normal" },
		--    },
		--
		--    background = {
		-- fg = { attribute = "fg", highlight = "Normal" },
		-- bg = { attribute = "bg", highlight = "Normal" },
		--    },
		--
		--    buffer_visible = {
		-- fg = { attribute = "fg", highlight = "Comment" },
		-- bg = { attribute = "bg", highlight = "Normal" },
		--    },
		--
		--    buffer_selected = {
		-- bold = true,
		-- fg = { attribute = "fg", highlight = "Normal" },
		-- bg = { attribute = "bg", highlight = "Normal" },
		--    },
		--
		--    indicator_selected = {
		-- fg = { attribute = "fg", highlight = "Keyword" },
		-- bg = { attribute = "bg", highlight = "Normal" },
		--    },
		--
		--    separator = {
		-- fg = { attribute = "bg", highlight = "Normal" },
		-- bg = { attribute = "bg", highlight = "Normal" },
		--    },
		--
		--    separator_selected = {
		-- fg = { attribute = "bg", highlight = "Normal" },
		-- bg = { attribute = "bg", highlight = "Normal" },
		--    },
	},
    },
    config = function(_, opts)
	vim.opt.termguicolors = true
	require("bufferline").setup(opts)

	-- Keymaps
	vim.keymap.set("n", "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Cycles to the next buffer" })
	vim.keymap.set("n", "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Cycles to the previous buffer" })
	vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<cr>", { desc = "Pick a buffer" })
	vim.keymap.set("n", "<leader>bq", "<cmd>BufferLinePickClose<cr>", { desc = "Pick a buffer to close" })
	vim.keymap.set("n", "<leader>b.", "<cmd>BufferLineTogglePin<cr>", { desc = "Toggles pin on buffer" })
    end,
}

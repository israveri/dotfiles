--- ---------- ---
--- Navigation ---
--- ---------- ---

-- Navigating with Ctrl + hjkl or Arrows
-- Seemlessly move into tmux windows
vim.keymap.set("n", "<A-k>", function() require("smart-splits").move_cursor_up({ at_edge = "stop" }) end)
vim.keymap.set("n", "<A-j>", function() require("smart-splits").move_cursor_down({ at_edge = "stop" }) end)
vim.keymap.set("n", "<A-h>", function() require("smart-splits").move_cursor_left({ at_edge = "stop" }) end)
vim.keymap.set("n", "<A-l>", function() require("smart-splits").move_cursor_right({ at_edge = "stop" }) end)
vim.keymap.set("n", "<A-Up>", function() require("smart-splits").move_cursor_up({ at_edge = "stop" }) end)
vim.keymap.set("n", "<A-Down>", function() require("smart-splits").move_cursor_down({ at_edge = "stop" }) end)
vim.keymap.set("n", "<A-Left>", function() require("smart-splits").move_cursor_left({ at_edge = "stop" }) end)
vim.keymap.set("n", "<A-Right>", function() require("smart-splits").move_cursor_right({ at_edge = "stop" }) end)

-- Resising panes
vim.keymap.set('n', '<C-S-h>', function() require('smart-splits').resize_left() end)
vim.keymap.set('n', '<C-S-j>', function() require('smart-splits').resize_down() end)
vim.keymap.set('n', '<C-S-k>', function() require('smart-splits').resize_up() end)
vim.keymap.set('n', '<C-S-l>', function() require('smart-splits').resize_right() end)
vim.keymap.set('n', '<C-S-Up>', function() require('smart-splits').resize_up() end)
vim.keymap.set('n', '<C-S-Down>', function() require('smart-splits').resize_down() end)
vim.keymap.set('n', '<C-S-Left>', function() require('smart-splits').resize_left() end)
vim.keymap.set('n', '<C-S-Right>', function() require('smart-splits').resize_right() end)

-- Swaps buffers between windows
vim.keymap.set('n', '<leader><C-k>', function() require('smart-splits').swap_buf_up({ move_cursor = true }) end)
vim.keymap.set('n', '<leader><C-j>', function() require('smart-splits').swap_buf_down({ move_cursor = true }) end)
vim.keymap.set('n', '<leader><C-h>', function() require('smart-splits').swap_buf_left({ move_cursor = true }) end)
vim.keymap.set('n', '<leader><C-l>', function() require('smart-splits').swap_buf_right({ move_cursor = true }) end)
vim.keymap.set('n', '<leader><C-Up>', function() require('smart-splits').swap_buf_up({ move_cursor = true }) end)
vim.keymap.set('n', '<leader><C-Down>', function() require('smart-splits').swap_buf_down({ move_cursor = true }) end)
vim.keymap.set('n', '<leader><C-Left>', function() require('smart-splits').swap_buf_left({ move_cursor = true }) end)
vim.keymap.set('n', '<leader><C-Right>', function() require('smart-splits').swap_buf_right({ move_cursor = true }) end)


-- Splitting panes
vim.keymap.set("n", "<C-w>-", ":split<cr>")
vim.keymap.set("n", "<C-w>\\", ":vsplit<cr>")

-- Keep cursor centered while moving
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Keep search result centered while moving to next
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep cursor in place when appending line below to current
vim.keymap.set("n", "J", "mzJ`z")


--- ----------------- ---
--- File Manipulation ---
--- ----------------- ---

-- Indent File
vim.keymap.set("n", "<leader>if", "gg=G", { desc = "Forces [i]ndent whole [f]ile" })

-- Paste over and KEEP original clipping
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank into +y register to take clipping into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete texto into void registry so we dont yank it
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Substitute all occurrences of word under cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Substitute all occurrences of selection
vim.keymap.set("v", "<leader>s", "y:%s/<C-r>\"/<C-r>\"/g<Left><Left>")

-- Move selection up and down
vim.keymap.set("v", "<C-M-Up>", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "<C-M-Down>", ":m '>+1<cr>gv=gv")

--- -------- ---
--- Terminal ---
--- -------- ---
vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 20)
    vim.cmd.term()
    vim.cmd.startinsert()
end)

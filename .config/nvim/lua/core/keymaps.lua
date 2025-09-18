---
--- Navigation
--- ----------
-- Keep cursor centered while moving
vim.keymap.set("n", "<C-Up>", "<C-u>zz")
vim.keymap.set("n", "<C-Down>", "<C-d>zz")

-- Keep search result centered while moving to next
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keep cursor in place when appending line below to current
vim.keymap.set("n", "J", "mzJ`z")

---
--- File Manipulation
--- -----------------
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
vim.keymap.set("v", "<M-Up>", ":m '<-2<cr>gv=gv")
vim.keymap.set("v", "<M-Down>", ":m '>+1<cr>gv=gv")


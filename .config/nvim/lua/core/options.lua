--
-- Custom configurations
--
vim.g.have_nerd_font = true             -- Declare nerd font installed and setup in terminal
vim.opt.number = true                   -- Turn on line numbers
vim.opt.relativenumber = true           -- Make line numbers relative
vim.opt.mouse = 'a'                     -- Enable mouse mode
vim.opt.showmode = false                -- Hide current mode (it's already being shown in the statusline plugin)
vim.o.breakindent = true                -- Enables breakindent
vim.o.inccommand = "split"              -- Show substitutions while you type
vim.o.cursorline = true                 -- Highlight line under cursor
vim.o.signcolumn = "yes"                -- Keeps the sign column always shown
vim.o.scrolloff = 15                    -- Minimum ammount of lines above/below the cursor
vim.o.confirm = true                    -- Show confirm dialog when trying to quit before saving
vim.o.ignorecase = true                 -- Search using case insensitive pattern
vim.o.smartcase = true                  -- Searches using case sensitive pattern ONLY IF query has upper case characters
vim.o.list = true                       -- Show special characters for whitespace indications
vim.opt.listchars = {                   -- Define wich characters are shown for whitespaces
    tab = '» ',
    trail = '·',
    nbsp = '␣'
}

-- Identation: The correct way to set up. See:
-- :h tabstop
--
-- Remember, Tabs for identation, Spaces for alignment
--
vim.opt.tabstop = 8                     -- REAL Tab character size (It keeps the default tab char size for every editor)
vim.opt.softtabstop = 4                 -- LOCAL Tab character size (It reads the tab sizing differently only locally)
vim.opt.shiftwidth = 4                  -- How many spaces a <Tab> or a <BS> moves the cursor
vim.opt.expandtab = false               -- Don't turn Tabs into Spaces with the config above
vim.opt.smartindent = true              -- Do auto indentation after some characters (eg. after '{' )
vim.opt.autoindent = true               -- Copy indentation from current line into new line

-- Clipboard: Sync OS and Neovim clipboards
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)


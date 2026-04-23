return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<Enter>",
                node_incremental = "<Enter>",
                scope_incremental = false,
                node_decremental = "<BS>",
            },
        },

        ensure_installed = {
            "bash",
            "c",
            "elixir",
            "erlang",
            "go",
            "html",
            "javascript",
            "lua",
            "markdown",
            "python",
            "ruby",
            "rust",
            "typescript",
            "vim",
            "vimdoc",
            "zsh",
        },
    },
    config = function()
        -- Syntax Highlight
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "<filetype>" },
            callback = function()
                vim.treesitter.start()
            end
        })
    end,
}

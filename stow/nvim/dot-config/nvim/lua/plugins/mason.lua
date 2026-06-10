return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                border = "solid",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = {
                "basedpyright",     -- python
                "bashls",           -- bash
                "clangd",           -- c/c++
                "cssls",            -- css
                "elixirls",         -- elixir
                "erlangls",         -- erlang
                "eslint",           -- esling (for user alongsige the lsp)
                "gopls",            -- go
                "jsonls",           -- json
                "lua_ls",           -- lua
                "ruby_lsp",         -- ruby
                "rust_analyzer",    -- rust
                "systemd_lsp",      -- systemd
                "taplo",            -- toml
                "ts_ls",            -- typescript/javascript (but use prettier for formatting)
                "vimls",            -- vim
                "yamlls",           -- yaml
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
    },
}

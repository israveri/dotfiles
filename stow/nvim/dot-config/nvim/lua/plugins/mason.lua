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
                "basedpyright",                      -- python
                "bash-language-server",              -- bash
                "clangd",                            -- c/c++
                "css-lsp",                           -- css
                "elixir-ls",                         -- elixir
                "erlangls",                          -- erlang
                "eslint-lsp",                        -- esling (for user alongsige the lsp)
                "gopls",                             -- go
                "json-lsp",                          -- json
                "lua-language-server",               -- lua
                "ruby-lsp",                          -- ruby
                "rust-analyzer",                     -- rust
                "taplo",                             -- toml
                "typescript-language-server",        -- typescript/javascript (but use prettier for formatting)
                "yaml-language-server",              -- yaml
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
    },
}

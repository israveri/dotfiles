vim.lsp.enable({
    "basedpyright",
    "bashls",
    "clangd",
    "cssls",
    "elixirls",
    "erlangls",
    "eslint",
    "gopls",
    "jsonls",
    "lua_ls",
    "ruby_lsp",
    "rust_analyzer",
    "taplo",
    "ts_ls",
    "yamlls",
})

-- Diagnostics
vim.diagnostic.config({
    virtual_lines = { current_line = true },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = { source = true, border = "solid" },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("core_lsp_attach", { clear = true }),

    callback = function(event)
        local buf = event.buf
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = "lsp: " .. desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gr", vim.lsp.buf.references, "Go to references")
        map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
    end
})

require("lsp.lua")
require("lsp.ruby")

-- Diagnostics
vim.diagnostic.config({
    virtual_lines = { current_line = true },
})

-- Code Completion
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)

	if client:supports_method("textDocument/completion") then
	    vim.opt.completeopt = { "menuone", "noinsert", "fuzzy", "preview" }
	    vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })

	    vim.keymap.set("i", "<C-Space>", function() vim.lsp.completion.get() end)
	end
    end
})

--
-- Autocommands definitions
--

-- Hightlight selection on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yankin text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})

-- Terminal customization
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("terminal-open", { clear = true}),
    callback = function()
	vim.opt.number = false
	vim.opt.relativenumber = false
    end
})

-- Code Completion
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client:supports_method("textDocument/completion") then
			vim.opt.completeopt = { "menuone", "noinsert", "fuzzy", "preview" }
			vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })

			vim.keymap.set("i", "<C-Space>", function() vim.lsp.completion.get() end)
		end

		-- Keymaps
		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP: [R]e[n]ame" })

		-- Execute a code action, usually your cursor needs to be on top of an error
		--  or a suggestion from your LSP for this to activate.
		vim.keymap.set({ "n", "x" }, "gra", require("fzf-lua").lsp_code_actions,
			{ buffer = event.buf, desc = "LSP: [G]oto Code [A]ction" })

		-- Find references for the word under your cursor.
		vim.keymap.set("n", "grr", require("fzf-lua").lsp_references,
			{ buffer = event.buf, desc = "LSP: [G]oto [R]eferences" })

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		vim.keymap.set("n", "gri", require("fzf-lua").lsp_implementations,
			{ buffer = event.buf, desc = "LSP: [G]oto [I]mplementation" })

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		vim.keymap.set("n", "grd", require("fzf-lua").lsp_definitions,
			{ buffer = event.buf, desc = "LSP: [G]oto [D]efinition" })

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		vim.keymap.set("n", "grD", require("fzf-lua").lsp_declarations,
			{ buffer = event.buf, desc = "LSP: [G]oto [D]eclaration" })

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		vim.keymap.set("n", "gO", require("fzf-lua").lsp_document_symbols,
			{ buffer = event.buf, desc = "LSP: Open Document Symbols" })

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		vim.keymap.set("n", "gW", require("fzf-lua").lsp_live_workspace_symbols,
			{ buffer = event.buf, desc = "LSP: Open Workspace Symbols" })

		-- Jump to the type of the word under your cursor.
		--  Useful when you"re not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		vim.keymap.set("n", "grt", require("fzf-lua").lsp_typedefs,
			{ buffer = event.buf, desc = "LSP: [G]oto [T]ype Definition" })

		-- Highlighting by cursor position
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

			-- When cursor stops moving, highlight references under cursor
			-- When cursor moves, remove highlight
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_group,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_group,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end

})

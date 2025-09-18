return {
	filetypes = { "lua" },

	cmd = { "lua-language-server" },

	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },

	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

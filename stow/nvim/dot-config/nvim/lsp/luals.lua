return {
	filetypes = { "lua" },

	cmd = { "emmylua_ls" },

	root_markers = { ".luarc.json", ".luarc.jsonc", ".emmyrc.json", ".git" },

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

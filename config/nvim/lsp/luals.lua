return {
	filetypes = { "lua" },

	cmd = { "emmylua_ls" },

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

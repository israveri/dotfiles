return {
    -- Command and arguments to start the server
    cmd = { "lua-language-server" },

    -- Filetype to automatically attach to
    filetypes = { "lua" },

    -- Files that serve as markers to identify the root directory
    -- The root will be the parent directory of these files 
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },

    settings = {
	Lua = {
	    runtime = {
		version = "LuaJIT",
	    },
	    diagnostics = {
		globals = { "vim" }
	    },
	}
    }

}

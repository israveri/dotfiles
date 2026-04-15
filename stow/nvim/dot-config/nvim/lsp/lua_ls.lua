return {
    cmd = { "emmylua_ls" },

    filetypes = { "lua" },

    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".emmyrc.json", ".git" },

    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
}

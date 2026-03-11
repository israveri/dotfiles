return {
	filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },

	cmd = { "gopls" },

	root_markers = { "go.mod", "go.work", ".git" },

	settings = {
	    gopls = {
		gofumpt = true,
	    },
	},
}

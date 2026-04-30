return {
	cmd = { "taplo", "lsp", "stdio" },

	filetypes = { "toml" },

	root_markers = {
		".git",
		"taplo.toml",
		"Cargo.toml",
		"pyproject.toml",
	},

	settings = {
		evenBetterToml = {
			schema = {
				enabled = true,
				catalogs = {
					"https://www.schemastore.org/api/json/catalog.json",
				},
			},
			formatter = {
				alignEntries = true,
				reorderKeys = false,
			},
		},
	},
}

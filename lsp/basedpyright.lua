return {
	cmd = { "basedpyright-langserver", "--stdio" },

	filetypes = { "python" },

	root_markers = {
		"pyproject.toml",
		".git",
	},

	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "standard",

				-- Prevent duplicate linting with Ruff
				diagnosticMode = "openFilesOnly",

				-- Optional: reduce overlap with Ruff
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},

	on_attach = function(client)
		-- Disable formatting from basedpyright
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}

return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { "Cargo.toml", ".git" },
	single_file_support = true,
	settings = {
		["rust-analyzer"] = {
			-- Use clippy for linting instead of standard cargo check
			check = {
				command = "clippy",
			},
			-- Enable all features automatically for better autocomplete
			cargo = {
				allFeatures = true,
			},
			-- Configure native inlay hints (supported natively in Neovim)
			inlayHints = {
				bindingModeHints = { enabled = true },
				closureReturnTypeHints = { enable = "always" },
				lifetimeElisionHints = { enabled = "always", useParameterNames = true },
			},
		},
	},
}

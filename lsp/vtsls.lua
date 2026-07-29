return {
	cmd = { "vtsls", "--stdio" },
	filetypes = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	settings = {
		complete_function_calls = true,
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = { completeFunctionCalls = true },
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = false },
			},
		},
		javascript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = { completeFunctionCalls = true },
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = false },
			},
		},
	},
}

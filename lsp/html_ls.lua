local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html" },
	root_markers = { ".git", "package.json", "index.html" },
	capabilities = capabilities,
	init_options = {
		provideFormatter = true,
		-- Instructs the HTML server to handle inner blocks
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
	},
	settings = {
		html = {
			format = {
				wrapLineLength = 140, -- Clean tag-wrapping behavior
			},
		},
	},
}

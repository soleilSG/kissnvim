return {
	cmd = { "gopls" },
	filetypes = { "go" },
	root_markers = { "go.work", "go.mod", ".git", "mise.toml" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
			hints = {
				assignVariableTypes = true,
				parameterNames = true,
			},
		},
	},
	--[[
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end,
  --]]
}

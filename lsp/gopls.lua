-- Pressing <leader>ci will quickly clean and organize imports manually
-- vim.keymap.set("n", "<leader>ci", function()
-- 	vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
-- end, { desc = "Clean & Organize Go Imports" })

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

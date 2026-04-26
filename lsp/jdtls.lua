local home = vim.fn.expand("$HOME")
local workspace_dir = home .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"

return {
	cmd = {
		"jdtls",
		"-configuration",
		jdtls_path .. "/config_linux",
		"-data",
		workspace_dir,
	},
	filetypes = { "java" },
	root_dir = function(bufnr, cb)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local root = vim.fs.root(fname, {
			"pom.xml",
			"build.gradle",
			"build.gradle.kts",
			".git",
			"mvnw",
			"gradlew",
		})
		cb(root)
	end,
	init_options = {
		extendedClientCapabilities = {
			progressReportProvider = true,
			classFileContentsSupport = true,
			generateToStringPromptSupport = true,
			hashCodeEqualsPromptSupport = true,
			advancedExtractRefactoringSupport = true,
			advancedOrganizeImportsSupport = true,
			generateConstructorsPromptSupport = true,
			generateDelegateMethodsPromptSupport = true,
			moveRefactoringSupport = true,
			overrideMethodsPromptSupport = true,
			inferSelectionSupport = { "extractMethod", "extractVariable", "extractField" },
		},
	},

	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-21",
						path = "/mise/installs/java/21/",
						default = true,
					},
				},
			},
			maven = {
				isRooted = true,
			},
		},
	},

	on_attach = function(client)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf_request(0, "textDocument/definition", vim.lsp.util.make_position_params(), function(err, result)
				if err or not result or vim.tbl_isempty(result) then
					print("No locations found")
					return
				end
				local res = vim.islist(result) and result[1] or result
				local uri = res.uri or res.targetUri
				if uri and uri:match("^jdt://") then
					client:request("java/classFileContents", { uri = uri }, function(_, content)
						if not content then
							return
						end
						local buf = vim.api.nvim_create_buf(false, true)
						vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
						vim.bo[buf].filetype = "java"
						vim.bo[buf].modifiable = false
						vim.api.nvim_set_current_buf(buf)
						local range = res.range or res.targetSelectionRange
						if range then
							vim.api.nvim_win_set_cursor(0, { range.start.line + 1, range.start.character })
						end
					end)
				else
					vim.lsp.util.jump_to_location(res, "utf-8")
				end
			end)
		end, { desc = "LSP goto definition" })
	end,
}

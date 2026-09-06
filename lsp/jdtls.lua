local home = os.getenv("HOME")
local jdtls_path = home .. "/.local/share/jdtls"

-- Resolve JDK path managed by mise-en-place
local jdk_path = home .. "/.local/share/mise/installs/java/25"

-- Dynamically find the project root directory
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = vim.fs.root(0, root_markers) or vim.fn.getcwd()

-- Isolate workspaces per project to prevent cache conflicts
local project_name = vim.fs.basename(root_dir)
local workspace_dir = home .. "/jdtls-workspace/" .. (project_name or "default")

-- Dynamically locate the equinox launcher jar file
local launcher_jar = ""
local plugins_dir = jdtls_path .. "/plugins"
if vim.fn.isdirectory(plugins_dir) == 1 then
	local matches = vim.fn.glob(plugins_dir .. "/org.eclipse.equinox.launcher_*.jar", true, true)
	if #matches > 0 then
		launcher_jar = matches[1]
	end
end

return {
	cmd = {
		-- We can use mise's java executable to boot jdtls itself
		jdk_path .. "/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-Xmx1G",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		launcher_jar,
		"-configuration",
		jdtls_path .. "/config_mac_arm",
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	init_options = {
		extendedClientCapabilities = {
			classFileContentsSupport = true,
			-- progressReportProvider = true,
			-- generateToStringPromptSupport = true,
			-- hashCodeEqualsPromptSupport = true,
			-- advancedExtractRefactoringSupport = true,
			-- advancedOrganizeImportsSupport = true,
			-- generateConstructorsPromptSupport = true,
			-- generateDelegateMethodsPromptSupport = true,
			-- moveRefactoringSupport = true,
			-- overrideMethodsPromptSupport = true,
			-- inferSelectionSupport = { "extractMethod", "extractVariable", "extractField" },
		},
	},
	settings = {
		java = {
			-- Configure Java Execution Environments for Source Code Lookups
			configuration = {
				runtimes = {
					{
						name = "JavaSE-25", -- Must strictly match Eclipse's ExecutionEnvironment naming conventions
						path = jdk_path,
						default = true, -- Forces jdtls to use this JDK to index library source code
					},
				},
			},
		},
	},
	on_attach = function(client)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf_request(
				0,
				"textDocument/definition",
				vim.lsp.util.make_position_params(0, "utf-8"),
				function(err, result)
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
						vim.lsp.util.show_document(res, "utf-8", { focus = true })
					end
				end
			)
		end, { desc = "LSP goto definition" })
	end,
}

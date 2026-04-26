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
}

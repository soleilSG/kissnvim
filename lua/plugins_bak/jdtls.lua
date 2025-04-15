local jdtlpath = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/eclipse-jdtls/" .. project_name

return {
	"mfussenegger/nvim-jdtls",
	ft = { "java" },
	opts = {
		cmd = {
			"java",
			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-Xmx1g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",
			"-jar",
			jdtlpath .. "/plugins/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar",
			"-configuration",
			jdtlpath .. "/config_mac_arm",
			"-data",
			workspace_dir,
		},
		settings = {
			java = {
				format = {
					settings = {
						url = vim.fn.stdpath("data") .. "/eclipse-java-google-style.xml",
						profile = "GoogleStyle",
					},
				},
			},
		},
		on_attach = function()
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<A-o>", function()
				require("jdtls").organize_imports()
			end, opts)
		end,
	},
	config = function(_, opts)
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		opts.capabilities = capabilities

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "java",
			callback = function()
				require("jdtls").start_or_attach(opts)
			end,
		})
	end,
}

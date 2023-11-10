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
			jdtlpath .. "/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar",
			"-configuration",
			jdtlpath .. "/config_mac_arm",
			"-data",
			workspace_dir,
		},
	},
	config = function(_, opts)
		require("jdtls").start_or_attach(opts)
	end,
}

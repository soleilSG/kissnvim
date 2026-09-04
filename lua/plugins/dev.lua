-- local developing plugin
return {
	"soleilSG/kissnvim",
	branch = "plugin",
	dependencies = { "saghen/blink.cmp" },
	config = function()
		require("kissnvim_plugin").setup()
	end,
	dev = true,
}

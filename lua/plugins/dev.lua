-- local developing plugin
return {
	"soleilSG/kissnvim",
	branch = "plugin",
	-- enabled = false,
	config = function()
		require("kissnvim_plugin").setup()
	end,
	dev = true,
}

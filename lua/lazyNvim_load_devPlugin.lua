return {
	{
		dir = "~/workspace/nvim_plugin", -- path to your plugin
		name = "hello-plugin",
		dev = true, -- marks it as a dev plugin
		config = function()
			require("hello-plugin").setup({})
		end,
	},
}

return {
	-- conform.nvim to do formatting
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
}

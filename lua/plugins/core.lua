return {
	--Color Schemes
	{ "ellisonleao/gruvbox.nvim" },
	{ "vague-theme/vague.nvim" },

	-- File Explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<leader>ft", "<cmd>Neotree<cr>", desc = "Neotree" },
		},
	},
}

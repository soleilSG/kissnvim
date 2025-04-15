return {
	-- ColorSchemes
	{ "ellisonleao/gruvbox.nvim" },
	{ "folke/tokyonight.nvim" },

	-- Icons
	{ "nvim-tree/nvim-web-devicons" },

	-- File Explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>tf", "<cmd>Neotree toggle<cr>", desc = "NeoTree File Explorer" },
			{ "<leader>tb", "<cmd>Neotree buffers toggle<cr>", desc = "NeoTree Buffers" },
		},
		opts = {},
	},

	-- Finder
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<leader>ts", "<cmd>Telescope<cr>", desc = "Telescope" },
		},
	},
}

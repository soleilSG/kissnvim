return {
	-- ColorSchemes
	{ "ellisonleao/gruvbox.nvim" },

	-- File Explorer
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		keys = {
			{ "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree Toggle" },
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},

	-- Dianostics
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble Toggle" },
			{
				"<leader>xw",
				"<cmd>TroubleToggle workspace_diagnostics<cr>",
				desc = "Trouble Toggle Workspace Dianostics",
			},
			{
				"<leader>xb",
				"<cmd>TroubleToggle document_diagnostics<cr>",
				desc = "Trouble Toggle Buffer Dianostics",
			},
			{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Trouble Toggle Quickfix" },
			{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble Toggle Loclist" },
			{ "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "Trouble Toggle Lsp References" },
		},
		opts = {},
	},

	-- Todo Comment
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
		},
		keys = {
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
		},
		opts = {},
	},
}

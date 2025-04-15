return {
	-- Mason
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	-- Auto Completion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
		},
		opts = function(_, opts)
			local cmp = require("cmp")

			opts.formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					menu = {
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						path = "[Path]",
					},
				}),
			}

			opts.mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			})

			opts.sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "buffer" },
			})
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>ff",
				function()
					require("conform").format({
						async = true,
					})
				end,
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	},
}

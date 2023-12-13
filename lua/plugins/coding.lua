return {
	-- Treeistter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					"lua",
					"html",
					"javascript",
					"typescript",
					"tsx",
					"css",
					"markdown",
					"markdown_inline",
					"go",
					"java",
					"python",
					"vue",
					"json",
					"graphql",
				},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					disable = { "vimdoc" },
					-- Disable slow treesitter highlight for large files
					-- disable = function(_, buf)
					-- 	local max_filesize = 1024 * 1024 * 10 -- 1 MB
					-- 	local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					-- 	if ok and stats and stats.size > max_filesize then
					-- 		return true
					-- 	end
					-- end,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
				modules = {},
				ignore_install = { "vimdoc" },
			})

			-- Treesitter folding
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		opts = {},
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		event = "BufRead",
		init = function()
			-- Dianostic Icons
			local signs = { Error = "", Warn = "", Hint = "󰉄", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Diagnostic Mappings
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
		end,
		config = function()
			local on_attach = function() end
			-- *** If not using Comform plugin as formatter, uncomment follows ***
			-- local on_attach = function(_, bufnr)
			-- local bufopts = { noremap = true, silent = true, buffer = bufnr }
			-- vim.keymap.set("n", "<leader>lf", function()
			-- 	vim.lsp.buf.format({ async = true })
			-- end, bufopts)
			-- end

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
			capabilities.textDocument.completion.completionItem.snippetSupport = true

			-- Language Servers Setup
			local lspconfig = require("lspconfig")

			-- Lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- C
			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Python
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Go
			lspconfig.gopls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- Rust
			lspconfig.rust_analyzer.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- CSS
			lspconfig.cssls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					css = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
					scss = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
					less = {
						validate = true,
						lint = {
							unknownAtRules = "ignore",
						},
					},
				},
			})

			-- TailwindCSS
			lspconfig.tailwindcss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- html
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			-- vue
			local mason_root_dir = vim.fn.stdpath("data") .. "/mason"
			lspconfig.volar.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
				init_options = {
					typescript = {
						tsdk = mason_root_dir .. "/packages/typescript-language-server/node_modules/typescript/lib",
					},
				},
			})

			-- graphql
			lspconfig.graphql.setup({})
		end,
	},

	-- Formatting
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({
						async = true,
						lsp_fallback = true,
					})
				end,
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
			},
		},
	},

	-- Comment
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		opts = {},
	},

	-- Auto Tag
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},

	-- Auto Pairs
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		opts = {},
	},

	-- Auto Completion
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		opts = function()
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						menu = {
							buffer = "[Buffer]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							path = "[Path]",
						},
					}),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-j>"] = cmp.mapping(function()
						require("luasnip").jump(-1)
					end, { "i", "s" }),
					["<C-l>"] = cmp.mapping(function()
						require("luasnip").jump(1)
					end, { "i", "s" }),
					["<C-k>"] = cmp.mapping(function()
						require("luasnip").expand()
					end, { "i", "s" }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
				}),
				sorting = defaults.sorting,
			}
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	-- Snippet Engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},

	-- Neovim Development
	{
		"folke/neodev.nvim",
		opts = {},
	},
}

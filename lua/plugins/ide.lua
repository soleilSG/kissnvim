local formatters_by_ft = {
	lua = { "stylua" },
	c = { "clang_format" },
	cpp = { "clang_format" },
	-- Google style, generate .clang-format at project root
	-- clang-format --style=Google --dump-config > .clang-format
	json = { "jq" },
	html = { "prettierd" },
	css = { "prettierd" },
	javascript = { "prettierd" },
	typescript = { "prettierd" },
	javascriptreact = { "prettier" },
	typescriptreact = { "prettier" },
	python = { "ruff_organize_imports", "ruff_format" },
	go = { "goimports", "gofumpt" },
	toml = { "taplo" },
	yaml = { "yamlfmt" },
	sh = { "shfmt" },
	bash = { "shfmt" },
}

return {
	-- Mason
	{
		"mason-org/mason.nvim",
		opts = {},
		--[[
		opts = {
			pip = {
				-- Force mason to use uv instead of pip
				use_uv = true,
			},
			python = {
				-- Set uv as the venv manager and installer backend
				venv = "uv", -- Options: "uv", "venv", or "virtualenv"
				installer = "uv", -- Options: "uv" or "pip"
			},
		},
    --]]
		lazy = false,
	},

	-- Blink.cmp completion
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = false } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

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
			--[[
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				-- Google style, generate .clang-format at project root
				-- clang-format --style=Google --dump-config > .clang-format
				json = { "jq" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				python = { "ruff_organize_imports", "ruff_format" },
				go = { "goimports", "gofumpt" },
				toml = { "taplo" },
				yaml = { "yamlfmt" },
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
      --]]
			formatters_by_ft = formatters_by_ft,
			formatters = {
				prettierd = {
					-- Append the no-semi argument to the default command execution
					prepend_args = { "--semi" },
				},
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	},
}

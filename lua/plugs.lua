--[[ plug.lua ]]

require('packer').startup(function(use)
	use ("wbthomason/packer.nvim")

	use {
		'kyazdani42/nvim-tree.lua',
	  requires = 'kyazdani42/nvim-web-devicons',
		config = function()
			require('nvim-tree').setup {}
		end
	}

	use {
		'kyazdani42/nvim-web-devicons',
		config = function()
			require('nvim-web-devicons').setup {
				default = true
			}
		end
	}

	use {
		'Mofiqul/dracula.nvim'
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons'
		},
		config = function()
			require('lualine').setup {
				options = {
					theme = 'dracula-nvim'
				}
			}
		end
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'sharkdp/fd'}
		},
		config = function()
			require('telescope').setup()
		end
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = { 'java', 'c', 'lua', 'go', 'javascript', 'typescript' },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false
				},
				incremental_selection = {
					enable = true
				},
				textobjects = {
					enable = true
				}
			}
		end
	}

	use {
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require('lspconfig')

			lspconfig.gopls.setup {}

			lspconfig.sumneko_lua.setup {
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
						},
						diagnostics = {
							globals = {'vim'},
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			}
		end
	}

end)

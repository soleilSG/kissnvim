--[[plugins.lua]]

local fn = vim.fn

-- If packer hasn't been installed, 
-- install packer for package management.
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
   PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
	vim.cmd [[packadd packer.nvim]]
end

-- Load packer Lua module
local packer = require 'packer'
local packer_util = require 'packer.util'

-- Setup packer
local use = packer.use
packer.startup({
	function()
		-- Packer manages itself
		use 'wbthomason/packer.nvim'

		-- Mason
		use {
			"williamboman/mason.nvim",
			config = function()
				local mason = require("mason")
				mason.setup()
			end
		}

		-- LSP
		use {
			"neovim/nvim-lspconfig",
			config = function()
				require("plugins.configs.lspconfig")
			end
		}

		-- Treesitter
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				require('nvim-treesitter.install').update({with_sync = true})
			end,
			config = function()
				local configs = require('nvim-treesitter.configs')
				configs.setup {
					highlight = {
						enable = true,
						additional_vim_regex_highlighting = false
					},
					indent = {
						enable = true
					}
				}
			end
		}

		if PACKER_BOOTSTRAP then
			packer.sync()
		end
	end,
	config = {
		compile_path = fn.stdpath "data" .. "/site/plugin/packer_compiled.lua",
		display = {
			open_fn = function()
				return packer_util.float {border = 'single' }
			end
		}
	}
})

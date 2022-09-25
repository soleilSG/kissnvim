--[[plugins.lua]]

local fn = vim.fn

-- If packer hasn't been installed, 
-- install packer as an optional plugin for package management.
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
   PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

-- Load packer package, since it's been installed as optional plugin.
vim.cmd [[packadd packer.nvim]]

-- Load packer Lua module
local packer = require 'packer'
local packer_util = require 'packer.util'

-- Setup packer
local use = packer.use
packer.startup({
	function()
		-- Packer manages itself as an optional plugin
		use {'wbthomason/packer.nvim', opt = true}

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

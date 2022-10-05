-- Setup packer

local fn = vim.fn

vim.cmd [[packadd packer.nvim]]

-- Load packer Lua module
local packer = require 'packer'
local packer_util = require 'packer.util'

-- Setup packer
local use = packer.use
packer.startup({
  function()
    -- Packer manages itself, lazy loaded
    -- Command 'PackerStartup' will load and startup packer
    use {
      'wbthomason/packer.nvim',
      opt = true
    }

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- lspkind
    use 'onsails/lspkind.nvim'

    -- Mason, lazy loaded
    use {
      "williamboman/mason.nvim",
      opt = true,
      cmd = {
        "Mason",
        "MasonInstall",
        "MasonInstallAll",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
      },
      config = function()
        local mason = require("mason")
        mason.setup()
      end
    }

    -- Snippet
    use 'L3MON4D3/LuaSnip'

    -- nvim-cmp sources
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'

    -- nvim-cmp, Autocompletion plugin
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require("plugins.configs.cmp")
      end
    }

    -- LSP
    -- Collection of configurations for built-in LSP client
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
        require('nvim-treesitter.install').update({ with_sync = true })
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

    -- Nvim-tree file explorer
    -- lazy loaded
    use {
      'kyazdani42/nvim-tree.lua',
      opt = true,
      cmd = {
        "NvimTreeOpen",
        "NvimTreeToggle",
        "NvimTreeFindFile",
        "NvimTreeFindFileToggle"
      },
      tag = 'nightly',
      config = function()
        require("nvim-tree").setup()
      end
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = function ()
        require 'plugins.configs.telescope'
      end
    }

  end,
  config = {
    compile_path = fn.stdpath "data" .. "/site/plugin/packer_compiled.lua",
    display = {
      open_fn = function()
        return packer_util.float { border = 'single' }
      end
    }
  }
})

packer.sync()

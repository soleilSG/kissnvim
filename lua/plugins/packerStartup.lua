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
    use 'rafamadriz/friendly-snippets'
    use {
      'L3MON4D3/LuaSnip',
      run = "make install_jsregexp",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end
    }

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

    --nvim-jdtls java language server
    use 'mfussenegger/nvim-jdtls'

    -- autotag
    use 'windwp/nvim-ts-autotag'

    -- autoclose
    use {
      'm4xshen/autoclose.nvim',
      config = function ()
        require("autoclose").setup {}
      end
    }

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
      end,
      config = function()
        require 'plugins.configs.treesitter'
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
    -- lazy loaded
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      opt = true,
      cmd = {
        "Telescope",
      },
      config = function()
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

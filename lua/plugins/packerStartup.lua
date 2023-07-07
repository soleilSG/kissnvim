-- Setup packer

local fn = vim.fn

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Load packer Lua module
local packer = require 'packer'
local packer_util = require 'packer.util'

-- Setup packer
local use = packer.use -- packer.use is a function to declare plugin's specifications
packer.startup({
  function()
    -- Packer manages itself, lazy loaded
    -- Command 'PackerStartup' will load and startup packer
    use { 'wbthomason/packer.nvim', opt = true }

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- ColorSchemes, lazy loaded. Use ":PackerLoad" command to load
    use {
      { 'folke/tokyonight.nvim',  opt = true },
      { "lunarvim/darkplus.nvim", opt = true }
    }

    -- Mason, lazy loaded
    use {
      "williamboman/mason.nvim",
      opt = true,
      cmd = { "Mason" },
      config = function()
        require("mason").setup()
      end
    }

    -- Snippet
    use {
      'L3MON4D3/LuaSnip',
      run = "make install_jsregexp",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
      requires = { 'rafamadriz/friendly-snippets' }
    }

    -- nvim-cmp, Autocompletion plugin
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require("plugins.configs.cmp")
      end,
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'onsails/lspkind.nvim'
      }
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
    use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }

    -- autoclose
    use {
      'm4xshen/autoclose.nvim',
      config = function()
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

    -- Nvim-tree file explorer, lazy loaded
    use {
      'kyazdani42/nvim-tree.lua',
      opt = true,
      cmd = { "NvimTreeToggle" },
      tag = 'nightly',
      config = function()
        require("nvim-tree").setup()
      end
    }

    -- Telescope, lazy loaded
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      opt = true,
      cmd = { "Telescope" },
      config = function()
        require 'plugins.configs.telescope'
      end
    }

    -- BufferLine, lazy loaded
    use {
      'akinsho/bufferline.nvim',
      tag = "v3.*",
      opt = true,
      cmd = { 'BufferLinePick' },
      config = function()
        require("bufferline").setup({
          options = {
            mode = 'buffers',
            offsets = {
              { filetype = 'NvimTree' }
            },
          }
        })
      end
    }

    -- Gitsigns, lazy loarded
    use {
      'lewis6991/gitsigns.nvim',
      opt = true,
      cmd = { 'Gitsigns' },
      config = function()
        require('gitsigns').setup()
      end
    }

    -- git plugin, lazy loaded
    use {
      'dinhhuy258/git.nvim',
      opt = true,
      cmd = { 'Git' },
      config = function()
        require('git').setup()
      end
    }

    -- lspsaga, lazy loaded
    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      -- opt = true,
      -- cmd = { 'Lspsaga lsp_finder' },
      config = function()
        require("lspsaga").setup({})
      end
    })

    -- Peek, markdown previewer, lazy loaded
    use({
      'toppair/peek.nvim',
      run = 'deno task --quiet build:fast',
      opt = true,
      cmd = { 'PeekOpen' },
      config = function()
        require 'plugins.configs.peek'
      end
    })

    -- comment
    use {
      'terrortylor/nvim-comment',
      config = function()
        require('nvim_comment').setup()
      end
    }

    -- ai
    use {
      'aduros/ai.vim',
      opt = true
    }

    -- maximize and resotre current window
    use {
      'declancm/maximize.nvim',
      config = function()
        require('maximize').setup()
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

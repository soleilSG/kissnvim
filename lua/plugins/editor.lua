return {
	-- ColorSchemes
	{ "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },

  -- Icons
  {"nvim-tree/nvim-web-devicons"},

  -- File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>tf", "<cmd>Neotree toggle<cr>", desc = "NeoTree File Explorer" },
      { "<leader>tb", "<cmd>Neotree buffers toggle<cr>", desc = "NeoTree Buffers" },
    },
    opts = {},
  },

  -- Keymaps
  --[[
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
      },
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  --]]

  -- Finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>fd", "<cmd>Telescope<cr>", desc="Telescope"},
    },
  },

  -- Buffer Line
  --[[
  {
    "willothy/nvim-cokeline",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      sidebar = {
        filetype = { "NvimTree", "neo-tree" },
        components = {
          {
            text = function(buf)
              return buf.filetype
            end,
            fg = yellow,
            bg = function()
              local get_hex = require('cokeline.hlgroups').get_hl_attr
              return get_hex('neo-tree', 'bg')
            end,
            bold = true,
          },
        },
      },
    },
  },
  --]]
}

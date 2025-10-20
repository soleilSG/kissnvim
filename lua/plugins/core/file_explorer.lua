return {
  -- File Explorer
  --[[
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>ft", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree Toggle" },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  ]]

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>ft", "<cmd>Neotree<cr>", desc = "Neotree" },
    },
    lazy = false,
  }
}

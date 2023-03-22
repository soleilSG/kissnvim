-- Command for lazy loading and startuping packer
vim.api.nvim_create_user_command(
  'PackerStartup',
  function()
    require 'plugins.packerStartup'
  end,
  { desc = "Load and startup packer" }
)

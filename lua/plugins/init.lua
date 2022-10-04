-- Install packer

local fn = vim.fn

-- If packer hasn't been installed, 
-- install packer for package management.
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
   fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  vim.api.nvim_command('PackerStartup')
end

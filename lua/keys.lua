--[[ keys.lua ]]

vim.g.mapleader = ','
vim.g.localleader = '\\'

local map = vim.api.nvim_set_keymap

map('i', 'jk', '<ESC>', {})
map('n', '<leader>nt', ':NvimTreeToggle<cr>', {})

--[[ keys.lua ]]

vim.g.mapleader = ','
vim.g.localleader = '\\'

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('i', 'jk', '<ESC>', opts)
map('n', '<leader>nt', ':NvimTreeToggle<cr>', opts)

-- Prettier formating buffer
map('n', '<leader>pf', ':%!prettier --stdin-filepath %<CR>', opts)

-- auto pair {}
map('i', '<leader>}', '<CR>}<ESC><S-o>', opts)

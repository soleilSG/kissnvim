--[[ keys.lua ]]
vim.g.mapleader = ' '
vim.g.localleader = '\\'

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('i', 'jk', '<ESC>', opts)
map('n', '<leader>nt', ':NvimTreeToggle<cr>', opts)

-- Prettier formating buffer
map('n', '<leader>pf', ':%!prettierd --stdin-filepath %<CR>', opts)

-- BufferLine key mappings
map('n', '<leader>bp', ":BufferLinePick<cr>", opts)
map('n', '<leader>h', ":BufferLineCyclePrev<cr>", opts)
map('n', '<leader>l', ":BufferLineCycleNext<cr>", opts)

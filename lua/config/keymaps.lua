local map = vim.keymap.set
local opts = {noremap = true, silent = true }

map('i', 'jk', '<ESC>',{desc = 'Escape to normal mode'})

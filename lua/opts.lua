--[[ opts.lua ]]

local opt = vim.opt
local cmd = vim.api.nvim_command

opt.number = true
--opt.relativenumber = true
opt.signcolumn = "yes"
opt.showmode = true
opt.showmatch = true

opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

opt.syntax = 'on'
opt.termguicolors = true
cmd('colorscheme torte')
opt.cursorline = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true

opt.splitright = true
opt.splitbelow = true
opt.laststatus = 3

-- Treesitter folding
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- disable netrw, using nvim-tree exclusively
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

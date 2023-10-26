--[[ opts.lua ]]

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.showmode = true
opt.showmatch = true

opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

opt.syntax = 'on'
opt.termguicolors = true
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
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

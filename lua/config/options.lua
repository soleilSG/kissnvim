-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmode = true
opt.laststatus = 3
opt.showmatch = true
opt.cursorline = true

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true

opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true

-- enable copy, paste to system clipboard by default
-- opt.clipboard = "unnamedplus"

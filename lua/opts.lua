--[[ opts.lua ]]

local opt = vim.opt
local cmd = vim.api.nvim_command

--opt.colorcolumn = '80'
opt.number = true
opt.relativenumber = true
--opt.scrolloff = 4
--opt.signcolumn = "yes"

opt.encoding = 'utf8'
opt.fileencoding = 'utf8'

opt.syntax = 'on'
opt.termguicolors = true
cmd('colorscheme torte')
--vim.g.dracula_transparent_bg = false
opt.cursorline = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.showmode = false

opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

opt.splitright = true
opt.splitbelow = true

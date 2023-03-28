--[[ colors.lua ]]

local cmd = vim.api.nvim_command

cmd('colorscheme torte')

-- remove the grey color of the window's seperator
cmd('hi VertSplit guibg=bg guifg=fg')

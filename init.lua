--[[ init.lua ]]

-- IMPORTS
require('opts')
require('keys')
require('plugs')

-- PLUGINS SETUP

--[[
require('nvim-tree').setup()

require('lualine').setup {
	options = {
		theme = 'dracula-nvim'
	}
}

require('nvim-web-devicons').setup {
	default = true
}

require('telescope').setup()

require('lspconfig').gopls.setup {}

require('nvim-treesitter.configs').setup {
	ensure_installed = { 'java', 'c', 'lua', 'go', 'javascript', 'typescript' },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	incremental_selection = {
		enable = true
	},
	textobjects = {
		enable = true
	}
}
]]

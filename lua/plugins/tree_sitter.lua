return {
	-- Treeistter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		build = ":TSUpdate",
		opts = function()
			-- Treesitter folding
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			return {
				ensure_installed = { "c", "cpp", "lua", "python" },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			}
		end,
	},
}

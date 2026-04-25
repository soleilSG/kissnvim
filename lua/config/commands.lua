vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cpp", "java", "javascript", "typescript", "python", "go" },
	callback = function()
		vim.treesitter.start()
	end,
})

local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Escape to normal mode", noremap = true, silent = true })
map("t", "jk", [[<C-\><C-n>]], { desc = "Escape to normal mode in terminal", noremap = true, silent = true })

map("n", "<leader>bz", "<cmd>tab sb<cr>", { desc = "Zoom buffer into new tab", noremap = true, silent = true })

map("n", "<leader>ll", function()
	require("config.lazy")
	print("Lazy.nvim has been loaded.")
end, { desc = "Load Lazy.nvim" })

map("n", "<leader>tt", function()
	vim.cmd("tabnew | terminal")
	vim.cmd("file Term")
end, { desc = "Open terminal in new tab" })

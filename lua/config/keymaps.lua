local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Escape to normal mode", noremap = true, silent = true })
map("t", "jk", [[<C-\><C-n>]], { desc = "Escape to normal mode in terminal", noremap = true, silent = true })

map("n", "<leader>bz", "<cmd>tabedit %<cr>", { desc = "Zoom buffer into new tab", noremap = true, silent = true })

map("n", "<leader>tt", function()
	vim.cmd("tabnew | terminal")
	vim.cmd("file Term")
end, { desc = "Open terminal in new tab" })

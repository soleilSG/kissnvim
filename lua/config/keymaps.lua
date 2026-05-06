local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Escape to normal mode", noremap = true, silent = true })
map("t", "jk", [[<C-\><C-n>]], { desc = "Escape to normal mode in terminal", noremap = true, silent = true })

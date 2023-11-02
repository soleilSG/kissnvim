local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Escape to normal mode", noremap = true, silent = true })

-- Prettier formating buffer specifically for tsx and jsx files
map("n", "<leader>pf", ':%!prettierd "%:p"<CR>', { desc = "Prettierd Formatter", noremap = true, silent = true })

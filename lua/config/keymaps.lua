local map = vim.keymap.set

map("i", "jk", "<ESC>", { desc = "Escape to normal mode", noremap = true, silent = true })
map("t", "jk", [[<C-\><C-n>]], { desc = "Escape to normal mode in terminal", noremap = true, silent = true })

map("n", "<leader>bz", "<cmd>tab sb<cr>", { desc = "Zoom buffer into new tab", noremap = true, silent = true })

map("n", "<leader>ll", function()
	require("config.lazy")
	print("Lazy.nvim has been loaded.")
end, { desc = "Load Lazy.nvim" })

--[[
map("n", "<leader>tt", function()
	vim.cmd("tabnew | terminal")
	vim.cmd("file Term")
end, { desc = "Open terminal in new tab" })
--]]

local function open_terminal_in_bottom_split()
	local term_bufnr = nil

	-- 1. Find the first existing terminal buffer
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[bufnr].buftype == "terminal" then
			term_bufnr = bufnr
			break
		end
	end

	-- 2. Create a horizontal split at the bottom
	-- "botright" ensures the split takes the full width at the very bottom
	-- "15new" opens a split window with a height of 15 lines
	vim.cmd("botright 15split")

	-- 3. Load the existing terminal or create a new one in this split
	if term_bufnr then
		vim.api.nvim_set_current_buf(term_bufnr)
	else
		vim.cmd("terminal")
	end

	-- Optional: Automatically enter Terminal (Insert) mode
	vim.cmd("startinsert")
end
vim.keymap.set("n", "<leader>t", open_terminal_in_bottom_split, { desc = "Open terminal in bottom split" })

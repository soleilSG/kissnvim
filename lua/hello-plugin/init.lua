local M = {}

local tool = require("hello-plugin.test")
local luals_setting = require("hello-plugin.luals_setting")

--- Setup function that registers the keymap
function M.setup()
	-- Setting the keymap in Normal mode
	-- vim.keymap.set("n", "<leader>mm", M.hello_world, { desc = "Hello World Plugin" })
	vim.keymap.set("n", "<leader>mm", tool.hello_world, { desc = "Hello World Plugin" })
end

return M

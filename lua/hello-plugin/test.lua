local M = {}

--- Implementation of the core functionality
function M.hello_world()
	vim.notify("Hello World! 🎉", vim.log.levels.INFO)
end

return M

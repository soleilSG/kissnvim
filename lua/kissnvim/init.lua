local M = {}

function M.setup(opts)
	opts = opts or {}
	local utils = require("kissnvim.utils")

	M.utils = utils

	_G.ConciseTabLine = utils.ConciseTabLine
	vim.o.tabline = "%!v:lua.ConciseTabLine()"
end

return M

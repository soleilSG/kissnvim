local M = {}

function M.setup(opts)
	opts = opts or {}
	local utils = require("kissnvim.utils")

	M.utils = utils

	--[[ This feature has been moved to kissnvim config
	_G.ConciseTabLine = utils.ConciseTabLine
	vim.o.tabline = "%!v:lua.ConciseTabLine()"
  --]]
end

return M

local M = {}

function M.get_current_luals_settings()
	-- Fetch the current buffer number
	local bufnr = vim.api.nvim_get_current_buf()

	-- Filter active clients to match either 'lua_ls' or 'luals' on the current buffer
	local clients = vim.lsp.get_clients({ bufnr = bufnr })

	local target_client = nil
	for _, client in ipairs(clients) do
		if client.name == "lua_ls" or client.name == "luals" then
			target_client = client
			break
		end
	end

	-- Handle case where the language server is not attached to this buffer
	if not target_client then
		vim.notify("LuaLS is not attached to the current buffer.", vim.log.levels.WARN)
		return nil
	end

	-- Return the settings table
	return target_client.settings
end

return M

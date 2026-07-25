local M = {}

function M.list_lsp()
	local config_path = vim.fn.stdpath("config") .. "/lsp"
	local lsp_servers = {}

	local handle, err = vim.uv.fs_scandir(config_path)
	if handle then
		while true do
			local name, type = vim.uv.fs_scandir_next(handle)
			if not name then
				break
			end
			if type == "file" and name:match("%.lua$") and name ~= "init.lua" then
				local server_name = name:gsub("%.lua$", "")
				local suffix = vim.lsp.is_enabled(server_name) and "*" or ""
				table.insert(lsp_servers, server_name .. suffix)
			end
		end
		print("Found LSP configs for: " .. table.concat(lsp_servers, ", "))
	else
		print("Could not read LSP folder: " .. tostring(err))
	end
end

function M.enable_lsp(server_name)
	if not server_name or server_name == "" then
		print("LSP server name is required")
		return
	end

	local config_path = vim.fn.stdpath("config") .. "/lsp/" .. server_name .. ".lua"
	if vim.fn.filereadable(config_path) ~= 1 then
		print("No LSP config found for: " .. server_name)
		return
	end

	if vim.lsp.is_enabled(server_name) then
		print("LSP server already enabled: " .. server_name)
		return
	end

	vim.lsp.enable(server_name)
	print("Enabled LSP server: " .. server_name)
end

function M.setup(opts)
	opts = opts or {}

	vim.api.nvim_create_user_command("LSPList", function()
		M.list_lsp()
	end, {})

	vim.api.nvim_create_user_command("LSPEnable", function(cmd)
		-- M.enable_lsp(cmd.args)
		-- print(vim.inspect(cmd.fargs))
		vim.lsp.enable(cmd.fargs)
	end, {
		nargs = "+",
		desc = "Enable lsp server(s)",
	})
end

return M

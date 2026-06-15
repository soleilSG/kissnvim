-- Get the path to your Neovim config directory
local config_path = vim.fn.stdpath("config") .. "/lsp"
local lsp_servers = {}

-- Open the directory loop
local handle, err = vim.uv.fs_scandir(config_path)

if handle then
	while true do
		local name, type = vim.uv.fs_scandir_next(handle)
		if not name then
			break
		end

		-- Only match .lua files and exclude init.lua if present
		if type == "file" and name:match("%.lua$") and name ~= "init.lua" then
			local server_name = name:gsub("%.lua$", "")
			table.insert(lsp_servers, server_name)
		end
	end

	-- Print the found configurations
	print("Found LSP configs for: " .. table.concat(lsp_servers, ", "))
else
	print("Could not read LSP folder: " .. tostring(err))
end

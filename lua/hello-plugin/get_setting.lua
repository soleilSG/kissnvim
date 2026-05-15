local function get_current_luals_settings()
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

-- Example usage: Print the settings cleanly to a new buffer or scratchpad
vim.api.nvim_create_user_command("PrintLuaLSSettings", function()
	local settings = get_current_luals_settings()
	if settings then
		-- Pretty print the Lua table using Neovim's built-in inspector
		print(vim.inspect(settings))
	end
end, {})

-- Modified user command to open data in a vertical split window
vim.api.nvim_create_user_command("PrintLuaLSSettingsSplitW", function()
	local settings = get_current_luals_settings()
	if not settings then
		return
	end

	-- Format the settings table into a list of printable string lines
	local formatted_string = vim.inspect(settings)
	local lines = vim.split(formatted_string, "\n")

	-- Open a new vertical split window on the right side
	vim.cmd("rightbelow vsplit")

	-- Create a new unlisted scratch buffer (not saved to disk)
	local bufnr = vim.api.nvim_create_buf(false, true)

	-- Attach the new buffer to the newly opened window
	vim.api.nvim_win_set_buf(0, bufnr)

	-- Write the formatted configuration lines into the buffer
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

	-- Apply syntax highlighting by declaring it as a lua file
	vim.bo[bufnr].filetype = "lua"

	-- Make the buffer read-only to prevent accidental edits
	vim.bo[bufnr].modifiable = false
end, {})

--- Updates LuaLS workspace library path on the fly
--- @param new_path string: The absolute file path to add to the library array
local function update_luals_library(new_path)
	-- 1. Locate the running LuaLS client for the current buffer
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	local target_client = nil

	for _, client in ipairs(clients) do
		if client.name == "lua_ls" or client.name == "luals" then
			target_client = client
			break
		end
	end

	if not target_client then
		vim.notify("LuaLS is not attached to this buffer. Cannot update configuration.", vim.log.levels.ERROR)
		return
	end

	-- 2. Safely initialize nested configuration structures if empty
	target_client.config.settings = target_client.config.settings or {}
	target_client.config.settings.Lua = target_client.config.settings.Lua or {}
	target_client.config.settings.Lua.workspace = target_client.config.settings.Lua.workspace or {}
	target_client.config.settings.Lua.workspace.library = target_client.config.settings.Lua.workspace.library or {}

	-- 3. Append the new parameter path to the library tracking array
	table.insert(target_client.config.settings.Lua.workspace.library, new_path)

	-- Sync the global tracking reference within Neovim's client workspace dictionary
	target_client.settings = target_client.config.settings

	-- 4. Send the required JSON-RPC notification to push updates directly to LuaLS
	target_client.notify("workspace/didChangeConfiguration", {
		settings = target_client.config.settings,
	})

	vim.notify("Successfully added path to LuaLS workspace: " .. new_path, vim.log.levels.INFO)
end

-- 5. Expose an automated user command wrapping the execution logic
vim.api.nvim_create_user_command("AddLuaLSLibrary", function(opts)
	-- Grab the string parameter passed directly into the command interface
	local argument_path = opts.args
	if argument_path == "" then
		vim.notify("Please supply a valid absolute path string.", vim.log.levels.WARN)
		return
	end
	update_luals_library(argument_path)
end, { nargs = 1, complete = "file" }) -- Enables folder path autocompletion using <Tab>

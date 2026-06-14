function hello()
	vim.notify("Hello kissnvim! 🎉", vim.log.levels.INFO)
	-- vim.schedule(function()
	-- 	print("Hello")
	-- end)
end

---Return the line range of the current visual selection and the current file name.
---
---When called from Visual mode, this uses the active visual selection. Otherwise it
---falls back to the last visual selection marks (`'<` and `'>`).
---@return table selection_info { start_line: integer, end_line: integer, filename: string }
function get_selection_line_range()
	local mode = vim.fn.mode()
	local start_line
	local end_line

	if mode == "v" or mode == "V" or mode == "\22" then
		start_line = vim.fn.getpos("v")[2]
		end_line = vim.fn.getpos(".")[2]
	else
		start_line = vim.fn.getpos("'<")[2]
		end_line = vim.fn.getpos("'>")[2]
	end

	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	return {
		start_line = start_line,
		end_line = end_line,
		filename = vim.fn.expand("%:t"),
	}
end

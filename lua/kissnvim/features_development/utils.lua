local M = {}

function M.ConciseTabLine()
	local s = ""
	for i = 1, vim.fn.tabpagenr("$") do
		-- Highlight current tab differently
		if i == vim.fn.tabpagenr() then
			s = s .. "%#TabLineSel#"
		else
			s = s .. "%#TabLine#"
		end
		-- Get buffer name for the active window in each tabpage
		local buflist = vim.fn.tabpagebuflist(i)
		local winnr = vim.fn.tabpagewinnr(i)
		local bufname = vim.fn.bufname(buflist[winnr])
		local filename = vim.fn.fnamemodify(bufname, ":t") -- ':t' isolates the file name

		if filename == "" then
			filename = "[No Name]"
		end
		s = s .. " " .. i .. ": " .. filename .. " "
	end
	return s
end

return M

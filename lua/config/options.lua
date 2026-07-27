vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.markdown_folding = 1

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmode = true
opt.laststatus = 3
opt.showmatch = true
opt.cursorline = true

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true

opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true

-- enable copy, paste to system clipboard by default
opt.clipboard = "unnamedplus"

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

-- Shorten tabpage lable on tabline
function ConciseTabLine()
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
vim.o.tabline = "%!v:lua.ConciseTabLine()"

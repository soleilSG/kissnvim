local api = vim.api

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", {
	command = [[ set formatoptions-=cro]]
})

-- Close nvim if NvimTree is only running buffer
api.nvim_create_autocmd("BufEnter", {
	command = [[if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
})

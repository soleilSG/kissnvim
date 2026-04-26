vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cpp", "java", "javascript", "typescript", "python", "go" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client or client.name ~= "jdtls" then
			return
		end
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf_request(0, "textDocument/definition", vim.lsp.util.make_position_params(), function(err, result)
				if err or not result or vim.tbl_isempty(result) then
					print("No locations found")
					return
				end
				local res = vim.islist(result) and result[1] or result
				local uri = res.uri or res.targetUri
				if uri and uri:match("^jdt://") then
					client:request("java/classFileContents", { uri = uri }, function(_, content)
						if not content then
							return
						end
						local buf = vim.api.nvim_create_buf(false, true)
						vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(content, "\n"))
						vim.bo[buf].filetype = "java"
						vim.bo[buf].modifiable = false
						vim.api.nvim_set_current_buf(buf)
						local range = res.range or res.targetSelectionRange
						if range then
							vim.api.nvim_win_set_cursor(0, { range.start.line + 1, range.start.character })
						end
					end)
				else
					vim.lsp.util.jump_to_location(res, "utf-8")
				end
			end)
		end, { buffer = args.buf, desc = "LSP goto definition" })
	end,
})

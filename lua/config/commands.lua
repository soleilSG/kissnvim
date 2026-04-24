vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'typescript' },
  callback = function() vim.treesitter.start() end,
})

local jdtls = require('jdtls')

local on_attach = function(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set('n', '<space>o', jdtls.organize_imports, bufopts)
end

local config = {
  cmd = { 'jdtls' },
  root_dir = vim.fs.dirname(
    vim.fs.find(
      { '.gradlew', '.git', 'mvnw' },
      { upward = true })[1]),
  on_attach = on_attach,
}

require('jdtls').start_or_attach(config)

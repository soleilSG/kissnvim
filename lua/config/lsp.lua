vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end

    if client.name == 'clangd' then
      -- Enable inlay hints for C++ if supported
      if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
      end
    end

    --[[
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
      vim.opt.completeopt:append("noselect")
    end
    --]]

    -- Set up keybindings
    local opts = { buffer = args.buf, noremap = true, silent = true }
    vim.keymap.set('n', '<leader>fm', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

vim.lsp.enable({ "ruff", "pyright", "lua_ls", "clangd" })

vim.diagnostic.config({
  -- Show diagnostics in virtual text (inline)
  virtual_text = true,
  -- or with options:
  -- virtual_text = {
  --   spacing = 4,
  --   prefix = '●',
  --   severity = { min = vim.diagnostic.severity.WARN }, -- only warnings and errors
  -- },

  -- Show signs in the sign column
  -- signs = true,
  -- or with custom signs:
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },

  -- Update diagnostics in insert mode
  update_in_insert = false,

  -- Underline diagnostics
  underline = true,

  -- Sort diagnostics by severity
  severity_sort = true,

  -- Show diagnostic in floating window on cursor hold
  float = {
    border = 'rounded',
    source = 'always', -- Show source in diagnostic popup
    header = '',
    prefix = '',
  },
})


-- Show diagnostics in floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- Go to previous diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })

-- Go to next diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })

-- Show all diagnostics in quickfix
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Diagnostics to quickfix' })

-- Show buffer diagnostics in location list
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Diagnostics to loclist' })

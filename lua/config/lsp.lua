vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end

    --[[
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
    ]]

    -- Set up keybindings
    local opts = { buffer = args.buf, noremap = true, silent = true }
    vim.keymap.set('n', '<leader>fm', function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

vim.lsp.enable({ "ruff", "ty", "lua_ls" })

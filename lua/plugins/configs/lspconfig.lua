local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

-- ****** Dianostic config ******
-- This is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Diagnostic mapping
-- This has been replaced by LSPsaga plugin
--[[
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--]]
-- ****** LSP config ******
local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<space>f',
    function()
      vim.lsp.buf.format { async = true }
    end,
    bufopts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- ****** LSPsaga config ******
-- local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
keymap({ "n", "v" }, "<Leader>ca", "<cmd>Lspsaga code_action<CR>")
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")


-- ****** Languages setup ******

-- Lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      }
    }
  },
  on_attach = on_attach,
  capabilities = capabilities
}

-- C
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities
}


-- Python
lspconfig.pyright.setup {}

-- Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- JavaScript
--[[
-- Deno
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
lspconfig.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
]]

-- tsserver
--[[
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
--]]

-- CSS
-- cssls
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    }
  }
}
-- tailwindcss
lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- html
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- Json
--[[
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
--]]

-- vue
lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
  init_options = {
    typescript = {
      tsdk = '/Users/soleil/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib',
    }
  }
}

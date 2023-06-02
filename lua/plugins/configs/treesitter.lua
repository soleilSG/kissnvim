local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = { "lua", "html", "javascript", "typescript", "tsx", "css", "markdown", "markdown_inline", "go",
    "java", "python" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true,
  }
}

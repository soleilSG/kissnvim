local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = { "lua", "html", "javascript", "typescript", "tsx", "css", "markdown", "markdown_inline", "go",
    "java", "python", "vue", "json", "graphql" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "all" },
  highlight = {
    enable = true,
    -- Disable slow treesitter highlight for large files
    disable = function(lang, buf)
      local max_filesize = 1024 * 1024 -- 1 MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
  autotag = {
    enable = true,
  },
  modules = {}
}

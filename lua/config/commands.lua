vim.api.nvim_create_user_command('CC',
  function(opts)
    vim.cmd.colorscheme(opts.fargs[1])
    vim.cmd("hi VertSplit guibg=bg guifg=fg")
  end,
  { nargs = 1, desc = "Change Colorscheme" }
)

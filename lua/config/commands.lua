vim.api.nvim_create_user_command('CC',
  function(opts)
    vim.cmd.colorscheme(opts.fargs[1])
    vim.cmd("hi VertSplit guibg=bg guifg=fg")
    vim.notify("colorscheme has been set to: " .. opts.fargs[1])
  end,
  { nargs = 1,
    complete = "color",
    desc = "Change Colorscheme",
  }
)

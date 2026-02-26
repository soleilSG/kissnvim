return {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { "pyproject.toml", ".git", ".venv" },
  offset_encoding = 'utf-8',
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

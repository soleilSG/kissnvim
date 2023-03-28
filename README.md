## Selected plugins

### Plugin manager

- [x] Packer
  - Lazy loaded.
  - Use ':PackerStartup' command to load.
  - Config file is "lua/plugins/PackerStartup.lua".

### Color Schemes

- Lazy loaded,
- Use ":PackerLoad" command to load.
- [x] TokoNight
- [x] DarkPlus

### Package manager

- [x] Mason
  - Lazy loaded.
  - Use ':Mason' command to load.

### Snippet

- [x] LuaSnip
  - A snippet framework written in lua.
- [x] Friendly-Snippets

### Completion

- [x] nvim-cmp
  - A autocompletion framework written in lua.
  - Config file is "lua/plugins/cmp.lua".
- [x] cmp-nvim-lsp
  - LSP completion source for nvim-cmp.
- [x] cmp-buffer
  - Buffer completion source for nvim-cmp.
- [x] cmp-path
  - File path completion source for nvim-cmp.
- [x] cmp_luasnip
  - LuaSnip completion source for nvim-cmp.

### LSP

- [x] nvim-lspconfig
  - A collection of configurations for Neovim built-in LSP clients.
  - Config filejjj is "lua/plugins/configs/lspconfig.lua".
- [x] lspkind
  - Adds vscode-like pictograms to neovim built-in lsp.
- [x] lspsaga
  - A highly performant LSP UI.
  - Lazy loaded.
  - Plugin configurations are in the file "lua/plugins/configs/lspconfig".
- [x] nvim-jdtls
  - Eclipse java LSP.

### Treesitter

- [x] Treesitter
  - Installed via brew on MacOS.
- [x] nvim-treesitter
  - Nvim Treesitter configurations and abstraction layer.
  - Config file is "lua/plugins/configs/treesitter.lua".
- [x] nvim-ts-autotag
  - Use treesitter to auto close and auto rename html tag.

### Icons

- [x] nvim-web-devicons

### Fuzzy search

- [x] Telescope
  - Lazy loaded.
  - Use command ":Telescope" to load.
  - Config file is "lua/plugins/configs/telescope.lua".

### Markdown

- [ ] glow
  - A markdown render.
  - Install glow via Mason firstly.
- [x] Peek
  - Markdown preview plugin for Neovim.
  - Lazy loaded.
  - Use command ":PeekOpen" to load.
  - Config file is "lua/plugins/configs/peek.lua".

### Miscellaneous

- [x] nvim-tree
  - File explorer.
  - Lazy loaded.
  - Use command ":NvimTreeToggle" to load.
- [x] plenary
  - Useful lua functions for Neovim.
- [x] autoclose
  - A minimalist Neovim plugin that auto pairs & closes brackets written in 100% Lua.
- [x] BufferLine
  - A snazzy 💅 buffer line (with tabpage integration) for Neovim built using lua.
  - Lazy loaded.
  - Use command ":BufferLinePick" to load.
- [x] gitsigns
  - Super fast git decorations implemented purely in lua/teal.
  - Lazy loaded.
  - Use command ":Gitsigns" to load.
- [x] git
  - Simple clone of the plugin vim-fugitive which is written in Lua.
  - Lazy loaded.
  - Use command ":Git" to load.
- [x] nvim-comment
  - A comment toggler for Neovim, written in Lua.

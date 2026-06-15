My Neovim plugin which follows the minimalist principal.

## Features
- Shorten tabpage lable on tabline.

## Development
### Development workflow
1. Write functions for realizing a feature in 'lua/kissnvim/scratch.lua' file.
2. Unit test on current Neovim session
```vim
" Load code into Neovim's Lua runtime
:luafile %

" Call function
:lua myFunction()
```
3. Integrate test in plugin. Move feature functions to 'lua/kissnvim/utils.lua'
```vim
" Temporarily remove 'local' from M making it global
:luafile %
:lua M.myFunction()
```

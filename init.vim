highlight CursorLine ctermbg=8
set cursorline

set ignorecase
set smartcase
set number

"set colorcolumn=80

color tender
autocmd ColorScheme tender
\ | hi Normal guibg=#000000
\ | hi SignColumn guibg=#000000 "
\ | hi StatusLine guibg=#444444 guifg=#b3deef

"""" NERDTree Plugin """"
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden=1
"let g:NERDTreeChDirMode = 2
"let g:NERDTreeWinSize = 24
nnoremap <leader>e :NERDTreeToggle<cr>
"nnoremap <leader>f :NERDTreeFind<cr>

"""" fzf Plugin """"
nnoremap <c-p> :call fzf#Open()<cr>


"""" rpigrep Plugin """"
let g:ag_cli = 'rg'


runtime vim.lua

" 使用 foldexpr 指定的方式折叠代码
set foldmethod=expr
" 使用 treesitter 根据语言语法折叠代码
set foldexpr=nvim_treesitter#foldexpr()
" 默认从第一级开始，大家可以去掉看有什么效果
set foldlevel=1

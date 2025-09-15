"set leader
let mapleader = " "

"set syntax
syntax on

"set binds
nnoremap <leader>, :Ex<CR>

"set numbers
set number
set relativenumber

"set dots
set list
set listchars=tab:-->,space:·
highlight SpecialKey ctermfg=8 guifg=#373b41

"set tabs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"GUI Dark theme
highlight Normal       guifg=#C5C8C6 guibg=#1D1F21
highlight CursorLine   guibg=#282A2E
highlight CursorColumn guibg=#282A2E
highlight LineNr       guifg=#969896 guibg=#1D1F21

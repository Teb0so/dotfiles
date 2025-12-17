" Set leader
let mapleader = " "

" Set syntax
syntax on

" Load theme
colorscheme wildcharm
highlight Identifier ctermfg=0
highlight Comment ctermfg=90
highlight Normal ctermbg=none
highlight NormalNC ctermbg=none
highlight EndOfBuffer ctermbg=none

if has("gui_running")
    set background=light
    highlight Normal guibg=#ffffee guifg=#000000
    highlight NormalNC guibg=#ffffee
    highlight EndOfBuffer guibg=#ffffee
    highlight Comment guifg=#870087
    highlight Identifier guifg=#000000
    set guifont=Consolas:h16
endif

" Keep 10 lines above / bellow cursor
set scrolloff=10

" Set dots
set list
set listchars=tab:-->,space:·

" Set identation
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Serch settings
set ignorecase
set smartcase
set nohlsearch
set incsearch

" File handling
set nobackup
set nowritebackup
set autoread

"Set line numbers
set number
set relativenumber

"Cycle buffers
nnoremap <leader>b :b#<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

" Delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Keep selection after indenting
vnoremap > >gv
vnoremap < <gv

" Move chunks of code
nnoremap E ddp
nnoremap Y ddkP

vnoremap E :m '>+1<CR>gv=gv
vnoremap Y :m '<-2<CR>gv=gv

" Panel operations
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Open copen
nnoremap <leader>co :copen<CR>

" Open new empy buffer
nnoremap <leader>e :enew<CR>

" Quick search
nnoremap <leader>ff :find
set path+=**

" List buffers
nnoremap <leader>fb :buffers<CR>:b<Space>

"Open explorer
nnoremap <leader>, :Ex<CR>

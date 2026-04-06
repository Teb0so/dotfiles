" Set leader
let mapleader = " "

" Set syntax
syntax on

highlight SpecialKey ctermfg=246

if has("gui_running")
    colorscheme wildcharm
    set background=light
    highlight Normal guibg=#ffffdd guifg=#000000
    highlight NormalNC guibg=#ffffdd
    highlight EndOfBuffer guibg=#ffffdd
    highlight Comment guifg=#870087
    highlight Identifier guifg=#000000
    set guifont=Consolas:h16
endif

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
set noswapfile

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

" Center cursor while scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv

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

" Shell command
nnoremap <leader>sh :!<Space>

" Open new empty buffer
nnoremap <leader>e :enew<CR>

" Quick search
nnoremap <leader>ff :find<Space>
set path+=**

" List buffers
nnoremap <leader>fb :buffers<CR>:b<Space>

"Open explorer
nnoremap <leader>, :Ex<CR>

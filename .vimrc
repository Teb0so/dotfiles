" Set leader
let mapleader = " "

" Set syntax
syntax on

highlight SpecialKey ctermfg=246
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

if has("gui_running")

    highlight clear
    if exists("syntax_on")
      syntax reset
    endif

    set background=light

    " Basic UI
    hi Normal        guifg=#000000 guibg=#ffffdd
    hi SpecialKey    guifg=#ddddcc
    hi NonText       guifg=#9f9f9f
    hi Pmenu         guifg=#000000 guibg=#aaaaaa
    hi PmenuSel      guifg=#ffffff guibg=#5f5f5f
    hi PmenuSbar     guibg=#aaaaaa
    hi PmenuThumb    guibg=#5f5f5f
    hi CurSearch     guifg=#ffffff guibg=#af5f00
    hi CursorLine    guifg=#ffffff guibg=#5f5f5f
    hi CursorLineNr  guifg=#af5f00
    hi LineNrAbove   guifg=#5f5f5f
    hi LineNr        guifg=#af5f00
    hi LineNrBelow   guifg=#5f5f5f
    hi ModeMsg       guifg=#000000
    hi MoreMsg       guifg=#008787
    hi Cursor        guifg=#ffffff guibg=#af5f00

    " Syntax
    hi Comment       guifg=#870087
    hi Todo          guifg=#ffffff guibg=#870087
    hi String        guifg=#008700
    hi Special       guifg=#5f875f
    hi Keyword       guifg=#af5f00
    hi Statement     guifg=#af5f00
    hi Function      guifg=#000000
    hi Identifier    guifg=#000000
    hi Type          guifg=#004175
    hi PreProc       guifg=#002747
    hi Constant      guifg=#000000

    " Ex
    hi Directory             guifg=#008787
    set guifont=Consolas:h16

    " Copy
    nnoremap <C-S-c> "+y
    vnoremap <C-S-c> "+y

    " Paste
    nnoremap <C-S-v> "+p
    inoremap <C-S-v> <C-r>+
endif

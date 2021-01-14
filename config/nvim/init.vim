call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'romainl/vim-cool'
Plug 'Stautob/vim-fish'

Plug 'kien/ctrlp.vim'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vifm/vifm.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tmux-plugins/vim-tmux'
Plug 'benmills/vimux'
Plug 'junegunn/vim-easy-align'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'

Plug 'vim-latex/vim-latex'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python plugins
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
"if has('python3')
"        Bundle 'Valloric/YouCompleteMe'
"endif
Plug 'w0ng/vim-hybrid'
Plug 'nvie/vim-flake8'
"Plug 'nvie/vim-pyunit'

Plug 'rodjek/vim-puppet'

call plug#end()

filetype plugin indent on

let mapleader = ','

" completion on commandline
set autoread wildmode=longest,list,full " detect when a file is changed
set wildmenu
set wildmode=longest,full,full

" All about tabs
set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=2 " the visible width of tabs
set softtabstop=2 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

" set cliboard for dealing with systems
set clipboard=unnamed

" all folding
set foldmethod=indent "fold by indentation
set foldnestmax=10 "max depth of folds is 10
set nofoldenable "do not fold by default
set foldlevel=1 "fold indent only once

" all indentation
set autoindent
set smartindent

"all searching
set ignorecase "case insensitive searching
set smartcase "case sensitive if expression contains capital letter
set hlsearch "highlight hits
set incsearch "show hits while expanding search
set showmatch
set nolazyredraw "dont redraw while executing macros

set magic "magic on for regex

" remapping some keys
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :e! $MYVIMRC<CR>

nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" some ui things
let &colorcolumn="80,".join(range(120,999),",") " set a bar at 80 columns
set number " show line numbers

"silent! colorscheme solarized
set background=dark
colorscheme PaperColor
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
hi! LineNr ctermbg=NONE ctermfg=grey guibg=NONE guifg=grey
hi! SignColumn guibg=NONE ctermbg=NONE


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-sneak
let g:sneak#label = 1

" vifm
map <leader>vf :Vifm<CR>
map <leader>vs :VsplitVifm<CR>
map <leader>sp :SplitVifm<CR>
map <leader>dv :DiffVifm<CR>
map <leader>tv :TabVifm<CR>

" Airline
let g:airline_theme='papercolor'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tmuxline#enabled = 0

" Nerdtree
"let g:NERDTreeQuitOnOpen=0 " close NERDTree after a file is opened
"let NERDTreeShowHidden=1 " show hidden files in NERDTree
"let NERDTreeIgnore = ['\.pyc$'] " ignore certain files

"nmap <silent> <leader>k :NERDTreeToggle<cr>
"nmap <silent> <leader>y :NERDTreeFind<cr>

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

" Goyo / Limelight nondistructive writing
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    "CocDisable
    Limelight
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set cursorline
    "CocEnable
    Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""
" Python coding
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:python3_host_prog = $HOME."/.pyenv/versions/nvim_env/bin/python"
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

"""""""""""""""""""""""""""""""""""""""""""""""""
" Web coding
"""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

"""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX Coding
"""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,Bufread *.tex set spell
au BufNewFile,Bufread *.tex set spelllang=de
au BufEnter *.tex set autowrite
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode "$*"'
let g:Tex_ViewRule_pdf = 'open'
let g:Tex_GotoError = 0

"""""""""""""""""""""""""""""""""""""""""""""""""
" General Coding settings
"""""""""""""""""""""""""""""""""""""""""""""""""
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

if &shell =~# 'fish$'
    set shell=sh
endif

"runtime! debian.vim

syntax on

"Begining Plugin Section
set nocompatible
filetype off


"runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'jremmen/vim-ripgrep'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'mbbill/undotree'
Plugin 'vim-utils/vim-man'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ap/vim-css-color'

"colorschemes
Plugin 'trapd00r/neverland-vim-theme'
Plugin 'nanotech/jellybeans.vim'
Plugin 'dracula/vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'atelierbram/vim-colors_atelier-schemes'
Plugin 'morhetz/gruvbox'
call vundle#end()


filetype plugin indent on

"Finishing Plugin Sections


"Colorscheme section

colorscheme neverland2


set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"In case background color is not correct, set manually:
"hi Normal guibg=#1d1f26 "dracula_bold

set background=dark

"Airline
let g:airline_theme = 'neverland'
let g:airline#extensions#whitespace#enabled = 0


"Ready to go settings

set noerrorbells
set relativenumber
set nu
set nowrap
set tabstop=4
set shiftwidth=4
set nohlsearch
set softtabstop=4
set hidden
set expandtab
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set smartindent
set autoindent
set smartcase
set incsearch
set scrolloff=8
set cmdheight=2
set updatetime=50
set showmatch

set signcolumn=yes
set noshowmode


"Automatic delete trailing whitespace on save

autocmd BufWritePre * %s/\s\+$//e

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"Ripgrep
"Allow rg faster search
if executable('rg')
    let g:rg_derive_root='true'
endif

"Ctrlp ignored items
let g:ctrlp_user_command = ['.git/','git --git-dir=%s/.git ls-files -oc --exclude-standard']

"LaTeX
let g:tex_flavor='latex'
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'pdflatex'
let g:livepreview_cursorhold_recompile = 0


"Maps

let mapleader = " "

nnoremap <leader>v :LLPStartPreview

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>


nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>


nnoremap <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG


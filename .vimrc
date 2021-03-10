runtime! debian.vim

syntax on

"Begining Plugin Section
set nocompatible
filetype off

"runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'

Plugin 'jremmen/vim-ripgrep'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-rooter'

Plugin 'mbbill/undotree'
Plugin 'preservim/nerdtree'
Plugin 'szw/vim-maximizer'

Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'spf13/vim-preview'
Plugin 'valloric/youcompleteme'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'java_getset.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-utils/vim-man'

Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'
Plugin 'cyma/neverland-vim-theme'
Plugin 'ap/vim-css-color'
Plugin 'itchyny/lightline.vim'
call vundle#end()

filetype plugin indent on

runtime! macros/matchit.vim


"Finishing Plugin Section

"Begin eyecandy section"

colorscheme  jellybeans

if (g:colors_name == 'gruvbox')
    let g:gruvbox_contrast_dark = 'hard'
endif

if (g:colors_name == 'jellybeans')
    let g:jellybeans_use_term_italics = 1
endif

"Add git branch from fugitive and set colorscheme for lightline

if filereadable(expand("~/.vim/bundle/lightline.vim/plugin/lightline.vim"))
    set noshowmode
    let g:lightline = {
           \ 'colorscheme' : 'jellybeans',
           \ 'active': {
           \   'left': [ [ 'mode', 'paste' ],
           \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
           \ },
           \ 'component_function': {
           \   'gitbranch': 'fugitive#head',
           \ },
           \ }
endif

set background=dark

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

"Finish eyecandy section


"Ready to go settings
set encoding=utf-8

set relativenumber
set number

set autoindent
set smartindent
"set backspace=indent,eol,start

set tabstop=4 softtabstop=4
set shiftwidth=4
set hidden
set expandtab
set smarttab

set nowrap
"set display+=lastline

set laststatus=2
set ruler
set cmdheight=2
set wildmenu
"set cursorline

set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

set incsearch
set nohlsearch
set ignorecase
set smartcase

set scrolloff=10

set signcolumn=yes
set colorcolumn=80

set showmatch
set noerrorbells
set completeopt=menuone,noinsert,noselect

"If a file has been modified outside of vim, automatically reads it again
set autoread

"Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
"delays and poor user experience. Increase in case latex-preview does not
"work correctly
set updatetime=50

"Don't pass messages to [ins-completion-menu].
set shortmess+=c

"Make the vim tab name the current file
let &titlestring = @%
set title

"Don't show scrollback buffer from urxvt inside vim
set mouse=a

"True color
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


"Automatic delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"YCM + Snips
let g:UltiSnipsExpandTrigger="<c-j>"

"Allow rg faster search
if executable('rg')
  let g:rg_derive_root='true'
endif

"FZF
if filereadable(expand("~/.vim/bundle/fzf.vim/plugin/fzf.vim"))
    let $FZF_DEFAULT_COMMAND='rg --files --hidden'
    let $FZF_DEFAULT_OPTS = '--info=inline'
    let g:fzf_tags_command = 'ctags -R'
    let g:fzf_layout = {'down': '40%'}
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
    let g:fzf_action = {
    \ 'ctrl-t' : 'tab split',
    \ 'ctrl-x' : 'split',
    \ 'ctrl-v' : 'vsplit' }
endif

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
nnoremap <leader>1 :Preview<CR>
nnoremap <leader>ff :Files<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>t :tabe<CR>
nnoremap <leader>sh :terminal<CR>

nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>


nnoremap <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>m :MaximazerToggle<CR>

vnoremap <leader>gs :InsertGetterSetter<CR>


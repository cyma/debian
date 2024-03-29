runtime! debian.vim

syntax on

"Begining Plugin Section
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

"Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vimwiki/vimwiki'

Plug 'yegappan/grep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'universal-ctags/ctags'
Plug 'majutsushi/tagbar'
Plug 'vifm/vifm.vim'
Plug 'airblade/vim-rooter'
Plug 'mbbill/undotree'
Plug 'szw/vim-maximizer'

Plug 'valloric/youcompleteme'
Plug 'jiangmiao/auto-pairs'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'uiiaoo/java-syntax.vim'

Plug 'vim-utils/vim-man'
Plug 'lervag/vimtex', { 'for': ['latex', 'tex'] }
Plug 'xuhdev/vim-latex-live-preview', { 'for': ['latex', 'tex'], 'on': 'LLPStartPreview' }
Plug 'habamax/vim-godot'

Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
call plug#end()

filetype plugin indent on

"Finishing Plugin Section

"Add git branch from fugitive and set colorscheme for lightline

set noshowmode
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \ },
  \ }

"Colorschemes
if($TERM == "st-256color")
    colorscheme jellybeans
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
else
    colorscheme jellybeans
endif

if(g:colors_name == 'jellybeans')
  let g:lightline.colorscheme = 'jellybeans'
  let g:jellybeans_use_gui_italics = 0
endif

if(g:colors_name == 'gruvbox')
  let g:gruvbox_contrast_dark = 'hard'
  let g:lightline.colorscheme = 'gruvbox'
  let g:gruvbox_italic = '0'
  let g:gruvbox_invert_selection = '0'
endif

if(g:colors_name == 'tokyonight')
  let g:lightline = {'colorscheme' : 'tokyonight'}
  let g:tokyonight_enable_italic = '0'
  let g:tokyonight_disable_italic_comment = '1'
endif


if(g:colors_name == 'dracula')
    let g:dracula_bold = 1
    let g:dracula_italic = 0
    let g:lightline.colorscheme ='dracula'
endif


set background=dark

"Ready to go settings
set encoding=utf-8

set relativenumber
set number

set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hidden

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
set colorcolumn=79

set showmatch
set noerrorbells

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

"Disable mouse in all modes
set mouse=

"Removes the menu bar (gVim -> godot)
:set guioptions -=T

"Automatic delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"Snips
let g:UltiSnipsExpandTrigger="<C-j>"

"Vimwiki
let g:vimwiki_list = [{'path': '~/Nextcloud/vimwiki/'}]

"YCM
let g:ycm_show_detailed_diag_in_popup=1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"Allow rg faster search
if executable('rg')
  let g:rg_derive_root='true'
endif

"FZF
let $FZF_DEFAULT_COMMAND='rg --files --hidden'
let $FZF_DEFAULT_OPTS = '--info=inline'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {'down': '40%'}
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
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

"LaTeX
let g:tex_flavor='latex'
let g:livepreview_previewer = 'zathura'
let g:livepreview_engine = 'pdflatex'
let g:livepreview_cursorhold_recompile = 0

"Maps

let mapleader = " "

nnoremap <leader>v :LLPStartPreview

nnoremap <leader>tag :TagbarToggle<CR>

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>.ht :!open %<CR>
nnoremap <leader>ff :Files<CR>

nnoremap <leader>l :tabnext<CR>
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>t :tabe<CR>
nnoremap <leader>sh :terminal<CR>

nnoremap <leader>p "+p
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>m :MaximizerToggle<CR>

" YCM
nnoremap <leader>fix :YcmCompleter FixIt<CR>
nnoremap <leader>goto :YcmCompleter GoTo<CR>
nnoremap <leader>symbol :YcmCompleter GoToSymbol<CR>
nnoremap <leader>type :YcmCompleter GetType<CR>
nnoremap <leader>ref :YcmCompleter GoToReferences<CR>
nnoremap <leader>rn :call Ycm_Rename()<CR>
function! Ycm_Rename()
    let str = input("Refactor to: ")
    execute ":YcmCompleter RefactorRename" str
endfunction

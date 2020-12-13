runtime! debian.vim

syntax on

"Begining Plugin Section
set nocompatible
filetype off


"runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'jremmen/vim-ripgrep'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'preservim/nerdtree'

Plugin 'neoclide/coc.nvim'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'vim-utils/vim-man'

Plugin 'ap/vim-css-color'

Plugin 'itchyny/lightline.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'cyma/neverland-vim-theme'
Plugin 'morhetz/gruvbox'
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
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead'
        \ },
        \ }
    if(g:colors_name == 'jellybeans')
        let g:lightline = {'colorscheme' : 'jellybeans'}
    endif
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

"set nowrap
set display+=lastline

set laststatus=2
set ruler
set cmdheight=2
set wildmenu
"set cursorline

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set incsearch
set nohlsearch
set smartcase
set ignorecase

set scrolloff=8
set signcolumn=yes
set showmatch

set noerrorbells

"If a file has been modified outside of vim, automatically reads it again
set autoread

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience. Increase in case latex-preview does not
" preview correctly
set updatetime=50

"Don't pass messages to [ins-completion-menu].
set shortmess+=c

"improve" the menu behavior
set completeopt=menuone,noinsert,noselect

"Comment if terminal has support
"set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


"Automatic delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

if filereadable(expand("~/.vim/bundle/coc.nvim/plugin/coc.vim"))
    call coc#config('list.source.bibtex', {
    \  'files': [
    \    '~/.cyma/debian/LaTeX/article/sample.bib'
    \]
    \})
endif

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

" CONQUER of COMPLETION (CoC)

" Extensions
let g:coc_global_extensions=[
    \'coc-clangd',
    \'coc-sh',
    \'coc-python',
    \'coc-omnisharp',
    \'coc-sql',
    \'coc-java',
    \'coc-vimtex',
    \'coc-bibtex',
    \'coc-perl',
    \'coc-highlight',
    \'coc-marketplace',
    \]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"Applying codeAction to the selected region.
"Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Mappings for CoCList
" Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

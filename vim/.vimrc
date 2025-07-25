
" ####################### BEGIN PLUGIN MANAGEMENT
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

    " auto close parenthesis, brackets, quotes, etc...
    Plug 'jiangmiao/auto-pairs'

    " show indentation in editor
    Plug 'yggdroot/indentline'

    " tree viewer
    Plug 'scrooloose/nerdtree'

    " nerdtree addon for git
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " show changed lines in a file on a git repository
    Plug 'airblade/vim-gitgutter'

    " git integration
    Plug 'tpope/vim-fugitive'

    " git conflict solver
    Plug 'christoomey/vim-conflicted'

    " file finder (requires fzf installed)
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " status line
    Plug 'itchyny/lightline.vim'

    " multiple cursor
    Plug 'terryma/vim-multiple-cursors'

    " surrounding
    Plug 'tpope/vim-surround'

    " tmux navigation plugin
    Plug 'christoomey/vim-tmux-navigator'

    " polyglot
    Plug 'sheerun/vim-polyglot'

    " markdown
    Plug 'tpope/vim-markdown'

    " autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " debugger
    Plug 'vim-vdebug/vdebug'

    " project-specific vimrc files
    Plug 'embear/vim-localvimrc'

    " syntax checker
    Plug 'maralla/validator.vim'

    " http client
    Plug 'aquach/vim-http-client'

call plug#end()
" ####################### END PLUGIN MANAGEMENT

" ####################### BEGIN PROPERTIES

let default_indentation=2 " spaces

" ####################### END PROPERTIES

" ####################### USER FUNCTIONS

" set indentation configs
function! SetIndentation(spaces)
  execute "set tabstop=".a:spaces
  execute "set softtabstop=".a:spaces
  execute "set shiftwidth=".a:spaces
  execute "set expandtab"
endfunction

" ####################### END USER FUNCTIONS

" ####################### BEGIN EDITOR SETTINGS 

" setting up default encoding
:set encoding=utf-8

" setting up line numbers
:set nu

" setting up indentation
if has("autocmd")
    filetype plugin indent on
endif

" set tab settings to 4 spaces
call SetIndentation(default_indentation)

" setting up default split to right and bottom
set splitbelow
set splitright

" uncomment this line in order to make the backspace key to work as usual
" set backspace=indent,eol,start

" setting up vim to autoreload files when changed
set autoread

" polyglot compat
set nocompatible

" ####################### END EDITOR SETTINGS

" ####################### BEGIN KEYMAP SETTINGS

" ; => Open the file search using fzf
map ; :Files<CR>

" setup the leader key
:let mapleader = ","

" close current window/tab
:nnoremap <leader>q :close<CR>
:nnoremap <leader>Q :q!<CR>

" save current file
:nnoremap <leader>s :w<CR>

" reload current file
:nnoremap <leader>r :e<CR>

" tab mapping 
:nnoremap <leader>t :tabnew<CR>
:nnoremap <leader>m :tabprevious<CR>
:nnoremap <leader>. :tabnext<CR>
:nnoremap <leader>1 :tabn 1<CR>
:nnoremap <leader>2 :tabn 2<CR>
:nnoremap <leader>3 :tabn 3<CR>
:nnoremap <leader>4 :tabn 4<CR>
:nnoremap <leader>5 :tabn 5<CR>
:nnoremap <leader>T :tabedit %<CR>

" move between buffers using Ctrl HJKL
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

" ####################### END KEYMAP SETTINGS

" ####################### BEGIN CUSTOM COMMANDS

" :Em => Enable mouse scroll navigation
:command Em set mouse=a

" :Dm => Disable mouse scroll navigation
:command Dm set mouse=

" :Rs => reload vim configuration
:command Rs so $MYVIMRC

" :WipeReg => clear vim registers
:command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" :I2 => Set indentation to 2 spaces
:command I2 call SetIndentation(2)

" :I4 => Set indentation to 4 spaces
:command I4 call SetIndentation(4)

" ####################### END CUSTOM COMMANDS

" ####################### BEGIN PLUGINS SETTINGS 

" scrooloose/nerdtree
let NERDTreeMapOpenInTab='\r'
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows=0
let g:NERDTreeWinPos = "right"

" Ctrl + o => Open NERDtree viewer as a sidebar 
map <C-o> :NERDTreeToggle<CR>

" tpop/vim-fugitive
:nnoremap <leader>gd :Gdiffsplit<CR>
:nnoremap <leader>gb :Gblame<CR>

" nathanaelkane/vim-indent-guides 
colorscheme default

let g:indent_guides_auto_colors = 0 
let g:indent_guides_guide_size = 1 

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=darkgrey ctermbg=252
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=251

" itchyny/lightline
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'darcula',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ]]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ }
    \ }

" yggdroot/indentLine 
let g:indentLine_setConceal = 0

" christoomey/vim-conflicted
let g:diffget_local_map = 'gl'
let g:diffget_upstream_map = 'gu'
:nnoremap <leader>nc :GitNextConflict<CR>

" embear/vim-localvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 2

" neoclide/coc.nvim
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ####################### END PLUGINS SETTINGS


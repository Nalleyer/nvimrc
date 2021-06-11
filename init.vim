set nocompatible
set showmatch
set ignorecase
set hlsearch

" tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" invisible
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list

set number
set cc=100
filetype plugin indent on
syntax on

" colorscheme default

let mapleader=" "
let maplocalleader="\\"

" Plugin
call plug#begin()
Plug 'itchyny/lightline.vim'"
Plug 'ayu-theme/ayu-vim'
Plug 'zxqfl/tabnine-vim'
Plug 'scrooloose/nerdtree'
Plug 'Nalleyer/workspace.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
call plug#end()

" clap
let g:clap_provider_mylist = {
    \ 'source': function('workspace#GetList'),
    \ 'sink': function('workspace#OpenFile'),
    \ 'description': 'get filelist from workspace',
    \}

" disable complete in popup
let g:ycm_filetype_blacklist = {
    \ 'clap_input': 1,
    \}
autocmd FileType clap_input let g:completion_enable_auto_pop = 0
" autocmd FileType clap_input call compe#setup({ 'enabled': v:false }, 0)

" use ctrlp for that
function! CtrlP()
    if workspace#IsWorkspaceLoaded()
        execute ":Clap mylist"
    else
        execute ":Clap files"
    endif
endfunction
nnoremap <c-p> :call CtrlP() <cr>

" ayu
set termguicolors
let ayucolor="light"
colorscheme ayu

" lightline + ayu
let g:lightline = {
    \ 'colorscheme': 'ayu',
    \ }

" nerdtree
let g:NERDTreeChDirMode = 2  " Change cwd to parent node

let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>

" open/load vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" fase move between windows
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l

" command
nnoremap <leader><leader> :

" learn
inoremap <c-u> <esc>bveUei
vnoremap <c-s> s""<esc>P

" common typo
iabbrev adn and
iabbrev tehn then
iabbrev udpate update
iabbrev fasle false


set encoding=utf-8
set helplang=cn


" fzf
" nnoremap <c-p> :Files<CR>
" let g:fzf_preview_window = ['down:30%', 'ctrl-/']

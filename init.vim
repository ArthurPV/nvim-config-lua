" File: .vimrc
" Author: ArthurPV
" Year: 2020

" All plugins
" ===========

call plug#begin("~/.vim/plugged")

Plug 'tpope/vim-fugitive'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ArthurPV/vim-moon-color'
Plug 'liuchengxu/vista.vim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'voldikss/vim-floaterm'
Plug 'ocaml/vim-ocaml'
Plug 'Townk/vim-autoclose'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim'

call plug#end()

" Basic Settings
" ==============

syntax on
set termguicolors
set background=dark
colorscheme mooncolor
set relativenumber
set nu
set mouse=a
set laststatus=2
set encoding=UTF-8
set modifiable
filetype on
filetype plugin on
set tabstop=2
set shiftwidth=2
set cursorline

" Custom command
" ==============

nmap <C-i> :PlugInstall<CR>
nmap <C-t>l :FloatermLast<CR>
nmap <C-t> :FloatermNew<CR>
nmap <C-t>h :FloatermHide<CR>
nmap <C-b> :NvimTreeToggle<CR>
nmap <C-e> :Telescope find_files<CR>
nmap <C-g> :Telescope live_grep<CR>
nmap <C-d> :Telescope buffers<CR>
nmap <C-h> :Telescope help_tags<CR>

" Command (run or build)
" ======================

" c++
nnoremap <C-q>+ :!g++ -o  %:r % -std=c++17<Enter>
nnoremap <C-q>+r :!./%:r

" rust
nnoremap <C-q>r :!rustc -o %:r %<Enter>
nnoremap <C-q>rr :!./%:r

" python
nnoremap <C-q>p :!python %:r.py %<Enter>

" js (node)
nnoremap <C-q>j :!node %:r.js %<Enter>

" elixir
nnoremap <C-q>e :!elixir %:r.ex %<Enter>

" Require lua file 
" ================

" Icons (lua)
lua require('components.icons')

" Telescope.nvim
lua require('components.telescope')

lua require'bufferline'.setup()

" Apparence settings
" ==================
highlight CursorLineNr guibg=NONE

" Lighline
" ========

let g:lightline = {
      \ 'colorscheme': 'material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" File: .vimrc
" Author: ArthurPV
" Year: 2020

call plug#begin("~/.vim/plugged")

" Git wrapper
Plug 'tpope/vim-fugitive'

" File explorer
Plug 'kyazdani42/nvim-tree.lua'

" File icons
Plug 'kyazdani42/nvim-web-devicons'

" Colorscheme
Plug 'ArthurPV/vim-moon-color'

" Nvim Treesitter
Plug 'nvim-treesitter/nvim-treesitter'

" Find Fildter Preview...and more
Plug 'nvim-telescope/telescope.nvim'

" Plugins for telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" General settings

syntax on
set termguicolors
set background=dark
colorscheme mooncolor

" set line number
set relativenumber
set nu

set mouse=a
set laststatus=2
set encoding=UTF-8
set modifiable
filetype on
filetype plugin on

" set tab
set tabstop=2
set shiftwidth=2

" Custom command
nmap <C-i> :PlugInstall<CR>
nmap <C-b> :NvimTreeToggle<CR>
nmap <C-s>s :Telescope find_files<CR>
nmap <C-s>l :Telescope live_grep<CR>
nmap <C-s>b :Telescope buffers<CR>
nmap <C-s>h :Telescope help_tags<CR>

" Command (run or build)

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

" Icons (lua)
lua require('components.icons')

" Nvim Treesitter (lua)
lua require('components.tree')

" Telescope.nvim
lua require('components.telescope')

" Nvim Tree (lua)
let g:nvim_tree_side = 'left'
let g:nvim_tree_width = 25
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_root_folder_modifier = ':~'
let g:nvim_tree_tab_open = 1
let g:nvim_tree_width_allow_resize = 1

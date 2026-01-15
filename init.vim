call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'iamcco/markdown-preview.nvim'
call plug#end()
nnoremap <silent> <C-p> :lua require('telescope.builtin').find_files({cwd=vim.env.HOME..'/documents'})<CR>
set termguicolors ?
colorscheme monokai_pro
set wrap v
set linebreak v
set breakindent v
set noswapfile v
set relativenumber v
set scrolloff=15 v
set tabstop=2 v
set softtabstop=2 v
set expandtab v
set shiftwidth=2 v
set number v
set nobackup
set undofile
set undodir=$HOME/.config/nvim/undodir
set noerrorbells
inoremap jk <esc>

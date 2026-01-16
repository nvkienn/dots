call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox' v
Plug 'phanviet/vim-monokai-pro' v
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'iamcco/markdown-preview.nvim'
call plug#end()
nnoremap <silent> <C-p> :lua require('telescope.builtin').find_files({cwd=vim.env.HOME..'/documents'})<CR>
set termguicolors v
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
set nobackup v
set undofile v
set undodir=$HOME/.config/nvim/undodir v
set noerrorbells v
inoremap jk <esc> v

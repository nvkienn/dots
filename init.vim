call plug#begin('~/.config/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()
nnoremap <silent> <C-p> :lua require('telescope.builtin').find_files({cwd=vim.env.HOME..'/documents'})<CR>
set termguicolors
colorscheme monokai_pro
set wrap
set linebreak
set breakindent
set noswapfile
set relativenumber
set scrolloff=15
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set number
set nobackup
set undofile
set undodir=$HOME/.config/nvim/undodir
set noerrorbells
inoremap jk <esc>

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Colors
vim.o.termguicolors = true

-- Line wrapping
vim.o.linebreak = true
vim.o.breakindent = true

-- Line numbering
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 15

-- Case-insensitive searching unless \c or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disables
vim.o.swapfile = false

-- Show <tab> and trailing spaces
vim.o.list = true

-- Tab settings
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Turn off search highlight after entering Insert mode
vim.cmd('packadd! nohlsearch')

-- Undofile
vim.o.undofile = true
vim.o.undodir = '/Users/ramen/.config/nvim/undodir'

-- Sync Vim clipboard with System clipboard
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Mappings
vim.keymap.set('n','H','^')
vim.keymap.set('n','L','$')

-- Bootstrap 'lazy.nvim' by Folke
require("config.lazy")

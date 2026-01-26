-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Vim Generics
--<
-- Colors
vim.o.termguicolors = true
vim.cmd([[colorscheme nord]])

-- Line wrapping
vim.o.linebreak = true
vim.o.breakindent = true

-- Line numbering
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 15
vim.o.signcolumn = "no"

-- Case-insensitive searching unless \c or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Disables
vim.o.swapfile = false

-- Tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Foldings
vim.o.foldmethod = "marker"
vim.o.foldmarker = "--<,-->"

-- Undofile
vim.o.undofile = true
vim.o.undodir = "/Users/ramen/.config/nvim/undodir"

-- Sync Vim clipboard with System clipboard
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		vim.o.clipboard = "unnamedplus"
	end,
})

-- Turn off search highlight after entering Insert mode
--<
vim.cmd([[
  augroup nohlsearch
    autocmd!
    noremap <Plug>(nohlsearch) <cmd>nohlsearch<cr>
    noremap! <Plug>(nohlsearch) <cmd>nohlsearch<cr>
    au CursorHold * call feedkeys("\<Plug>(nohlsearch)", 'm')
    au InsertEnter * call feedkeys("\<Plug>(nohlsearch)", 'm')
  augroup END
]])
-->

-- Close error messages
vim.cmd([[
  augroup errormsg
    autocmd!
    au CursorHold * echo
  augroup END
]])

-- Mappings
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")
vim.keymap.set("o", "H", "^")
vim.keymap.set("o", "L", "$")
-->

-- Bootstrap 'lazy.nvim' by Folke
require("config.lazy")

-- Telescope Search
--<
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local t = {
	file_ignore_patterns = {
		"LICENSE",
		"%.git/",
		"%.DS_Store",
		"%.pdf",
		"%.png",
		"%.jpg",
		"%.JPG",
		"%.jpeg",
		"%.JPEG",
		"%.gif",
		"undodir/",
		"Pictures/",
		"Music/",
		"Library/",
		"Movies/",
		"Applications/",
		"music/",
		"art/",
		"coey/",
		"school/",
	},
}

local files_programs = function()
	t.prompt_title = "~/doc/code/"
	t.cwd = "$HOME/Documents/code/"
	builtin.find_files(t)
end

local files_config = function()
	t.prompt_title = "~/.config/"
	t.cwd = "$HOME/.config/"
	builtin.find_files(t)
end

local files_all = function()
	t.prompt_title = "home"
	t.hidden = true
	t.cwd = "$HOME/"
	builtin.find_files(t)
end

vim.keymap.set("n", "<leader>p", files_programs, { desc = "find code files" })
vim.keymap.set("n", "<leader>c", files_config, { desc = "find .config files" })
vim.keymap.set("n", "<leader>f", files_all, { desc = "find all files" })
-->

-- LSPs
--<
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
-->

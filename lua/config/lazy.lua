-- Bootstrap lazy.nvim
--<
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
-->

-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		"tpope/vim-surround",
		"tpope/vim-repeat",

		-- autoclose.nvim --
		{
			"m4xshen/autoclose.nvim",
			config = function()
				require("autoclose").setup()
			end,
		},

		-- formatter --
		{
			"stevearc/conform.nvim",
			opts = {},
		},

		-- LSPs --
		{
			"saghen/blink.cmp",
			dependencies = {
				"rafamadriz/friendly-snippets",
				"onsails/lspkind.nvim",
			},
			version = "1.*",
			opts = {
				keymap = {
					preset = "none",
					["<M-n>"] = { "select_next", "fallback" },
					["<M-N>"] = { "select_prev", "fallback" },
					["<CR>"] = { "accept", "fallback" },
				},
				cmdline = { enabled = false },
				menu = {
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},

		-- mason.nvim --
		{
			"mason-org/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		},

		-- mason-lspconfig --
		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = {
				"mason-org/mason.nvim",
				"neovim/nvim-lspconfig",
			},
			opts = {
				ensure_installed = {"jdtls"},
				automatic_enable = {
					exclude = {
						-- needs external plugin
						"jdtls",
					},
				},
			},
		},

		-- jdtls --
		{
			"mfussenegger/nvim-jdtls",
			config = function()
				vim.lsp.config("jdtls", {
					on_attach = function(_, bufnr)
						for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
							vim.api.nvim_set_hl(0, group, {})
						end
						local x = { buffer = bufnr, noremap = true }
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, x)
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, x)
						vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, x)
						vim.keymap.set("n", "gr", vim.lsp.buf.references, x)
						vim.keymap.set("n", "gi", vim.lsp.buf.implementation, x)
						vim.keymap.set("n", "K", vim.lsp.buf.hover, x)
						vim.o.signcolumn = "no"
					end,
				})
				vim.lsp.enable("jdtls")
			end,
		},

		-- telescope.nvim --
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-telescope/telescope-fzy-native.nvim",
				"nvim-lua/plenary.nvim",
			},
			config = function()
				local telescope = require("telescope")
				local actions = require("telescope.actions")
				telescope.setup({
					defaults = {
						mappings = {
							i = {
								["<esc>"] = actions.close,
								["<M-n>"] = actions.move_selection_previous,
								["<M-N>"] = actions.move_selection_next,
							},
						},
					},
				})
			end,
		},

		-- colorscheme dump --
		--<
		-- {
		--   "arcticicestudio/nord-vim",
		--   priority = 1000,
		--   config = function()
		--     vim.cmd.colorscheme "nord"
		--   end,
		-- },
		-- {
		--   "catppuccin/nvim",
		--   priority = 1000,
		--   config = function()
		--     require("catppuccin").setup({
		--       flavour="frappe",
		--       transparent_background=true
		--     })
		--     vim.cmd.colorscheme "catppuccin"
		--   end,
		-- }
		-->
		-- import your plugins
		-- { import = "plugins" }, -- uncomment to have plugins under ../plugins/
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})

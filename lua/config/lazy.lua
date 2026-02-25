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

-- Setup lazy.nvim
require("lazy").setup({
	spec = {

		--< vim basic functions
		"tpope/vim-surround",
		"tpope/vim-repeat",
		"terrortylor/nvim-comment",

		--< autoclose.nvim
		{
			"m4xshen/autoclose.nvim",
			config = function()
				require("autoclose").setup({
					keys = {
						[";"] = { escape = true },
						["`"] = { escape = false, close = false },
						["'"] = { escape = true, close = false },
					},
					options = {
						pair_spaces = true,
						disable_when_touch = true,
					},
				})
			end,
		}, -->

		--< nvim-toggler
		{
			"nguyenvukhang/nvim-toggler",
			config = function()
				require("nvim-toggler").setup({
					inverses = {
						["true"] = "false",
					},
					remove_default_inverses = true,
				})
			end,
		}, -->
		-->

		--< formatter
		{
			"stevearc/conform.nvim",
			config = function()
				require("conform").setup({
					formatters_by_ft = {
						lua = { "stylua" },
						java = { "google-java-format" },
					},
					formatters = {
						["google-java-format"] = {
							prepend_args = { "--aosp" },
						},
					},
					vim.api.nvim_create_autocmd("BufWritePre", {
						pattern = "*",
						callback = function(args)
							require("conform").format({ bufnr = args.buf })
						end,
					}),
				})
			end,
		}, -->

		--< LSPs
		--< blink.cmp
		{
			"saghen/blink.cmp",
			version = "1.*",
			opts = {
				keymap = {
					preset = "none",
					["<M-n>"] = { "select_next", "fallback" },
					["<M-N>"] = { "select_prev", "fallback" },
					["<CR>"] = { "accept", "fallback" },
					["<Tab>"] = { "show", "fallback" },
				},
				enabled = function()
					return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
				end,
				cmdline = {
					keymap = { preset = "inherit" },
				},
				fuzzy = { implementation = "prefer_rust_with_warning" },
				completion = {
					menu = {
						draw = {
							components = {
								kind_icon = {
									text = function()
										return ""
									end,
								},
							},
						},
					},
					list = {
						selection = {
							preselect = true,
							auto_insert = true,
						},
					},
				},
			},
			opts_extend = { "sources.providers" },
		},
		-->

		--< Mason
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
				ensure_installed = {
					"jdtls",
					"lua_ls",
				},
				automatic_enable = {
					exclude = {
						-- needs external plugin
						"jdtls",
					},
				},
			},
		},
		-->

		--< jdtls
		{
			"mfussenegger/nvim-jdtls",
			config = function()
				vim.lsp.config("jdtls", {
					cmd = { "jdtls" },
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
					end,
				})
				vim.lsp.enable("jdtls")
			end,
		}, -->
		-->

		--< iamcco/markdown-preview.nvim
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			build = "cd app && yarn install",
			init = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown" },
		}, -->

		--< telescope.nvim
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
								["<M-<>"] = actions.results_scrolling_left,
								["<M->>"] = actions.results_scrolling_right,
							},
						},
					},
				})
			end,
		}, -->

		--< colorscheme dump
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
		-- } -->
		-- import your plugins
		-- { import = "plugins" }, -- uncomment to have plugins under ../plugins/
	},

	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})

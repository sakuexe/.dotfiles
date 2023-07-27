-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup lazy_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | Lazy sync
  augroup end
]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Protected call for packer, if fails, then returns
local status, lazy = pcall(require, "lazy")
if not status then
	return
end

local plugins = {
	-- Lua functions that many plugins use
	"nvim-lua/plenary.nvim",
	-- Colorschemes
	"Shatur/neovim-ayu",
	{ "catppuccin/nvim", as = "catppuccin" },
	"JoosepAlviste/palenightfall.nvim",
	"AhmedAbdulrahman/aylin.vim",
	"navarasu/onedark.nvim",
	"xiyaowong/nvim-transparent",
	-- Essential nvim plugins
	"tpope/vim-surround", -- ysw & csw,
	"tpope/vim-commentary", -- gc,
	-- auto closing
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	-- Statusline
	"nvim-lualine/lualine.nvim",
	-- Git plugins
	"lewis6991/gitsigns.nvim",
	-- use("tpope/vim-fugitive")
	-- Undo tree
	"mbbill/undotree",
	-- Automatic saving (like in VSCode)
	"Pocco81/auto-save.nvim",

	-- Autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	-- Managing and installing LSP servers, linters and formatters
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	--Configuring LSP servers
	"neovim/nvim-lspconfig", -- easily configure language servers,
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion
	{
		-- enhanced lsp UIs
		"glepnir/lspsaga.nvim",
		branch = "main",
	},
	"onsails/lspkind.nvim", -- vscode like icons for autocompletion,
	-- Formatting and linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",
	-- Snippets
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	-- github copilot
	"github/copilot.vim",

	-- Tmux compability
	"christoomey/vim-tmux-navigator",
	-- hotkey helper - Definitely not like Emacs
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},
	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	-- Fuzzy finding with telescope
	{
		-- dependency for fuzzy finder
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
	},
	-- -- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- start screen/greeter
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = true,
	},
	"karb94/neoscroll.nvim",
	-- django plus
	-- use("tweekmonster/django-plus.vim")
}

local opts = {}

lazy.setup(plugins, opts)

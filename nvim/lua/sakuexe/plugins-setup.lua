-- Automatically installs and sets up packer.nvim when you clone this config

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Protected call for packer, if fails, then returns
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Lua functions that many plugins use
	use("nvim-lua/plenary.nvim")

	-- Colorschemes
	use("Shatur/neovim-ayu")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("JoosepAlviste/palenightfall.nvim")
	use("AhmedAbdulrahman/aylin.vim")
	use("navarasu/onedark.nvim")
	use("xiyaowong/nvim-transparent")

	-- Essential nvim plugins
	use("tpope/vim-surround") -- ysw & csw
	use("tpope/vim-commentary") -- gc

	-- auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- File explorer
	-- remove the deprecated commands from v1.x
	vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- Fuzzy finding with telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for fuzzy finder
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- Statusline
	use("nvim-lualine/lualine.nvim")

	-- Git plugins
	use("lewis6991/gitsigns.nvim")
	-- use("tpope/vim-fugitive")

	-- Undo tree
	use("mbbill/undotree")

	-- Automatic saving (like in VSCode)
	use("Pocco81/auto-save.nvim")

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Managing and installing LSP servers, linters and formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--Configuring LSP servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp UIs
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server
	use("onsails/lspkind.nvim") -- vscode like icons for autocompletion

	-- Formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Tmux compability
	use("christoomey/vim-tmux-navigator")

	-- github copilot
	use("github/copilot.vim")

	-- django plus
	-- use("tweekmonster/django-plus.vim")

	-- color highlighting / preview
	use("chrisbra/Colorizer")

	-- start screen greeter
	use("goolord/alpha-nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)

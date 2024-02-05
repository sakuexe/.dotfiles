# **My Neovim config**

This repository includes the configuration files needed for my
Neovim setup.

It is recommended to use this as a base for your own Neovim configuration instead
of just blindly copying it.

## **Installation notes**

REQUIRED DEPENDENCIES:

- NodeJS ([Nvm](https://github.com/nvm-sh/nvm#install--update-script) recommended)
- Git

Recommended Dependencies

- RipGrep (Telescope FuzzyFinder)
- gcc (System GNU C compiler for treesitter)
- g++ (System GNU C++ compiler for treesitter)
- make (for native fzf to work)
- xclip (for clipboard between vm and host)

```bash
# Ubuntu
sudo apt install -y git ripgrep gcc g++ make
# Opensuse
sudo zypper install -y git ripgrep gcc gcc-c++ make
```

1.) Install latest neovim appimage

[Link to latest Neovim Release](https://github.com/neovim/neovim/releases/tag/stable)

```bash
# Download nvim.appimage from the link above
chmod u+x nvim.appimage
./nvim.appimage
# OPTIONAL: Expose neovim globally
sudo mkdir /neovim && sudo mv nvim.appimage /neovim
sudo ln -s /neovim/nvim.appimage /usr/bin/nvim
nvim
```

1.2.) If your distro doesn't have FUSE

```bash
./nvim.appimage --appimage-extract
./squashfs-root/usr/bin/nvim
# OPTIONAL: Expose neovim globally
sudo mv squashfs-root/ /neovim/
sudo ln -s /neovim/squashfs-root/usr/bin/nvim /usr/bin/nvim
```

2.) Open Neovim and let it install the plugins

```bash
# You might need to repeat this step a few times
# If problems arise, check the health of your neovim installation
nvim --version
nvim # :checkhealth
```

## **Plugins**

#### Plugin manager

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

### Dependencies for plugins

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim) - Nice icons for LSP

### Colorschemes

- [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim) - Currently using
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

#### `basics.lua`

- [tpope/vim-surround](https://github.com/tpope/vim-surround) - "ys", "ds" and "cs"
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary) - "gc" or "gcc"
- [christoomey/vim-tmux-navigator](https://github.com/lewis6991/gitsigns.nvim) - Seamless navigation between Neovim and Tmux

#### Treesitter

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

#### Navigation

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - File finder
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim) - Navigating diagnostics

#### LSP

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Easier way to configure LSP servers
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - LSP server manager
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Bridges gap between mason & lspconfig
- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine
- [github/copilot.nvim](https://github.com/github/copilot.vim) - Github Copilot integration

#### Autocompletion

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Autocompletion engine
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - LSP completion
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/nvim-cmp) - Buffer's text completion
- [hrsh7th/cmp-path](https://github.com/hrsh7th/nvim-cmp) - File path completion
- [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) - Command line completion
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - Snippet completion

#### Status Line

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

#### Git

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Shows Git color-coded lines on the left side

#### Undo tree

- [mbbill/undotree](https://github.com/mbbill/undotree) - Visualize undo history and switch between old undos

#### UX improvements

- [folke/noice.nvim](https://github.com/folke/noice.nvim) - Improves the command-line access
- [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify) - Notifications for Neovim

## **Other Dev Tools**

#### Live Server - npm package for live-server esque functionality

- [www.chiarulli.me/Neovim/20-live-server](https://www.chiarulli.me/Neovim/20-live-server/) - For automatically refreshing the browser

```bash
npm install -g live-server
# preview a folder
live-server some-directory/
# or a singular file
live-server some-file.html
```

# **My Neovim config**

This repository includes the configuration files needed for my
Neovim setup.

It is recommended to use this as a base for your own Neovim configuration instead
of just blindly copying it.

## **Installation notes**

REQUIRED DEPENDENCIES:

- NodeJS ( [Nvm](https://github.com/nvm-sh/nvm#install--update-script) recommended )
- Git

Recommended Dependencies

- RipGrep ( Telescope FuzzyFinder)
- gcc ( C-compiler for treesitter )
- g++ ( Another C compiler for LSP )
- make ( for native fzf to work )
- xclip ( for clipboard between vm and host )

```bash
sudo apt install git ripgrep gcc g++ make python3.8-venv
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

### Other plugins' dependency

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

### Colorschemes I enjoy

- [Shatur/neovim-ayu](https://github.com/Shatur/neovim-ayu)
- [JoosepAlviste/palenightfall.nvim](https://github.com/JoosepAlviste/palenightfall.nvim)
- [AhmedAbdulrahman/aylin.vim](https://github.com/AhmedAbdulrahman/aylin.vim)
- [navarasu/onedark.nvim](https://github.com/navarasu/onedark.nvim) - Currently using
- [xiyaowong/nvim-transparent](https://github.com/xiyaowong/nvim-transparent) - Enables transparency

#### Neovim essentials

- [tpope/vim-surround](https://github.com/tpope/vim-surround) - "ys", "ds" and "cs"
- [tpope/vim-commentary](https://github.com/tpope/vim-commentary) - "gc" or "gcc"
- [windwp/nvim-utopairs](https://github.com/windwp/nvim-autopairs)
- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [Pocco81/auto-save.nvim](https://github.com/Pocco81/auto-save.nvim) - "Space-as" to toggle

#### File explorer / Finders

- [nvim-neo-tree/neotree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - Dependency for fzf performance

#### Status Line

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

#### Icons for telescope and nvim-tree

- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)

#### Autocompletion

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/nvim-cmp) - Completion for text in buffer
- [hrsh7th/cmp-path](https://github.com/hrsh7th/nvim-cmp) - Completion for file paths

#### Managing & installing language servers, linters and formatters

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Bridges gap between mason & lspconfig

#### LSP Configuration

- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Easier way to configure LSP servers
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - Smart autocompletion with LSP
- [glepnir/lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - Enhanced UI
- [jose-elias-alvarez/typescript.nvim](https://github.com/jose-elias-alvarez/typescript.nvim)
- [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim) - VsCode like icons for autocompletion
- [github/copilot.nvim](https://github.com/github/copilot.vim) - Github Copilot integration

#### Formatting and linting

- [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) - Easy way to configure formatters and linters
- [jayp0521/mason-null-ls.nvim](https://github.com/jayp0521/mason-null-ls.nvim)

#### Snippets

- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)

#### Better syntax highlighting

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [chrisbra/Colorizer](https://github.com/chrisbra/Colorizer) - Color highlighting

#### Git

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Shows Git color-coded lines on the left side
<!-- - [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) - Git tool for Nvim -->

#### Tmux integration

- [christoomey/vim-tmux-navigator](https://github.com/lewis6991/gitsigns.nvim) - Better integrated terminal

#### Undo tree

- [mbbill/undotree](https://github.com/mbbill/undotree) - Visualize undo history and switch between old undos

#### Greeter

- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim) - For when opening Neovim without files or folders selected

## **Miscellaneous**

#### Live Server - npm package for live-server esque functionality

- [www.chiarulli.me/Neovim/20-live-server](https://www.chiarulli.me/Neovim/20-live-server/) - For automatically refreshing the browser

```bash
npm install -g live-server
# preview a folder
live-server some-directory/
# or a singular file
live-server some-file.html
```

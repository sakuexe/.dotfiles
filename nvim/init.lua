--   .-')     ('-.    .-. .-')                 ('-.  ) (`-.        ('-.                            ('-.
--  ( OO ).  ( OO ).-.\  ( OO )              _(  OO)  ( OO ).    _(  OO)     © SakuK - 2022       ( OO ).-.
-- (_)---\_) / . --. /,--. ,--. ,--. ,--.   (,------.(_/.  \_)-.(,------.   ,--.     ,--. ,--.    / . --. /
-- /    _ |  | \-.  \ |  .'   / |  | |  |    |  .---' \  `.'  /  |  .---'   |  |.-') |  | |  |    | \-.  \
-- \  :` `..-'-'  |  ||      /, |  | | .-')  |  |      \     /\  |  |       |  | OO )|  | | .-').-'-'  |  |
--  '..`''.)\| |_.'  ||     ' _)|  |_|( OO )(|  '--.    \   \ | (|  '--.    |  |`-' ||  |_|( OO )\| |_.'  |
-- .-._)   \ |  .-.  ||  .   \  |  | | `-' / |  .--'   .'    \_) |  .--'   (|  '---.'|  | | `-' / |  .-.  |
-- \       / |  | |  ||  |\   \('  '-'(_.-'  |  `---. /  .'.  \  |  `---..-.|      |('  '-'(_.-'  |  | |  |
--  `-----'  `--' `--'`--' '--'  `-----'     `------''--'   '--' `------'`-'`------'  `-----'     `--' `--'

-- core/native settings
require("sakuexe.core.options")
require("sakuexe.core.hotkeys")
require("sakuexe.core.colorscheme")
-- plugins setup
require("sakuexe.plugins-setup")
-- file navigation
require("sakuexe.plugins.nvim-tree")
require("sakuexe.plugins.telescope")
require("sakuexe.plugins.lualine")
-- lsp and autocompletion
require("sakuexe.plugins.nvim-cmp")
require("sakuexe.plugins.lsp.mason")
require("sakuexe.plugins.lsp.lspsaga")
require("sakuexe.plugins.lsp.lspconfig")
require("sakuexe.plugins.lsp.null-ls")
require("sakuexe.plugins.lsp.copilot")
-- others
require("sakuexe.plugins.autopairs")
require("sakuexe.plugins.treesitter")
require("sakuexe.plugins.gitsigns")
require("sakuexe.plugins.auto-save")

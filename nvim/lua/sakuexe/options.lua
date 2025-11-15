-- encoding
vim.opt.encoding = "utf-8"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- text wrapping
vim.opt.wrap = false

-- tabs & indentation
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
-- vim.opt.inccommand = "split" -- shows the s/ commands replacements in a split

-- cursor line
vim.opt.cursorline = false
-- vim.vim.opt.hi.cursorline = guibg=#1f142b

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0

-- scroll offset
vim.opt.scrolloff = 8

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Nvim now counts - as part of a word
vim.opt.iskeyword:append("-")

-- show diagnostics inline
vim.diagnostic.config({ virtual_text = true })

local opt = vim.opt -- more concise

-- line numbers
opt.number = true
opt.relativenumber = true

-- text wrapping
opt.wrap = false

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- backup files
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- scroll offset
opt.scrolloff = 8

-- encoding and clipboard
opt.encoding = "utf-8"
-- opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Nvim now counts - as part of a word
opt.iskeyword:append("-")

opt.cmdheight = 0

local nnoremap = require("sakuexe.core.keymaphelp").nnoremap
local inoremap = require("sakuexe.core.keymaphelp").inoremap
local vnoremap = require("sakuexe.core.keymaphelp").vnoremap
local xnoremap = require("sakuexe.core.keymaphelp").xnoremap
local tnoremap = require("sakuexe.core.keymaphelp").tnoremap

-- Assign <Leader> key
vim.g.mapleader = " "

-- Exit insert mode without pressing CTRL-C || Escape
inoremap("kj", "<Esc>")
inoremap("jk", "<Esc>")

-- reload nvim with f5
nnoremap("<F5>", ":luafile %<CR>")

-- Remove search highlighting with Space-nh
nnoremap("<Leader>nh", ":nohlsearch<CR>")

-- Set space-tab to move between buffers
nnoremap("<Leader><Tab>", ":bnext<CR>")
nnoremap("<Leader><S-Tab>", ":bprev<CR>")

-- Jump between windows with <leader> h and l
nnoremap("<leader>l", ":bnext<CR>zz")
nnoremap("<leader>h", ":bprev<CR>zz")
-- nnoremap("<C-l>", ":bnext<CR>")
-- nnoremap("<C-h>", ":bprev<CR>")

-- Move lines that are selected with J and K
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- When moving lines with J, keep cursor in place
nnoremap("J", "mzJ`z")

-- Set space-w to work as CTRL-w
nnoremap("<leader>w", "<C-w>")

-- Set ALT+movement keys to resize window
nnoremap("<M-k>", ":resize +1<CR>")
nnoremap("<M-j>", ":resize -1<CR>")
nnoremap("<M-l>", ":vertical resize +1<CR>")
nnoremap("<M-h>", ":vertical resize -1<CR>")

-- Better indenting - Doesn't remove visual mode when indenting
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Incredible keymaps, pastes and removes text without putting
-- the text it replaces in clipboard
xnoremap("<leader>p", '"_dP')
nnoremap("x", '"_x')

-- Press Space-y to yoink text into system clipboard
nnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", '"+Y')
vnoremap("<leader>y", '"+y')

-- Increases/Decreases numbers incrementally
nnoremap("<leader>+", "<C-a>")
nnoremap("<leader>-", "<C-a>")

-- Split window hotkeys
nnoremap("<leader>sv", "<C-w>v") -- split vertically
nnoremap("<leader>sh", "<C-w>s") -- split horizontally
nnoremap("<leader>se", "<C-w>=") -- make splits equal width
nnoremap("<leader>sx", ":close<CR>") -- close current split

-- Make half page jumping keep cursor in the center
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- When jumping to search terms, keep the term in the middle
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

-- Delete buffer with Space-bd
nnoremap("<leader>bd", ":bd<CR>")

-- Start replacing the current word you are hovering over Very very lovely.
-- You can also use the lspsaga version with <leader>rn
nnoremap("<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- <[ Plugin Keymaps ]> --
-- for plugins that do not require their own configs

-- Undotree toggle
nnoremap("<leader>u", ":UndotreeToggle<CR>")

-- Git fugitive
-- nnoremap("<leader>gs", ":Git<CR>")

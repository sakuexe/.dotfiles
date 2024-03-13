-- set leader key to space
vim.g.mapleader = " "

-- for conciseness
local keymap = vim.keymap.set
local silent = { silent = true }

-- open netrw
keymap("n", "<leader>e", ":Explore<CR>", silent)

-- reload nvim with F5
keymap("n", "<F5>", ":luafile%<CR>")

-- remove search highlight with leader-nh
keymap("n", "<leader>nh", ":nohlsearch<CR>", silent)

-- when jumping half pages, keep cursor in the center
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- when navigating search items, keep cursor in the center
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- use tab to move between buffers
keymap("n", "<Tab>", ":bnext<CR>zz", silent)
keymap("n", "<S-Tab>", ":bprev<CR>zz", silent)

-- delete buffer with leader bd
keymap("n", "<leader>bd", ":bd<CR>", silent)

-- when moving lines with J, keep cursor in place
keymap("n", "J", "mzJ`z")

-- set ALT + movement keys to resize windows
keymap("n", "<M-k>", ":resize +2<CR>", silent)
keymap("n", "<M-j>", ":resize -2<CR>", silent)
keymap("n", "<M-l>", ":vertical resize +2<CR>", silent)
keymap("n", "<M-h>", ":vertical resize -2<CR>", silent)

-- Paste over text without replacing it in copy
-- (One of my favorite keymaps)
keymap("n", "<leader>p", '"_dP')
keymap("n", "x", '"_x')

-- Yoink to system clipboard instead of nvim's
keymap("n", "<leader>y", '"+y')
keymap("n", "<leader>Y", '"+Y')
keymap("v", "<leader>y", '"+y') -- visual mode

-- increment numbers with plus and minus signs
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- window splitting hotkeys
keymap("n", "<leader>sv", "<C-w>v")     -- split vertically
keymap("n", "<leader>sh", "<C-w>h")     -- split horizontally
keymap("n", "<leader>se", "<C-w>=")     -- make splits equal width
keymap("n", "<leader>sx", ":close<CR>") -- close current split

-- rewrite all occurences of word under cursor in current buffer
keymap("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Insert Mode
-- Exit insert mode with jk
keymap("i", "jk", "<Esc>")

-- Visual Mode
-- move lines that are selected
keymap("v", "J", ":m '>+1<CR>gv=gv", silent)
keymap("v", "K", ":m '<-2<CR>gv=gv", silent)

-- better indenting, don't remove selection after
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
keymap("v", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- enable colorcolumn
function ToggleColorColumn()
  if (vim.o.colorcolumn == "80") then
    vim.cmd("set colorcolumn=0")
  else
    vim.cmd("set colorcolumn=80")
  end
end

keymap("n", "<leader>cc", ToggleColorColumn)

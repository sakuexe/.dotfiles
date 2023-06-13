local status, _ = pcall(vim.cmd, "colorscheme onedark")
if not status then
	print("Colorscheme not found")
	return
end

local opt = vim.opt -- more concise

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

vim.cmd("highlight VertSplit guibg=#00000000")
vim.cmd("highlight VertSplit guifg=#444155")
-- vim.cmd("lua print('hello')")

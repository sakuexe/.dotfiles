local status, _ = pcall(vim.cmd, "colorscheme palenightfall")
if not status then
	print("Colorscheme not found")
	return
end

if vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end

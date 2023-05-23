local term_setup, toggleterm = pcall(require, "toggleterm")
if not term_setup then
	return
end

toggleterm.setup({
	open_mapping = [[<C-t>]],
	direction = "float",
	float_opts = {
		border = "curved",
	},
})

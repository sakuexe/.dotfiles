local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local remap_setup, remap = pcall(require, "sakuexe.core.keymaphelp")
if not remap_setup then
	return
end

local nnoremap = remap.nnoremap

-- hotkeys for opening telescope
nnoremap("<leader>ff", ":Telescope find_files<CR>")
nnoremap("<leader>fh", ":Telescope find_files hidden=true<CR>")
nnoremap("<leader>fg", ":Telescope live_grep<CR>")
nnoremap("<leader>fc", ":Telescope grep_string<CR>")
nnoremap("<leader>fb", ":Telescope buffers<CR>")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
})

telescope.load_extension("fzf")

local autosave_setup, autosave = pcall(require, "auto-save")
if not autosave_setup then
	print("Autosave failed to load")
	return
end

autosave.setup({
	enabled = false, -- start auto-save when the plugin is loaded
	write_all_buffers = false, -- write all buffers when the current one meets `condition`
})

-- disable autosave with Space-as
vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})

-- if enabled does not want to work, disable it on startup with the following
vim.cmd("silent! ASToggle")

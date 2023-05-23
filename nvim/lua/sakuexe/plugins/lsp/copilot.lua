-- don't use copilot on the following filetypes
vim.g.copilot_filetypes = {
	["*"] = true,
	["lua"] = false,
}

vim.g.copilot_assume_mapped = true

-- change the copilot's suggestions color
-- vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]

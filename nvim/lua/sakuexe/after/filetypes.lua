-- filetype specific functions and options

-- in csharp files, make indentation 4 spaces
-- instead of the default 2
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end
})

-- returns a function that can be used as a keymap function
-- the lsp param is the name of the language server you want to filter out
-- this way it is easy to handle lsp format conflicts
function generateFilteredFormat(lsp)
  return function()
    vim.lsp.buf.format { filter = function(client) return client.name ~= lsp end }
  end
end

-- templ: don't use html lsp's formatting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "templ",
  callback = function()
    -- only apply the keymap set to current buffer
    local opts = { buffer = true, }
    vim.keymap.set("n", "<C-F>", generateFilteredFormat("html"), opts)
  end
})

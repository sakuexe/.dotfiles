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

-- Highlight when yanking
-- yanked from kickstart.nvim
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L198

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

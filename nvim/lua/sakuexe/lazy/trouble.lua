return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- https://github.com/folke/trouble.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  },
  config = function()
    vim.keymap.set("n", "<leader>t", ":TroubleToggle<CR>")
  end
}

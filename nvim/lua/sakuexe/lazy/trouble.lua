return {
  -- navigate diagnostics, no need to use vim.diagnostic.*()
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- https://github.com/folke/trouble.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    require("trouble").setup({
      position = "top",
    })
    vim.keymap.set("n", "<leader>t", ":TroubleToggle<CR>")
  end
}

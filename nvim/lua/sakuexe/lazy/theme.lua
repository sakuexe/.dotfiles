function ColorschemeTweaks(color)
  color = color or "onedark"
  vim.cmd.colorscheme(color)

  -- remove background color from theme
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- split indicator coloring
  vim.cmd("highlight VertSplit guibg=#00000000")
  vim.cmd("highlight VertSplit guifg=#444155")
end

return {
  {
    "navarasu/onedark.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- ColorschemeTweaks()
      require("onedark").setup({
        transparent = true,
        diagnostics = {
          background = false,
          darker = false,
          undercurl = true,
        }
      })
      vim.cmd([[colorscheme onedark]])
    end,
  },
  "folke/tokyonight.nvim",
}

return {
  {
    "navarasu/onedark.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("onedark").setup({
        transparent = true,
        diagnostics = {
          background = false,
          darker = false,
          undercurl = true,
        },
        lualine = {
          transparent = true,
        }
      })
      vim.cmd([[colorscheme onedark]])
      -- colorcolumn
      vim.cmd("highlight ColorColumn guibg=#303030")
      -- these were needed after the 0.11 update
      -- if the top and bottom bars are transparent without them
      -- remove these two lines
      vim.cmd([[ highligh StatusLine guibg=NONE ]])
      vim.cmd([[ highligh StatusLineNC guibg=NONE ]])
      vim.cmd([[ highligh TabLineFill guibg=NONE ]])
    end,
  },
  "folke/tokyonight.nvim",
}

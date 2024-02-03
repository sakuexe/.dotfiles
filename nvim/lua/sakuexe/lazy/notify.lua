return {
  {
    "rcarriga/nvim-notify",
    lazy = true,
    config = function()
      require("notify").setup({
        background_colour = "#000000", -- makes it shut up
        render = "compact",
      })
    end,
  }
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript", "typescript", "lua", "python", "bash",
          "markdown", "markdown_inline", "html", "css", "json"
        },
        auto_install = true,
        -- automatically enable treesitter highlighting
        highlight = {
          enable = true
        },
        indent = { enable = true },
      })
    end
  }
}

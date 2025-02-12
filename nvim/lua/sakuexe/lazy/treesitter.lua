return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "jmbuhr/otter.nvim",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript", "jsdoc", "typescript", "go", "lua", "python", "bash",
          "markdown", "markdown_inline", "html", "css", "json"
        },
        auto_install = true,
        -- automatically enable treesitter highlighting
        highlight = {
          enable = true
        },
        indent = { enable = true },
      })

      -- otter.nvim - use LSPs in embedded code blocks 
      -- (with the use of TreeSitter)
      require("otter").setup({
        lsp = {
          -- for more performant diagnostic updates, use
          -- { "BufWritePost" } instead
          diagnostic_update_events = { "BufWritePost", "InsertLeave", "TextChanged" },
        }
      })

      -- TODO: move this to be activated in only specified files
      -- after/ftplugin/nix for example
      -- automatically activate otter.nvim when entering a buffer
      -- https://neovim.io/doc/user/autocmd.html#BufEnter
      -- vim.api.nvim_create_autocmd(
      --   "BufEnter", {
      --     command = [[ lua require("otter").activate() ]],
      --   })
    end
  }
}

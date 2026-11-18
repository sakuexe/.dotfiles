return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        preview_config = {
          border = "single",
          style = "minimal",
        },
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
          end
          -- jump between changed hunks in the current file
          map("]h", function() gs.nav_hunk("next") end, "Next hunk")
          map("[h", function() gs.nav_hunk("prev") end, "Previous hunk")
          -- show the old code inline only when you want it
          map("<leader>hp", gs.preview_hunk_inline, "Preview hunk inline")
          map("<leader>hr", gs.reset_hunk, "Reset (discard) hunk")
          map("<leader>hs", gs.stage_hunk, "Stage hunk")
          -- all hunks of the repo into quickfix (works with :cnext / Trouble)
          map("<leader>hq", function() gs.setqflist("all") end, "Hunks to quickfix")
        end,
      })
    end
  }
}

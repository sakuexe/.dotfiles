return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      ["*"] = true,
      ["lua"] = false,
    }
    vim.g.copilot_assume_mapped = true
    -- disable copilot by default, for my own good
    vim.cmd("Copilot disable")
  end
}

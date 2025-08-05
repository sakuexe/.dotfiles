return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-e>",
          accept_word = "<C-l>",
        },
        disable_inline_completion = false,
      })
      local api = require("supermaven-nvim.api")
      api.stop() -- disable by default
      vim.keymap.set("n", "<leader>sm", api.toggle)
    end,
  },
}

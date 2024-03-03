return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets"
  },
  config = function()
    -- https://github.com/rafamadriz/friendly-snippets?tab=readme-ov-file#with-lazynvim
    require("luasnip.loaders.from_vscode").lazy_load()
    local opts = { noremap = true, silent = true }
    -- jump between insert nodes
    vim.keymap.set("i", "<c-j>", "<cmd>lua require('luasnip').jump(1)<CR>", opts)
    vim.keymap.set("s", "<c-j>", "<cmd>lua require('luasnip').jump(1)<CR>", opts)
    vim.keymap.set("i", "<c-k>", "<cmd>lua require('luasnip').jump(-1)<CR>", opts)
    vim.keymap.set("s", "<c-k>", "<cmd>lua require('luasnip').jump(-1)<CR>", opts)
    -- TODO: add custom snippets, e.g. markdown links and if err != nill
  end
}

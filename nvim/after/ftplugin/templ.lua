-- returns a function that can be used as a keymap function
-- the lsp param is the name of the language server you want to filter out
-- this way it is easy to handle lsp format conflicts
local function generateFilteredFormat(lsp)
  return function()
    vim.lsp.buf.format { filter = function(client) return client.name ~= lsp end }
  end
end

-- only apply the keymap set to current buffer
local opts = { buffer = true, }
local formattingLsp = "html"

vim.keymap.set("n", "<C-F>", generateFilteredFormat(formattingLsp), opts)

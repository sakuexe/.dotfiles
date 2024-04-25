return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5", -- or, branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('telescope').setup({
        defaults = {
          -- automatically ignores .gitignore files
          -- but add additional ones here
          file_ignore_patterns = {
            "venv",
            "node_modules",
          }
        }
      })

      local builtin = require('telescope.builtin')

      -- the main search, respects gitignore, searches project
      vim.keymap.set('n', '<C-p>', function()
        local success, _ = pcall(builtin.git_files)
        if not success then
          -- if git_files couldn't be run, use find_files instead
          return builtin.find_files()
        end
      end, {})
      -- find files with the base of current dir, do not respect .gitignore
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files({ no_ignore = true })
      end)
      -- find recents
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
      -- text search with grep
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      -- search word under cursor
      vim.keymap.set('n', '<leader>ps', function()
        local word = vim.fn.expand("<cword>")
        builtin.grep_string({ search = word })
      end)
      -- search WORD under cursor
      vim.keymap.set('n', '<leader>pS', function()
        local word = vim.fn.expand("<cWORD>")
        builtin.grep_string({ search = word })
      end)
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<C-b>', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      -- go to references
      vim.keymap.set('n', 'gr', builtin.lsp_references, {})
    end
  },
}

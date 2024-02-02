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

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      -- show hidden files
      vim.keymap.set('n', '<C-p>', builtin.git_files, {})
      -- find recents
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {})
      -- text search with grep
      vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
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
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    end
	},
}

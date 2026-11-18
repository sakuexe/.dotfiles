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
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      -- go to references
      vim.keymap.set('n', 'gr', builtin.lsp_references, {})

      -- list every changed hunk (staged + unstaged + untracked files) vs HEAD
      local function git_hunks()
        local pickers = require('telescope.pickers')
        local finders = require('telescope.finders')
        local conf = require('telescope.config').values

        local root = vim.fn.systemlist({ 'git', 'rev-parse', '--show-toplevel' })[1]
        if vim.v.shell_error ~= 0 then
          return vim.notify('Not inside a git repository', vim.log.levels.WARN)
        end

        local results = {}
        local file, pending
        local diff = vim.fn.systemlist({ 'git', '-C', root, 'diff', 'HEAD', '-U0', '--no-color', '--no-ext-diff' })
        for _, line in ipairs(diff) do
          local f = line:match('^%+%+%+ b/(.+)$')
          if f then
            file, pending = f, nil
          elseif line:match('^%+%+%+ /dev/null') then
            file, pending = nil, nil -- deleted file, nothing to jump to
          else
            local start, count = line:match('^@@ %-%d+,?%d* %+(%d+),?(%d*) @@')
            if start and file then
              pending = {
                filename = root .. '/' .. file,
                rel = file,
                lnum = math.max(tonumber(start), 1),
                text = count == '0' and '[deleted lines]' or '',
              }
              table.insert(results, pending)
            elseif pending and pending.text == '' and line:sub(1, 1) == '+' then
              pending.text = vim.trim(line:sub(2))
            end
          end
        end

        -- brand new files are not in `git diff`
        for _, f in ipairs(vim.fn.systemlist({ 'git', '-C', root, 'ls-files', '--others', '--exclude-standard' })) do
          table.insert(results, { filename = root .. '/' .. f, rel = f, lnum = 1, text = '[new file]' })
        end

        if #results == 0 then
          return vim.notify('No git changes', vim.log.levels.INFO)
        end

        pickers.new({}, {
          prompt_title = 'Git changes',
          finder = finders.new_table({
            results = results,
            entry_maker = function(e)
              return {
                value = e,
                display = string.format('%s:%d  %s', e.rel, e.lnum, e.text),
                ordinal = e.rel .. ' ' .. e.text,
                filename = e.filename,
                lnum = e.lnum,
              }
            end,
          }),
          previewer = conf.grep_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end
      vim.keymap.set('n', '<leader>gc', git_hunks, { desc = 'Git changed hunks' })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git changed files' })
    end
  },
}

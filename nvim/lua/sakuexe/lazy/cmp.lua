return {
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },

    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      -- show LSP in cmp window
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local window_style = {
        border = "single",
        -- search colors with :highlight
        winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSbar,Search:None",
      }

      cmp.setup({
        snippet = {
          cmp.setup({
            snippet = {
              expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
              ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
              ["<C-b>"] = cmp.mapping.scroll_docs(-4),
              ["<C-f>"] = cmp.mapping.scroll_docs(4),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
              ["<C-Space>"] = cmp.mapping.complete(), -- show completion window
              ["<C-e>"] = cmp.mapping.abort(),        -- hide completion window
            }),
            sources = cmp.config.sources({
              -- LSP
              { name = 'nvim_lsp' },
              -- Snippets
              { name = 'luasnip' },
              -- words in buffer
              { name = 'buffer' },
              -- paths
              { name = 'path' },
            }),
            window = {
              completion = cmp.config.window.bordered(window_style),
              documentation = cmp.config.window.bordered(window_style),
            },
            view = {
              entries = { name = "custom", selection_order = "near_cursor" },
            },
          })
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              path = "[Path]",
            })
          })
        }
      })
    end
  },
}
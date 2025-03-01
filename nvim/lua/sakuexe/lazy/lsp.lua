return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      -- make lua lsp find vim definitions
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },

  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    -- set up the LSP related keymappings
    local on_attach = function(client, bufnr)
      -- close quickfix menu after selecting choice
      vim.api.nvim_create_autocmd(
        "FileType", {
          pattern = { "qf" },
          command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>zz]]
        })
    end

    local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
    if not lspconfig_ok then
      -- set an error message
      print "Lspconfig could not be required (lsp.lua)"
      return
    end

    -- the default lsp configuration
    local lsps = { "cssls", "jsonls", "lua_ls", "csharp_ls", "volar" }
    for _, lsp in ipairs(lsps) do
      lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
    end

    lspconfig.ts_ls.setup {
      settings = {
        implicitProjectConfiguration = {
          checkJs = true
        },
      },
      init_options = {
        -- enable vue lsp
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
            languages = { "javascript", "typescript", "vue" },
          },
        },
      },
      filetypes = {
        "javascript",
        "typescript",
        "vue",
      },
    }

    lspconfig.emmet_ls.setup {
      filetypes = { "templ", "htmldjango", },
      capabilities = capabilities,
      on_attach = on_attach,
    }

    lspconfig.html.setup {
      filetypes = { "htmldjango", "templ" },
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- nix language server
    lspconfig.nixd.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "nixd" },
      settings = {
        nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }",
          },
          formatting = {
            command = { "nixfmt" }, -- or nixpkgs-fmt || alejandra
          },
          -- https://github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md
          options = {
            nixos = {
              expr = '(builtins.getFlake "github:sakuexe/Nixos").nixosConfigurations.ringtail.options',
            },
            home_manager = {
              expr =
              '(builtins.getFlake "github:sakuexe/Nixos").nixosConfigurations.ringtail.options.home-manager.users.value."${builtins.getEnv "USER"}"',
            },
          },
        },
      },
    })
  end
}

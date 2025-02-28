return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
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

    -- use csharp_ls (it needs specific stuff because fuck you I guess)
    require("lspconfig").csharp_ls.setup({ 
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- nix language server
    require("lspconfig").nixd.setup({
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
              expr = '(builtins.getFlake "github:sakuexe/Nixos").nixosConfigurations.ringtail.options.home-manager.users.value."${builtins.getEnv "USER"}"',
            },
          },
        },
      },
    })

    -- set up the LSP
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "lua_ls",
        "html",
        "cssls",
        "emmet_ls",
        "jsonls",
      },


      automatic_installation = true,
      handlers = {
        function(server_name) -- default handler
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach
          })
        end,

        ["ts_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.ts_ls.setup {
            settings = {
              implicitProjectConfiguration = {
                checkJs = true
              },
            },
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                  languages = {"javascript", "typescript", "vue"},
                },
              },
            },
            filetypes = {
              "javascript",
              "typescript",
              "vue",
            },

          }
        end,

        ["emmet_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.emmet_ls.setup {
            filetypes = { "templ", "htmldjango", },
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end,

        ["html"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.html.setup {
            filetypes = { "htmldjango", "templ" },
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      },
    })
  end
}

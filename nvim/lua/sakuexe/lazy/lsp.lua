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
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "<C-F>", ":lua vim.lsp.buf.format()<CR>", opts)           -- format
      vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)                -- hover
      vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>zz", opts)        -- go to definition
      vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)      -- rename under cursor
      vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) -- code action
      vim.keymap.set("n", "<leader>gi", ":lua vim.lsp.buf.references()<CR>", opts)  -- go to implementation
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
        "gopls",
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
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
            }
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

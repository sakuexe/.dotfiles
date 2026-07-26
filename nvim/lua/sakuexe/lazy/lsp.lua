return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
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
        -- LSP keymaps
        local opts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set("n", "<M-f>", vim.lsp.buf.format, opts)                        -- format
        vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)                -- hover
        vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>zz", opts)        -- go to definition
        vim.keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)      -- rename under cursor
        vim.keymap.set("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts) -- code action
        vim.keymap.set("n", "<leader>gi", ":lua vim.lsp.buf.references()<CR>", opts)  -- go to implementation

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

        -- mason - for installing lsp's more easily
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "html",
                "cssls",
                "emmet_ls",
                "jsonls",
                "tailwindcss",
            },
            automatic_installation = false,
        })

        -- the default lsp configuration
        local lsps = {
            "lua_ls",
            -- "csharp_ls",
            "gopls",
            "templ",
            "volar",
            "cssls",
            "jsonls",
            "tailwindcss",
            "pyright",
            "astro",
            "svelte",
        }
        for _, lsp in ipairs(lsps) do
            vim.lsp.config(lsp, {
                capabilities = capabilities,
                on_attach = on_attach
            })
        end
        vim.lsp.enable(lsps)

        vim.lsp.config("ts_ls", {
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
        })
        vim.lsp.enable("ts_ls")

        vim.lsp.config("emmet_ls", {
            filetypes = { "html", "templ", "htmldjango", "jsx", "tsx", "astro", "svelte" },
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("emmet_ls")

        vim.lsp.config("html", {
            filetypes = { "html", "htmldjango", "templ" },
            capabilities = capabilities,
            on_attach = on_attach,
        })
        vim.lsp.enable("html")

        -- nix language server
        vim.lsp.config("nixd", {
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
        vim.lsp.enable("nixd")
    end
}

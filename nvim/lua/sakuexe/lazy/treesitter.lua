return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        dependencies = {
            "jmbuhr/otter.nvim",
        },
        build = ":TSUpdate",

        config = function()
            local treesitter = require("nvim-treesitter")

            treesitter.setup()

            treesitter.install({
                "javascript",
                "jsdoc",
                "typescript",
                "go",
                "lua",
                "python",
                "bash",
                "markdown",
                "markdown_inline",
                "html",
                "css",
                "json",
                "svelte",
                "c_sharp",
                "nix",
                "dockerfile",
                "yaml",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "go",
                    "lua",
                    "python",
                    "bash",
                    "markdown",
                    "html",
                    "css",
                    "json",
                    "svelte",
                    "cs",
                    "nix",
                    "dockerfile",
                    "yaml",
                    "yml",
                },
                callback = function()
                    vim.treesitter.start()

                    -- New nvim-treesitter indentation API
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            require("otter").setup({
                lsp = {
                    diagnostic_update_events = {
                        "BufWritePost",
                        "InsertLeave",
                        "TextChanged",
                    },
                },
            })

            -- TODO: move this to be activated in only specified files
            -- after/ftplugin/nix for example
            -- automatically activate otter.nvim when entering a buffer
            -- https://neovim.io/doc/user/autocmd.html#BufEnter
            -- vim.api.nvim_create_autocmd(
            --   "BufEnter", {
            --     command = [[ lua require("otter").activate() ]],
            --   })
        end
    }
}

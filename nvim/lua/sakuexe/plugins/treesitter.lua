local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		-- Link to a list of available languages:
		-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
		"javascript",
		"typescript",
		"tsx",
		"html",
		"css",
		"python",
		"markdown",
		"markdown_inline",
		"json",
		"bash",
		"lua",
		"vim",
	},
	auto_install = true,
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"markdown",
				"python",
				"http",
				"yaml",
				"rust",
				"toml",
				"json",
				"javascript",
				"typescript",
				"lua",
				"bash",
				"sql",
				"go",
				"html",
				"css",
			},
			auto_install = false,
			sync_install = false,

			highlight = {
				enable = true,
			},
			indent = { enable = true },
		},
	},
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	opts = {
		ensure_installed = {},
		sync_install = true,
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
		parser_install_dir = vim.fn.stdpath("data") .. "/parsers",
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}

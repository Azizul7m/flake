return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	opts = {
		ensure_installed = {},
		sync_install = true,
		auto_install = false,
		highlight = { enable = true },
		indent = { enable = true },
		parser_install_dir = vim.fn.stdpath("data") .. "/parsers",
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
}

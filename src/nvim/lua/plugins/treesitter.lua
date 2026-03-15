return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	lazy = vim.fn.argc(-1) == 0, -- lazy load if no file is opened
	opts = {
		ensure_installed = { "http", "rust", "toml", "json", "tsx", "go", "templ", "html", "css" },
		auto_install = false,
		sync_install = false,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "templ" },
		},
		indent = { enable = true },
	},

	config = function(_, opts)
		-- Set parser install directory (persistent)
		local parser_dir = vim.fn.stdpath("cache") .. "/treesitter"
		vim.fn.mkdir(parser_dir, "p")

		-- MUST SET: runtimepath entry so TS finds installed parsers
		vim.opt.runtimepath:append(parser_dir)

		opts.parser_install_dir = parser_dir

		require("nvim-treesitter.configs").setup(opts)
	end,
}

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	require("telescope").setup({
		defaults = {
			file_ignore_patterns = { "node_modules" }, -- keep node_modules ignored
			hidden = true, -- show dotfiles like .env
			no_ignore = true,
		},
	}),
}

return {
	{
		"bngarren/checkmate.nvim",
		ft = { "markdown", "obsidian" },
		opts = {
			files = {
				vim.fn.expand("~/.notes/**/*.md"),
			},
		},
	},
}

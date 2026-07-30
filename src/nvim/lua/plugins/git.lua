return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				add = { text = "│" }, -- Thin solid vertical line
				change = { text = "│" }, -- Thin solid vertical line
				delete = { text = "├" }, -- Thin junction pointing right
				topdelete = { text = "┬" }, -- Thin junction pointing down
				changedelete = { text = "┥" }, -- Thin junction combined change/delete
				untracked = { text = "┆" }, -- Thin dashed vertical line
			},
		},
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}

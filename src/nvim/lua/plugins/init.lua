return {
	{
		"uhs-robert/sshfs.nvim",
		event = "VeryLazy",
	},
	{
		"viniciusteixeiradias/todo.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("todo").setup()
		end,
	},
	{
		"m4xshen/smartcolumn.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("smartcolumn").setup({
				disabled_filetypes = { "help", "text", "Dashboard" },
				transparent_background = true,
			})
		end,
	},
	{
		"monaqa/dial.nvim",
		-- lazy-load on keys
		-- mode is `n` by default. For more advanced options, check the section on key mappings
		keys = { "<C-a>", { "<C-x>", mode = "n" } },
	},
}

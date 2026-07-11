return {
	{
		"uhs-robert/sshfs.nvim",
		event = "VeryLazy",
		opts = {
			-- Refer to the configuration section below
			-- or leave empty for defaults
		},
	},
	{
		"viniciusteixeiradias/todo.nvim",
		-- version = "v1.0.0", -- optional: pin to a specific version
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
	require("plugins.obsidian"),
	require("plugins.markdown"),
}

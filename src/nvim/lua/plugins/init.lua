return {
	{
		"uhs-robert/sshfs.nvim",
		opts = {
			-- Refer to the configuration section below
			-- or leave empty for defaults
		},
	},
	{
		"viniciusteixeiradias/todo.nvim",
		-- version = "v1.0.0", -- optional: pin to a specific version
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("todo").setup()
		end,
	},
	{
		"m4xshen/smartcolumn.nvim",
		config = function()
			require("smartcolumn").setup({
				disabled_filetypes = { "help", "text", "Dashboard" },
			})
		end,
	},
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}

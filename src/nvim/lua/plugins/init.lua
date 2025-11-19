return {
	-- Colorscheme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			--		vim.cmd.colorscheme("catppuccin")
		end,
	},

	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({})
			vim.cmd.colorscheme("nord")
		end,
		install = {
			colorscheme = { "nord" },
		},
	},

	{
		"nxhung2304/lastplace.nvim",
		config = function()
			require("lastplace").setup({
				-- your configuration here
			})
		end,
	},
}

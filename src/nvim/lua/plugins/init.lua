return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"tsx",
			"jsx",
		},
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

	{
		"nxhung2304/lastplace.nvim",
		config = function()
			require("lastplace").setup({
				-- your configuration here
			})
		end,
	},
}

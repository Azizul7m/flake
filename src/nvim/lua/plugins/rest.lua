return {
	{
		"mistweaverco/kulala.nvim",
		ft = { "http", "rest" },
		opts = {
			global_keymaps = true,
			global_keymaps_prefix = "<leader>r",

			-- optional: where to store environment variables
			env_file = vim.fn.expand("~/.config/nvim/kulala.env"),
		},
	},
}

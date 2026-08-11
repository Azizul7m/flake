return {
	{
		"mattn/emmet-vim",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 3,
		},
		config = function(_, opts)
			require("treesitter-context").setup(opts)
		end,
	},

	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"xml",
		},
		opts = {
			opts = {
				-- Enable/disable closing tags globally
				enable_close = true,
				-- Enable/disable renaming tags globally
				enable_rename = true,
				-- Close tags when you type a slash "/"
				enable_close_on_slash = true,
			},
		},
		config = function(_, opts)
			require("nvim-ts-autotag").setup(opts)
		end,
	},
}

-- Rust Tools
return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
		config = function()
			-- You might want to add some specific configuration for rustaceanvim here
			-- require("rustaceanvim").setup({})
		end,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
}

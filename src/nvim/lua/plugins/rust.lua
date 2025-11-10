-- Rust Tools
return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false,
	},
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
		end,
	},
	-- {
	-- 	"cordx56/rustowl",
	-- 	version = "*", -- Latest stable version
	-- 	build = "cargo install rustowl",
	-- 	lazy = false, -- This plugin is already lazy
	-- 	opts = {},
	-- },
}

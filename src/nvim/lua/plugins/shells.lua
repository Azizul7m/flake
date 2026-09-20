return {
	"NotAShelf/direnv.nvim",
	config = function()
		require("direnv").setup({
			-- Path to the direnv executable
			bin = "direnv",

			-- Whether to automatically load direnv when entering a directory with .envrc
			autoload_direnv = true,

			-- Keyboard mappings
			keybindings = {
				allow = "<Leader>tea",
				deny = "<Leader>ted",
				reload = "<Leader>ter",
				edit = "<Leader>tee",
			},
		})
	end,
}

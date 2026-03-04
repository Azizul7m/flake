return {
	"nvim-mini/mini.nvim",
	version = "*",
	config = function()
		require("mini.pairs").setup()
		require("mini.statusline").setup()
		require("mini.comment").setup()
		require("mini.align").setup()
		require("mini.pick").setup()
		require("mini.surround").setup()
		require("mini.files").setup({
			mappings = {
				close = "q",
				go_in = "l",
				go_out = "h",
				go_out_plus = "H",
				go_in_plus = "<CR>",
				mark_goto = "'",
				mark_set = "m",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
			windows = {
				preview = true,
			},
		})
	end,
}

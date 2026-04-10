return {
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "darker",
				transparent = false, -- Show/hide background
				term_colors = true,
				code_style = {
					comments = "italic",
					keywords = "italic",
					functions = "italic,bold",
					strings = "none",
					variables = "none",
				},
				colors = {
					bright_orange = "#ff8800", -- define a new color
					green = "#00ffaa", -- redefine an existing color
				},
				highlights = {
					TSKeyword = { fg = "$bright_orange" },
					TSString = { fg = "$green", bg = "#00ff00", fmt = "bold" },
					TSFunction = { fg = "#0000ff", sp = "$cyan", fmt = "underline,italic" },
					TSFuncBuiltin = { fg = "#0059ff" },
				},
			})
			require("onedark").load()
		end,
	},
}

return {
	"nvim-mini/mini.files",
	version = false,
	config = function()
		require("mini.files").setup({
			windows = {
				-- Maximum number of windows to show side by side
				max_number = math.huge,
				-- Whether to show preview of file/directory under cursor
				preview = true,
			},
		})
	end,
}

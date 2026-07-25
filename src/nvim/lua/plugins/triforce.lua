return {
	"gisketch/triforce.nvim",
	dependencies = {
		"nvzone/volt",
	},
	config = function()
		require("triforce").setup({
			-- Optional: Add your configuration here
		})
	end,
}

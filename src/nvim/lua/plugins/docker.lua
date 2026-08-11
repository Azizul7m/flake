return {
	"emrearmagan/dockyard.nvim",
	dependencies = {
		"akinsho/toggleterm.nvim", -- optional
	},
	cmd = { "Dockyard", "DockyardFloat" },
	config = function()
		require("dockyard").setup({})
	end,
}

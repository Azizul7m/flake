return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		dependencies = {
			"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
		},
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = true },
				panel = { enabled = false },
			})
		end,
	},
}

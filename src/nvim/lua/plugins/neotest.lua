return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python")({
					dap = { adapter = "python" },
				}),
			},
		})

		-- Keymaps for testing
		local map = vim.keymap.set
		map("n", "<leader>tn", function()
			require("neotest").run.run()
		end, { desc = "Test Nearest" })
		map("n", "<leader>tf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { desc = "Test File" })
		map("n", "<leader>ts", function()
			require("neotest").summary.toggle()
		end, { desc = "Test Summary" })
		map("n", "<leader>to", function()
			require("neotest").output.open({ enter = true })
		end, { desc = "Test Output" })
	end,
}

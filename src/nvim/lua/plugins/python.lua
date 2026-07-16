return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("dap-python").setup("python3")
			-- Keymaps for debugging
			local map = vim.keymap.set
			map("n", "<leader>dpn", function()
				require("dap-python").test_method()
			end, { desc = "Debug Method" })
			map("n", "<leader>dpf", function()
				require("dap-python").test_class()
			end, { desc = "Debug Class" })
			map("v", "<leader>dps", function()
				require("dap-python").debug_selection()
			end, { desc = "Debug Selection" })

			-- General DAP keymaps
			map("n", "<F5>", function()
				require("dap").continue()
			end, { desc = "Debug: Start/Continue" })
			map("n", "<F1>", function()
				require("dap").step_into()
			end, { desc = "Debug: Step Into" })
			map("n", "<F2>", function()
				require("dap").step_over()
			end, { desc = "Debug: Step Over" })
			map("n", "<F3>", function()
				require("dap").step_out()
			end, { desc = "Debug: Step Out" })
			map("n", "<leader>db", function()
				require("dap").toggle_breakpoint()
			end, { desc = "Debug: Toggle Breakpoint" })
			map("n", "<leader>dB", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Breakpoint" })
		end,
	},
}

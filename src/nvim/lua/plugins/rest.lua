return {
	{
		"mistweaverco/kulala.nvim",
		ft = { "http", "rest" },
		keys = {
			{
				"<leader>trr",
				function()
					require("kulala").run()
				end,
				desc = "Run current request",
			},
			{
				"<leader>tra",
				function()
					require("kulala").run_all()
				end,
				desc = "Run all requests",
			},
			{
				"<leader>trp",
				function()
					require("kulala").replay()
				end,
				desc = "Replay last request",
			},
			{
				"<leader>tri",
				function()
					require("kulala").inspect()
				end,
				desc = "Inspect current request",
			},
			{
				"<leader>trc",
				function()
					require("kulala").copy()
				end,
				desc = "Copy as curl",
			},
			{
				"<leader>trn",
				function()
					require("kulala").scratchpad()
				end,
				desc = "Open scratchpad",
			},
			{
				"<leader>tre",
				function()
					require("kulala").set_env()
				end,
				desc = "Select environment",
			},
			{
				"<leader>trt",
				function()
					require("kulala").toggle_view()
				end,
				desc = "Toggle body/headers",
			},
		},
		opts = {
			-- optional: where to store environment variables
			env_file = vim.fn.expand("~/.config/nvim/kulala.env"),
			ui = {
				icons = {
					inbound = "󰖟",
					outbound = "󰖟",
				},
			},
		},
	},
}

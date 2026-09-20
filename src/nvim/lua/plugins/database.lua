return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	keys = {
		{ "<leader>tdu", "<cmd>DBUIToggle<cr>", desc = "Toggle DBUI" },
		{ "<leader>tdc", "<cmd>DBUIAddConnection<cr>", desc = "Add DB connection" },
		{ "<leader>tdf", "<cmd>DBUIFindBuffer<cr>", desc = "Find DB buffer" },
	},
	init = function()
		-- UI Settings
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_winwidth = 40
		vim.g.db_ui_auto_execute_table_helpers = 0
		vim.g.db_ui_show_help = 1
		vim.g.db_ui_use_postgres_views = 1

		-- Custom icons
		vim.g.db_ui_icons = {
			expanded = "▾",
			collapsed = "▸",
			saved_query = "*",
			new_query = "+",
			tables = "~",
			buffers = "»",
			connection_ok = "✓",
			connection_error = "✕",
		}

		-- Save location for queries
		vim.g.db_ui_save_location = vim.fn.expand("~/.config/nvim/db_ui_queries")
	end,

}

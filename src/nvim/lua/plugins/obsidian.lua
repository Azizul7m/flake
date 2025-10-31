return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		opts = {
			workspaces = {
				{
					name = "vault",
					path = "~/.notes",
				},
			},
			notes_subdir = "notes",
			new_notes_location = "current_dir", -- "notes_subdir" | "current_dir"
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			daily_notes = {
				folder = "daily",
				date_format = "%Y-%m-%d",
				alias_format = "%B %-d, %Y",
				template = "daily.md",
			},
			templates = {
				subdir = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				substitutions = {
					today = function()
						return os.date("%Y-%m-%d")
					end,
				},
			},
			ui = {
				enable = false,
				update_debounce = 200,
				checkboxes = {
					[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
					["x"] = { char = "", hl_group = "ObsidianDone" },
					[">"] = { char = "", hl_group = "ObsidianForward" },
					["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				},
			},
		},

		config = function(_, opts)
			local obsidian = require("obsidian")
			obsidian.setup(opts)

			-- Keymaps
			local map = vim.keymap.set
			local opts = { noremap = true, silent = true, desc = "Obsidian" }

			map("n", "<leader>nn", ":ObsidianNew<CR>", vim.tbl_extend("force", opts, { desc = "New note" }))
			map("n", "<leader>no", ":ObsidianOpen<CR>", vim.tbl_extend("force", opts, { desc = "Open note" }))
			map("n", "<leader>nt", ":ObsidianToday<CR>", vim.tbl_extend("force", opts, { desc = "Today note" }))
			map("n", "<leader>nb", ":ObsidianBacklinks<CR>", vim.tbl_extend("force", opts, { desc = "Backlinks" }))
			map("n", "<leader>ns", ":ObsidianSearch<CR>", vim.tbl_extend("force", opts, { desc = "Search" }))
			map("n", "<leader>nl", ":ObsidianLinks<CR>", vim.tbl_extend("force", opts, { desc = "List links" }))
			map("n", "<leader>nr", ":ObsidianRename<CR>", vim.tbl_extend("force", opts, { desc = "Rename note" }))
		end,
	},
}

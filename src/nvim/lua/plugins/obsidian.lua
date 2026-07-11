return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	ft = { "markdown", "md" },
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false, -- this will be removed in the next major release
		workspaces = {
			{
				name = "vault",
				path = "~/.notes",
			},
		},
		daily_notes = {
			folder = "dailies",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			template = "daily.md",
		},
		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			substitutions = {},
		},
		completion = {
			min_chars = 2,
		},
		attachments = {
			folder = "attachments",
		},
		note_id_func = function(title)
			-- Create note ID from title if provided, otherwise use timestamp
			local suffix = ""
			if title ~= nil then
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,
		ui = { enable = false }, -- Set to true if you want nice UI elements
	},

	config = function(_, opts)
		local obsidian = require("obsidian")
		obsidian.setup(opts)

		-- Keymaps
		local map = vim.keymap.set
		local mopts = { noremap = true, silent = true, desc = "Obsidian" }

		map("n", "<leader>nn", ":Obsidian new<CR>", vim.tbl_extend("force", mopts, { desc = "New note" }))
		map("n", "<leader>no", ":Obsidian open<CR>", vim.tbl_extend("force", mopts, { desc = "Open note" }))
		map("n", "<leader>nt", ":Obsidian tag<CR>", vim.tbl_extend("force", mopts, { desc = "Tag" }))
		map("n", "<leader>nd", ":Obsidian today<CR>", vim.tbl_extend("force", mopts, { desc = "Today's note" }))
		map("n", "<leader>ns", ":Obsidian search<CR>", vim.tbl_extend("force", mopts, { desc = "Search" }))
		map("n", "<leader>nl", ":Obsidian links<CR>", vim.tbl_extend("force", mopts, { desc = "List links" }))
		map("n", "<leader>nr", ":Obsidian rename<CR>", vim.tbl_extend("force", mopts, { desc = "Rename note" }))
		map("n", "<leader>ni", ":Obsidian template<CR>", vim.tbl_extend("force", mopts, { desc = "Insert template" }))
		map("n", "<leader>nf", ":Obsidian follow<CR>", vim.tbl_extend("force", mopts, { desc = "Follow link" }))
		map("n", "<leader>nc", ":Telescope bibtex<CR>", vim.tbl_extend("force", mopts, { desc = "Insert citation" }))
		map("n", "<leader>nb", ":Telescope bibtex<CR>", vim.tbl_extend("force", mopts, { desc = "Search bibliography" }))
	end,
}

return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	ft = "markdown",
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
	},

	config = function(_, opts)
		local obsidian = require("obsidian")
		obsidian.setup(opts)

		-- Keymaps
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true, desc = "Obsidian" }

		map("n", "<leader>nn", ":Obsidian new<CR>", vim.tbl_extend("force", opts, { desc = "New note" }))
		map("n", "<leader>no", ":Obsidian open<CR>", vim.tbl_extend("force", opts, { desc = "Open note" }))
		map("n", "<leader>nt", ":Obsidian tag<CR>", vim.tbl_extend("force", opts, { desc = "Tag" }))
		map("n", "<leader>nT", ":Obsidian today<CR>", vim.tbl_extend("force", opts, { desc = "Tag" }))
		map("n", "<leader>ns", ":Obsidian search<CR>", vim.tbl_extend("force", opts, { desc = "Search" }))
		map("n", "<leader>nl", ":Obsidian links<CR>", vim.tbl_extend("force", opts, { desc = "List links" }))
		map("n", "<leader>nr", ":Obsidian rename<CR>", vim.tbl_extend("force", opts, { desc = "Rename note" }))
	end,
}

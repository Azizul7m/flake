return {
	"obsidian-nvim/obsidian.nvim",
	version = "v3.16.5", -- use latest release, remove to use latest commit
	cmd = { "Obsidian" }, -- Load the plugin when using :Obsidian directly
	keys = {
		{ "<leader>ooo", "<cmd>Obsidian quick_switch<CR>", desc = "Obsidian quick switch" },
		{ "<leader>oon", "<cmd>Obsidian new<CR>", desc = "Obsidian new note" },
		{ "<leader>oos", "<cmd>Obsidian search<CR>", desc = "Obsidian search" },
		{ "<leader>oot", "<cmd>Obsidian today<CR>", desc = "Obsidian today" },
		{ "<leader>ooy", "<cmd>Obsidian yesterday<CR>", desc = "Obsidian yesterday" },
		{ "<leader>ooT", "<cmd>Obsidian tomorrow<CR>", desc = "Obsidian tomorrow" },
		{ "<leader>oow", "<cmd>Obsidian workspace<CR>", desc = "Obsidian workspace" },
		{ "<leader>oof", "<cmd>Obsidian follow_link<CR>", desc = "Obsidian follow link" },
		{ "<leader>oob", "<cmd>Obsidian backlinks<CR>", desc = "Obsidian backlinks" },
		{ "<leader>ool", "<cmd>Obsidian links<CR>", desc = "Obsidian links" },
		{ "<leader>ooc", "<cmd>Obsidian toc<CR>", desc = "Obsidian table of contents" },
		{ "<leader>oox", "<cmd>Obsidian toggle_checkbox<CR>", desc = "Obsidian toggle checkbox" },
		{ "<leader>oop", "<cmd>Obsidian paste_img<CR>", desc = "Obsidian paste image" },
		{ "<leader>oor", "<cmd>Obsidian rename<CR>", desc = "Obsidian rename note" },
		{ "<leader>ooN", "<cmd>Obsidian new_from_template<CR>", desc = "Obsidian new from template" },
		{ "<leader>ooi", "<cmd>Obsidian template<CR>", desc = "Obsidian insert template" },
		{
			"<leader>oog",
			function()
				require("obsidian.actions").smart_action()
			end,
			desc = "Obsidian smart action",
		},
	},
	---@module 'obsidian'
	---@type obsidian.config
	opts = {
		legacy_commands = false, -- this will be removed in 4.0.0
		picker = {
			name = "snacks.picker", -- use snacks picker
			-- name = "telescope.nvim",   -- or telescope
			-- name = "fzf-lua",     -- or fzf-lua
			-- name = "mini.pick",   -- or mini.pick
		},
		workspaces = {
			{
				name = "personal",
				path = "~/.notes",
			},
			{
				name = "work",
				path = "~/.notes/work",
			},
		},
		templates = {
			folder = "templates",
			date_format = "YYYY-MM-DD",
			time_format = "HH:mm",
			substitutions = {
				yesterday = function()
					return require("obsidian.util").format_date(os.time() - 86400, "YYYY-MM-DD")
				end,
				tomorrow = function()
					return require("obsidian.util").format_date(os.time() + 86400, "YYYY-MM-DD")
				end,
			},
			customizations = {
				daily = { notes_subdir = "daily" },
				meeting = { notes_subdir = "meetings" },
				project = { notes_subdir = "org" },
				learning = { notes_subdir = "programing" },
				research = { notes_subdir = "Research" },
				todo = { notes_subdir = "TODO" },
				weekly = { notes_subdir = "daily" },
			},
		},
		daily_notes = {
			folder = "daily",
			template = "daily",
			default_tags = { "daily" },
			workdays_only = false,
		},
	},
	config = function(_, opts)
		require("obsidian").setup(opts)
		local group = vim.api.nvim_create_augroup("obsidian_conceallevel", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "markdown", "obsidian" },
			group = group,
			callback = function()
				vim.opt_local.conceallevel = 2
			end,
		})
		if vim.tbl_contains({ "markdown", "obsidian" }, vim.bo.filetype) then
			vim.opt_local.conceallevel = 2
		end
	end,
}

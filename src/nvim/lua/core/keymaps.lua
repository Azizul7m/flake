local map = vim.keymap.set
local utils = require("core.utils")

local nvim_config = utils.find_directory("~/.config/nvim", "Neovim Config")
local find_notes = utils.find_directory("~/.notes", "Notes")

-- Quick escape from insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Window management
map({ "n", "x", "t" }, "<leader>w", "<C-w>", { desc = "Window management" })
map({ "n", "x", "t" }, "<leader>b[", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map({ "n", "x", "t" }, "<leader>b]", "<cmd>bnext<CR>", { desc = "Next buffer" })
map({ "n", "v" }, "<M-j>", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })

-- Telescope mappings
map({ "n", "v", "i", "t" }, "<M-<space>>", "<cmd>Telescope<CR>", { desc = "Telescope" })
map("n", "<leader><space>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>.", "<cmd>Telescope file_browser<CR>", { desc = "File browser" })

-- LSP mappings
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<M-Enter>", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Diagnostic mappings
map("n", "<M-p>", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "<M-n>", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "<M-N>", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Workspace Diagnostic" })

-- Find
map({ "n" }, "<leader>fc", nvim_config, { desc = "Edit Neovim config" })
map({ "n" }, "<leader>fn", find_notes, { desc = "Find Notes" })
map({ "n", "v" }, "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find projects" })

-- File management
map({ "n", "v", "t" }, "<M-->", "<cmd>Neotree toggle<CR>", { desc = "Neotree file manager" })
map({ "n", "v" }, "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Oil file manager" })

-- add toggle bindings
map("n", "<leader>tt", "<cmd>terminal<CR>", { desc = "Terminal" })
--please add vimix terminal bindings
map("n", "<leader>tv", "<cmd>VimuxTogglePane<CR>", { desc = "Toggle Vimix terminal" })
map("n", "<leader>tl", "<cmd>Lazy<CR>", { desc = "Toggle Lazy.nvim" })
map("n", "<leader>td", "<cmd>DiffviewOpen<CR>", { desc = "Toggle Diffview" })

-- add Gitsigns toggle
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", { desc = "Git diff this" })
map("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Git hunk" })
map("n", "<leader>gb", "<cmd>Gitsigns toggle_deleted<CR>", { desc = "Toggle Gitsigns deleted" })
map("n", "<leader>gl", "<cmd>Gitsigns setloclist<CR>", { desc = "Set Gitsigns loclist" })
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Git hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset Git hunk" })
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage Git hunk" })
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "Undo stage Git hunk" })
map("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit Status" })
map("n", "<leader>gc", "<cmd>Gitsigns commit<CR>", { desc = "Git commit" })
map("n", "<leader>gf", "<cmd>Gitsigns fetch<CR>", { desc = "Git fetch" })

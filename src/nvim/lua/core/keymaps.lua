local map = vim.keymap.set
local utils = require("core.utils")

local find_notes = utils.find_directory("~/.notes", "Notes")

-- Quick escape from insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Terminal
map("t", "jk", "<C-\\><C-n>", { desc = "Normal mode in Terminal" })
map({ "t", "n", "v" }, "<M-t>", "<cmd>lua Snacks.terminal.toggle()<CR>", { desc = "Toggle Terminal" })
map("t", "<M-n>", "<cmd>lua Snacks.terminal.open()<CR>", { desc = "Open new Snacks Terminal" })

-- Window management
map({ "n", "x", "t" }, "<leader>w", "<C-w>", { desc = "Window management" })
map({ "n", "x", "t" }, "<leader>b[", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map({ "n", "x", "t" }, "<leader>b]", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Diagnostic mappings
map("n", "<M-p>", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "<M-n>", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "<M-N>", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Workspace Diagnostic" })

-- Find
map({ "n" }, "<leader>fn", find_notes, { desc = "Find Notes" })

-- Toggle
map({ "n", "v", "t" }, "-", "<cmd>lua Snacks.explorer()<CR>", { desc = "Snacks file manager" })
map({ "n", "v", "t" }, "_", "<cmd>lua MiniFiles.open()<CR>", { desc = "MiniFiles file manager" })
map({ "i", "n", "t" }, "<M-x>", "<cmd>lua Snacks.picker()<CR>", { desc = "Snacks picker" })
map("n", "<leader>tl", "<cmd>Lazy<CR>", { desc = "Lazy.nvim" })
map("n", "<leader>tbd", "<cmd>DBUIToggle<CR>", { desc = "DBUIToggle" })
map("n", "<leader>tbo", "<cmd>DBUIFindBuffer<CR>", { desc = "DBUIFindBuffer" })
map("n", "<leader>tba", "<cmd>DBUIAddConnection<CR>", { desc = "DBUIAddConnection" })
map({ "n", "t", "x" }, "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })

-- LSP
local lsp = vim.lsp
map("n", "<leader>ca", lsp.buf.code_action, { desc = "Lsp Code action" })
map("n", "<leader>cd", lsp.buf.definition, { desc = "Lsp Definition" })
map("n", "<leader>cD", lsp.buf.declaration, { desc = "Lsp Declaration" })
map("n", "<leader>ci", lsp.buf.implementation, { desc = "Lsp Implementation" })
map("n", "<leader>hs", lsp.buf.signature_help, { desc = "Lsp Signature help" })
map("n", "<leader>ch", lsp.buf.document_highlight, { desc = "Lsp Documente highlight" })
map("n", "<leader>rv", lsp.buf.rename, { desc = "Lsp Rename" })
map("n", "<leader>cf", lsp.buf.format, { desc = "Lsp Format" })
